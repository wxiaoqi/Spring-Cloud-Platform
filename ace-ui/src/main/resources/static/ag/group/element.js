var authorityElement = {
    baseUrl: "/back/element",
    entity: "element",
    tableId: "elementTable",
    toolbarId: "elementToolbar",
    unique: "id",
    order: "asc",
    currentItem: {}
};
authorityElement.columns = function () {
    return [{
        checkbox: true
    }, {
        field: 'name',
        title: '按钮'
    }, {
        field: 'code',
        title: '权限编码'
    }, {
        field: 'uri',
        title: '资源路径'
    }, {
        field: 'method',
        title: '方式'
    }];
};
authorityElement.queryParams = function (params) {
    if (!params)
        return {
            menuId: group.currentAuthorityMenu.id
        };
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        limit: params.limit, //页面大小
        offset: (params.offset / params.limit)+1, //页码
        menuId: group.currentAuthorityMenu.id
    };
    return temp;
};

authorityElement.init = function () {
    authorityElement.table = $('#' + authorityElement.tableId).bootstrapTable({
        url: authorityElement.baseUrl + '/page', //请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + authorityElement.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true, //是否显示分页（*）
        sortable: false, //是否启用排序
        sortOrder: authorityElement.order, //排序方式
        queryParams: authorityElement.queryParams,//传递参数（*）
        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageSize: 20, //每页的记录行数（*）
        pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
        search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: false, //是否显示所有的列
        showRefresh: false, //是否显示刷新按钮
        minimumCountColumns: 2, //最少允许的列数
        clickToSelect: true, //是否启用点击选中行
        uniqueId: authorityElement.unique, //每一行的唯一标识，一般为主键列
        showToggle: true, //是否显示详细视图和列表视图的切换按钮
        cardView: false, //是否显示详细视图
        detailView: false, //是否显示父子表
        columns: authorityElement.columns(),
        onUncheck: authorityElement.onUncheck,
        onCheck: authorityElement.onCheck,
        checkboxHeader: false
        //onCheckAll: authorityElement.onCheckAll,
        //onUncheckAll: authorityElement.onUncheckAll
    });
    $('#' + authorityElement.tableId).on('load-success.bs.table', function (data) {
        $.get(group.baseUrl + "/" + group.currentItem.id + "/authority/element", null, function (data) {
                if (data.rel) {
                    authorityElement.table.bootstrapTable("checkBy", {field: "id", values: data.result});
                }
            }
        )
        ;
    });
};

authorityElement.refresh = function () {
    authorityElement.table.bootstrapTable("refresh");
}
;
authorityElement.onCheck = function (row, $element) {
    var menuId = group.currentAuthorityMenu.id;
    $.post(group.baseUrl + "/" + group.currentItem.id + "/authority/element/add", {
        menuId: menuId,
        elementId: row.id
    }, function (data) {
        if (!data.rel) {
            layui.use(['form', 'layedit', 'laydate', 'element'], function () {
                var layerTips = parent.layer === undefined ? layui.layer : parent.layer;
                layerTips.tips("后端异常！");
            });
        }
    });
};

authorityElement.onUncheck = function (row, $element) {
    var menuId = group.currentAuthorityMenu.id;
    $.ajax({
            url: group.baseUrl + "/" + group.currentItem.id + "/authority/element/remove",
            type: "POST",
            data: {
                menuId: menuId,
                elementId: row.id
            },
            success: function (data) {
                if (!data.rel) {
                    layui.use(['form', 'layedit', 'laydate', 'element'], function () {
                        var layerTips = parent.layer === undefined ? layui.layer : parent.layer;
                        layerTips.tips("后端异常！");
                    });
                }
            }
        }
    )
    ;
}
;
//authorityElement.onCheckAll = function (rows) {
//    console.log(rows);
//    var menuId = group.currentAuthorityMenu.id;
//    var eleIds =[];
//    for(var i=0;i<rows.length;i++){
//        eleIds.push(rows[i].id);
//    }
//    //$.ajax({
//    //        url: group.baseUrl + "/" + group.currentItem.id + "/authority/element/add",
//    //        type: "POST",
//    //        data: {
//    //            menuId: menuId,
//    //            element: eleIds
//    //        },
//    //        success: function (data) {
//    //            if (!data.rel) {
//    //                layui.use(['form', 'layedit', 'laydate', 'element'], function () {
//    //                    var layerTips = parent.layer === undefined ? layui.layer : parent.layer;
//    //                    layerTips.tips("后端异常！");
//    //                });
//    //            }
//    //        }
//    //    }
//    //)
//    //;
//};
//authorityElement.onUncheckAll = function (rows) {
//    var menuId = group.currentAuthorityMenu.id;
//    var eleIds =[];
//    for(var i=0;i<rows.length;i++){
//        eleIds.push(rows[i].id);
//    }
//    //$.ajax({
//    //        url: group.baseUrl + "/" + group.currentItem.id + "/authority/element/remove",
//    //        type: "POST",
//    //        data: {
//    //            menuId: menuId,
//    //            element: eleIds
//    //        },
//    //        success: function (data) {
//    //            if (!data.rel) {
//    //                layui.use(['form', 'layedit', 'laydate', 'element'], function () {
//    //                    var layerTips = parent.layer === undefined ? layui.layer : parent.layer;
//    //                    layerTips.tips("后端异常！");
//    //                });
//    //            }
//    //        }
//    //    }
//    //)
//    //;
//};