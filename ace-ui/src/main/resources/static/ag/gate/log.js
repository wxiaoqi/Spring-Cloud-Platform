var gateLog = {
    baseUrl: "/back/gateLog",
    entity: "gateLog",
    tableId: "gateLogTable",
    toolbarId: "toolbar",
    unique: "id",
    order: "asc",
    currentItem: {}
};
gateLog.columns = function () {
    return [{
        checkbox: true
    }, {
        field: 'menu',
        title: '菜单'
    }, {
        field: 'opt',
        title: '动作'
    }, {
        field: 'uri',
        title: 'uri'
    }, {
        field: 'crtName',
        title: '操作人'
    }, {
        field: 'crtTime',
        title: '操作时间'
    }, {
        field: 'crtHost',
        title: '操作IP'
    }];
};
gateLog.queryParams = function (params) {
    if (!params)
        return {
            name: $("#name").val()
        };
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        limit: params.limit, //页面大小
        offset: params.offset, //页码
        name: $("#name").val()
    };
    return temp;
};

gateLog.init = function () {

    gateLog.table = $('#' + gateLog.tableId).bootstrapTable({
        url: gateLog.baseUrl + '/page', //请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + gateLog.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true, //是否显示分页（*）
        sortable: false, //是否启用排序
        sortOrder: gateLog.order, //排序方式
        queryParams: gateLog.queryParams,//传递参数（*）
        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageSize: 50, //每页的记录行数（*）
        pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
        search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: false, //是否显示所有的列
        showRefresh: true, //是否显示刷新按钮
        minimumCountColumns: 2, //最少允许的列数
        clickToSelect: true, //是否启用点击选中行
        uniqueId: gateLog.unique, //每一行的唯一标识，一般为主键列
        showToggle: true, //是否显示详细视图和列表视图的切换按钮
        cardView: false, //是否显示详细视图
        detailView: false, //是否显示父子表
        columns: gateLog.columns()
    });
};
layui.use(['form', 'layedit', 'laydate'], function () {
    gateLog.init();
});