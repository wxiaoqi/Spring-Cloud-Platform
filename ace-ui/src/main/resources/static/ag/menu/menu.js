var menu = {
    baseUrl: "/back/menu",
    entity: "menu",
    tableId: "menuTable",
    toolbarId: "toolbar",
    unique: "id",
    order: "asc",
    currentItem: {},
    code: "id",
    parentCode: "parentId",
    rootValue: -1,
    explandColumn: 1
};
menu.columns = function () {
    return [
        {
            field: 'selectItem',
            radio: true
        }, {
            field: 'title',
            title: '菜单'
        }, {
            field: 'code',
            title: '编码'
        }, {
            field: 'href',
            title: 'url'
        }];
};
//得到查询的参数
menu.queryParams = function () {
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        title: $("#title").val()
    };
    return temp;
};
menu.init = function () {
    menu.table = $('#' + menu.tableId).bootstrapTreeTable({
        id: menu.unique,// 选取记录返回的值
        code: menu.code,// 用于设置父子关系
        parentCode: menu.parentCode,// 用于设置父子关系
        rootCodeValue: menu.rootValue,
        url: menu.baseUrl + '/list', //请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + menu.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        ajaxParams: menu.queryParams,//传递参数（*）
        expandColumn: menu.explandColumn,//在哪一列上面显示展开按钮,从0开始
        expandAll: true,
        columns: menu.columns(),
        clickRow: menu.clickRow
    });
};
menu.select = function (layerTips) {
    var rows = menu.table.bootstrapTreeTable('getSelections');
    if (rows.length == 1) {
        menu.currentItem = rows[0];
        return true;
    } else {
        layerTips.msg("请选中一行");
        return false;
    }
};
menu.clickRow = function () {
    element.refresh();
};
menu.refresh = function () {
    menu.table.bootstrapTreeTable("refresh");
};


layui.use(['form', 'layedit', 'laydate'], function () {
    menu.init();
    $('#' + menu.tableId + '>.treegrid-tbody>tr').click(function () {
        var rows = menu.table.bootstrapTreeTable('getSelections');
        menu.currentItem = rows[0];
        alert();
    });
    var allMenu = null;
    var editIndex;
    $.get(menu.baseUrl + '/all', null, function (data) {
        allMenu = data;
    });
    var layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
        layer = layui.layer, //获取当前窗口的layer对象
        form = layui.form(),
        layedit = layui.layedit;
//初始化页面上面的按钮事件
    $('#btn_query').on('click', function () {
        menu.table.bootstrapTreeTable('refresh', menu.queryParams());
    });
    var addBoxIndex = -1;
    $('#btn_add').on('click', function () {
        if (addBoxIndex !== -1)
            return;
        var rows = menu.table.bootstrapTreeTable('getSelections');
        var id = "-1";
        if (rows.length == 1) {
            id = rows[0].id;
        }
        //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
        $.get(menu.entity + '/edit', null, function (form) {
            addBoxIndex = layer.open({
                type: 1,
                title: '添加菜单',
                content: form,
                btn: ['保存', '取消'],
                shade: false,
                offset: ['20px', '20%'],
                area: ['600px', '400px'],
                maxmin: true,
                yes: function (index) {
                    layedit.sync(editIndex);
                    //触发表单的提交事件
                    $('form.layui-form').find('button[lay-filter=edit]').click();
                },
                full: function (elem) {
                    var win = window.top === window.self ? window : parent.window;
                    $(win).on('resize', function () {
                        var $this = $(this);
                        elem.width($this.width()).height($this.height()).css({
                            top: 0,
                            left: 0
                        });
                        elem.children('div.layui-layer-content').height($this.height() - 95);
                    });
                },
                success: function (layero, index) {
                    var form = layui.form();
                    editIndex = layedit.build('description_editor');
                    form.render();
                    for (var i = 0; i < allMenu.length; i++)
                        layero.find('#parentId').append('<option value="' + allMenu[i].id + '" >' + allMenu[i].title + '</option>');
                    layero.find("select[name='parentId']").val(id);
                    form.render('select');
                    form.on('submit(edit)', function (data) {
                        $.ajax({
                            url: menu.baseUrl,
                            type: 'post',
                            data: data.field,
                            dataType: "json",
                            success: function () {
                                layerTips.msg('保存成功');
                                layer.close(addBoxIndex);
                                menu.refresh();
                            }

                        });
                        //这里可以写ajax方法提交表单
                        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                    });
                },
                end: function () {
                    addBoxIndex = -1;
                }
            });
        });
    });
    $('#btn_edit').on('click', function () {
        if (addBoxIndex !== -1)
            return;
        var rows = menu.table.bootstrapTreeTable('getSelections');
        if (menu.select(layerTips)) {
            var id = menu.currentItem.id;
            $.get(menu.baseUrl + '/' + id, null, function (data) {
                console.log(data);
                var result = data.result;
                $.get(menu.entity + '/edit', null, function (form) {
                    addBoxIndex = layer.open({
                        type: 1,
                        title: '编辑菜单',
                        content: form,
                        btn: ['保存', '取消'],
                        shade: false,
                        offset: ['20px', '20%'],
                        area: ['600px', '400px'],
                        maxmin: true,
                        yes: function (index) {
                            layedit.sync(editIndex);
                            //触发表单的提交事件
                            $('form.layui-form').find('button[lay-filter=edit]').click();
                        },
                        full: function (elem) {
                            var win = window.top === window.self ? window : parent.window;
                            $(win).on('resize', function () {
                                var $this = $(this);
                                elem.width($this.width()).height($this.height()).css({
                                    top: 0,
                                    left: 0
                                });
                                elem.children('div.layui-layer-content').height($this.height() - 95);
                            });
                        },
                        success: function (layero, index) {
                            var form = layui.form();
                            setFromValues(layero, result);
                            layero.find('#description_editor').val(result.description);
                            editIndex = layedit.build('description_editor');
                            for (var i = 0; i < allMenu.length; i++)
                                layero.find('#parentId').append('<option value="' + allMenu[i].id + '" >' + allMenu[i].title + '</option>');
                            layero.find("select[name='parentId']").val(result['parentId']);
                            form.render('select');
                            layero.find(":input[name='code']").attr("disabled", "");
                            form.render();

                            form.on('submit(edit)', function (data) {
                                $.ajax({
                                    url: menu.baseUrl + '/' + result.id,
                                    type: 'put',
                                    data: data.field,
                                    dataType: "json",
                                    success: function () {
                                        layerTips.msg('更新成功');
                                        layer.close(addBoxIndex);
                                        menu.refresh();
                                    }

                                });
                                //这里可以写ajax方法提交表单
                                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                            });
                        },
                        end: function () {
                            addBoxIndex = -1;
                        }
                    });
                });
            });
        }
    });
    $('#btn_del').on('click', function () {
        if (menu.select(layerTips)) {
            var id = menu.currentItem.id;
            layer.confirm('确定删除数据吗？', null, function (index) {
                $.ajax({
                    url: menu.baseUrl + "/" + id,
                    type: "DELETE",
                    success: function (data) {
                        console.log(data);
                        if (data.rel == true) {
                            layerTips.msg("移除成功！");
                            location.reload();
                        } else {
                            layerTips.msg("移除失败！")
                            location.reload();
                        }
                    }
                });
                layer.close(index);
            });
        }
    });
})
;
