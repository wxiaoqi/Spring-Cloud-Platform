var group = {
    baseUrl: "/back/group",
    entity: "group",
    tableId: "groupTable",
    toolbarId: "toolbar",
    unique: "id",
    order: "asc",
    currentItem: {},
    code: "id",
    parentCode: "parentId",
    rootValue: -1,
    explandColumn: 1,
    currentAuthorityMenu: {}
};
group.columns = function () {
    return [
        {
            field: 'selectItem',
            radio: true
        }, {
            field: 'name',
            title: '名称'
        }, {
            field: 'code',
            title: '编码'
        }, {
            field: 'type',
            title: '类型'
        }, {
            field: 'description',
            title: '描述'
        }];
};
//得到查询的参数
group.queryParams = function () {
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        name: $("#name").val(),
        groupType: group.groupType
    };
    return temp;
};
group.init = function () {
    group.table = $('#' + group.tableId).bootstrapTreeTable({
        id: group.unique,// 选取记录返回的值
        code: group.code,// 用于设置父子关系
        parentCode: group.parentCode,// 用于设置父子关系
        rootCodeValue: group.rootValue,
        url: group.baseUrl + '/list', //请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + group.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        ajaxParams: group.queryParams,//传递参数（*）
        expandColumn: group.explandColumn,//在哪一列上面显示展开按钮,从0开始
        expandAll: false,
        columns: group.columns()
    });
};
group.select = function (layerTips) {
    var rows = group.table.bootstrapTreeTable('getSelections');
    if (rows.length == 1) {
        group.currentItem = rows[0];
        return true;
    } else {
        layerTips.msg("请选中一行");
        return false;
    }
};
group.refresh = function () {
    group.table.bootstrapTreeTable('refresh', group.queryParams());
};


layui.use(['form', 'layedit', 'laydate', 'element'], function () {
    group.init();
    var allItems = null;
    var editIndex;
    var allGroupItems = null;
    $.get(group.baseUrl + '/all', null, function (data) {
        allItems = data;
    });
    var layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
        layer = layui.layer, //获取当前窗口的layer对象
        form = layui.form(),
        layedit = layui.layedit;

    var element = layui.element();
    $.get("/back/groupType/all", null, function (data) {
        var first = data[0].id;
        allGroupItems = data;
        for (var i = 0; i < data.length; i++) {
            element.tabAdd('groupType', {
                title: data[i].name
                , content: ""
                , id: data[i].id
            });
        }
        element.tabChange('groupType', first);
    });
    //一些事件监听
    element.on('tab(groupType)', function (data) {
        group.groupType = $('#groupTypeTab .layui-this').attr("lay-id");
        group.refresh();
    });
    //初始化页面上面的按钮事件
    $('#btn_query').on('click', function () {
        group.table.bootstrapTreeTable('refresh', group.queryParams());
    });
    var addBoxIndex = -1;
    $('#btn_add').on('click', function () {
        if (addBoxIndex !== -1)
            return;
        var rows = group.table.bootstrapTreeTable('getSelections');
        var id = "-1";
        if (rows.length == 1) {
            id = rows[0].id;
        }
        //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
        $.get(group.entity + '/edit', null, function (form) {
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
                    for (var i = 0; i < allItems.length; i++)
                        layero.find('#parentId').append('<option value="' + allItems[i].id + '" >' + allItems[i].name + '</option>');
                    for (var i = 0; i < allGroupItems.length; i++)
                        layero.find('#groupType').append('<option value="' + allGroupItems[i].id + '" >' + allGroupItems[i].name + '</option>');
                    layero.find("select[name='parentId']").val(id);
                    layero.find("select[name='groupType']").val(group.groupType);
                    form.render('select');
                    form.on('submit(edit)', function (data) {
                        $.ajax({
                            url: group.baseUrl,
                            type: 'post',
                            data: data.field,
                            dataType: "json",
                            success: function () {
                                layerTips.msg('保存成功');
                                layerTips.close(index);
                                location.reload();
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
        var rows = group.table.bootstrapTreeTable('getSelections');
        if (group.select(layerTips)) {
            var id = group.currentItem.id;
            $.get(group.baseUrl + '/' + id, null, function (data) {
                var result = data.result;
                $.get(group.entity + '/edit', null, function (form) {
                    layer.open({
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
                            for (var i = 0; i < allItems.length; i++)
                                layero.find('#parentId').append('<option value="' + allItems[i].id + '" >' + allItems[i].name + '</option>');
                            layero.find("select[name='parentId']").val(result['parentId']);
                            for (var i = 0; i < allGroupItems.length; i++)
                                layero.find('#groupType').append('<option value="' + allGroupItems[i].id + '" >' + allGroupItems[i].name + '</option>');
                            layero.find("select[name='groupType']").val(result['groupType']);
                            form.render('select');
                            layero.find(":input[name='code']").attr("disabled", "");
                            form.render();

                            form.on('submit(edit)', function (data) {
                                $.ajax({
                                    url: group.baseUrl + '/' + result.id,
                                    type: 'put',
                                    data: data.field,
                                    dataType: "json",
                                    success: function () {
                                        layerTips.msg('更新成功');
                                        layerTips.close(index);
                                        location.reload();
                                    }

                                });
                                //这里可以写ajax方法提交表单
                                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                            });
                        }
                    });
                });
            });
        }
    });
    $('#btn_del').on('click', function () {
        if (group.select(layerTips)) {
            var id = group.currentItem.id;
            layer.confirm('确定删除数据吗？', null, function (index) {
                $.ajax({
                    url: group.baseUrl + "/" + id,
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
    $('#btn_userManager').on("click", function () {
        if (group.select(layerTips)) {
            var id = group.currentItem.id;
            $.get(group.entity + '/user', null, function (form) {
                var index = layer.open({
                    type: 1,
                    title: '添加用户',
                    content: form,
                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['20px', '20%'],
                    area: ['600px', '400px'],
                    maxmin: true,
                    yes: function (index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function (elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function () {
                            debugger;
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
                        // 获取人员
                        $.get(group.baseUrl + '/' + id + "/user", null, function (data) {
                            if (!data.rel) {
                                layerTips.msg('获取数据异常！');
                                return;
                            }
                            var members = data.result.members;
                            var leaders = data.result.leaders;
                            var memOpts = "";
                            var leaOpts = "";
                            for (var i = 0; i < members.length; i++) {
                                // layero.find("#groupMember").append();
                                memOpts += '<option  value="' + members[i].id + '" selected>' + members[i].name + '</option>';
                            }
                            for (var i = 0; i < leaders.length; i++) {
                                leaOpts += '<option  value="' + leaders[i].id + '" selected>' + leaders[i].name + '</option>';
                            }
                            // 加载人员
                            layero.find("#groupMember").append(memOpts).trigger('change');
                            layero.find("#groupLeader").append(leaOpts).trigger('change');
                        });

                        form.on('submit(edit)', function (data) {
                            var vals = {};
                            var leas = layero.find("#groupLeader").val()
                            var mems = layero.find("#groupMember").val();
                            if (mems)
                                vals.members = mems.join();
                            if (leas)
                                vals.leaders = leas.join();
                            $.ajax({
                                url: group.baseUrl + '/' + id + "/user",
                                type: 'put',
                                data: vals,
                                dataType: "json",
                                success: function () {
                                    layerTips.msg('更新成功');
                                    layer.close(index);
                                    // location.reload();
                                }

                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                    }
                });
            });
        }
    });
    $('#btn_resourceManager').on("click", function () {
        if (group.select(layerTips)) {
            var id = group.currentItem.id;
            var nodeMap = {};
            $.get(group.entity + '/authority', null, function (form) {
                var index = layer.open({
                    type: 1,
                    title: '分配权限',
                    content: form,
                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['20px', '20%'],
                    area: ['600px', '400px'],
                    maxmin: true,
                    yes: function (index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function (elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function () {
                            debugger;
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
                        $.ajax({
                            type: "GET",
                            url: "/back/menu/authorityTree",
                            success: function (defaultData) {
                                authorityElement.init();
                                var $checkableTree = $('#menuTreeview').treeview({
                                    data: defaultData,
                                    levels: 1,
                                    showIcon: false,
                                    showCheckbox: true,
                                    multiSelect: false,
                                    levels: 5,
                                    state: {
                                        checked: true,
                                        disabled: true,
                                        expanded: true,
                                        selected: true
                                    },
                                    onNodeUnchecked: function (event, data) {

                                        var selectNodes = treeViewHelper.getChildrenNodeIdArr(data);//获取所有子节点
                                        if (selectNodes) { //子节点不为空，则选中所有子节点
                                            $('#menuTreeview').treeview('uncheckNode', [selectNodes, {silent: true}]);
                                        }
                                    },
                                    onNodeChecked: function (event, data) {
                                        group.currentAuthorityMenu = data;
                                        var selectNodes = treeViewHelper.getChildrenNodeIdArr(data);//获取所有子节点
                                        if (selectNodes) {
                                            $('#menuTreeview').treeview('checkNode', [selectNodes, {silent: true}]);
                                        }
                                        var parNodes = treeViewHelper.getParentIdArr("menuTreeview", data);
                                        if (parNodes) {
                                            $('#menuTreeview').treeview('checkNode', [parNodes, {silent: true}]);

                                        }
                                    },
                                    onNodeSelected: function(event, data) {
                                        group.currentAuthorityMenu = data;
                                        authorityElement.refresh();
                                    } ,
                                    onNodeUnselected: function(event, data) {
                                        group.currentAuthorityMenu = {};
                                        authorityElement.refresh();
                                    }
//
                                });
                                var findCheckableNodess = function () {
                                    return $checkableTree.treeview('search', [
                                        $('#input-check-node').val(), {
                                            ignoreCase: false,
                                            exactMatch: false
                                        }]);
                                };
                                var checkableNodes = findCheckableNodess();

                                $('#input-check-node').on('keyup', function (e) {
                                    checkableNodes = findCheckableNodess();
                                    $('.check-node')
                                        .prop('disabled', !(checkableNodes.length >= 1));
                                });
                                $.get(group.baseUrl + '/' + id + "/authority/menu", null, function (data) {
                                    if (data.rel) {
                                        var nodes = $('#menuTreeview').treeview('getUnselected', 0);
                                        var map = {};
                                        for (var i = 0; i < nodes.length; i++) {
                                            map[nodes[i].id] = nodes[i].nodeId;
                                            nodeMap[nodes[i].nodeId] = nodes[i];
                                        }
                                        for (var i = 0; i < data.result.length; i++) {
                                            var node = data.result[i];
                                            $('#menuTreeview').treeview('checkNode', [map[node.id], {silent: true}]);
                                        }
                                    }
                                });
                            }
                        });

                        form.on('submit(edit)', function (data) {
                            var menuList = [];
                            layero.find('#menuTreeview li').each(function(){
                                if($(this).hasClass("list-group-item node-menuTreeview node-checked")){
                                    menuList.push(nodeMap[parseInt($(this).attr('data-nodeid'))]);
                                }
                            });
                            $.ajax({
                                url: group.baseUrl + '/' + id + "/authority/menu",
                                type: 'POST',
                                data: {"menuTrees": JSON.stringify(menuList)},
                                dataType: "json",
                                success: function () {
                                    layerTips.msg('更新成功');
                                    layer.close(index);
                                    // location.reload();
                                }

                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                    },
                    end:function(){
                        group.currentAuthorityMenu = {};
                        element.currentItem = {};
                    }
                });
                layer.full(index);
            });
        }
    });
});
