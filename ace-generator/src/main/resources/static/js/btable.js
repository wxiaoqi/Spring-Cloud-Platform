/** BTable.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
layui.define(['element', 'common', 'paging', 'form'], function (exports) {
    "use strict";
    var $ = layui.jquery,
        layerTips = parent.layer === undefined ? layui.layer : parent.layer,
        layer = layui.layer,
        element = layui.element(),
        common = layui.common,
        paging = layui.paging(),
        form = layui.form();

    var BTable = function () {
		//默认配置 
        this.config = {
            elem: undefined, //容器
            params: {},//发送到服务端的额外参数
            columns: [],//配置的数据列
            openWait: false,//是否打开等待框
            url: undefined, //数据源地址
            type: 'GET', //读取方式
            even: false, //是否开启偶数行背景
            skin: undefined, //风格样式 ，可选参数 line/row/nob
            field: 'ID', //主键属性名
            paged: false, //是否显示分页组件
            singleSelect: false, //是否只能选择一行
            checkbox: true, //显示多选
            onSuccess: undefined //渲染成功后的回调
        };
        this.v = '1.0.1';
    };
	/**
	 * 配置BTable
	 * @param {Object} options
	 */
    BTable.prototype.set = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
	/**
	 * 渲染table
	 */
    BTable.prototype.render = function () {
        var that = this;
        var _config = that.config;

        var columns = _config.columns;
        var th = '';
        for (var i = 0; i < columns.length; i++) {
            if (columns[i].sortable) {
                th += '<th data-name="' + columns[i].field + '">' + columns[i].fieldName + '<div class="btable-order"><div class="up" title="升序"><i class="fa fa-sort-asc" aria-hidden="true"></i></div ><div class="down" title="倒序"><i class="fa fa-sort-desc" aria-hidden="true"></i></div></div></th>';
            } else {
                th += '<th>' + columns[i].fieldName + '</th>';
            }
        }
        if (_config.checkbox && !_config.singleSelect) {
            th = '<th style="width:28px;"><input type="checkbox" lay-filter="allselector" lay-skin="primary" /></th><th style="width:28px;">序号</th>' + th;
        } else if (_config.checkbox) {
            th = '<th style="width:28px;">#</th><th style="width:28px;">序号</th>' + th;
        } else {
            th = '<th style="width:28px;">序号</th>' + th;
        }
        var tpl = '<div class="btable">';
        if (_config.skin !== undefined && (_config.skin === 'line' || _config.skin === 'row' || _config.skin === 'nob') && _config.even) {
            tpl += '<table class="layui-table layui-form" lay-even lay-skin="' + _config.skin + '">';
        } else if (_config.skin !== undefined && (_config.skin === 'line' || _config.skin === 'row' || _config.skin === 'nob')) {
            tpl += '<table class="layui-table layui-form" lay-skin="' + _config.skin + '">';
        } else if (_config.even) {
            tpl += '<table class="layui-table layui-form" lay-even>';
        } else {
            tpl += '<table class="layui-table layui-form">';
        }
        tpl += '<thead><tr>' + th + '</tr></thead>';
        tpl += '<tbody class="btable-content"></tbody>';
        tpl += '</table>';
        if (_config.paged) {
            tpl += '<div data-type="paged" class="btable-paged"></div>';
        }
        tpl += '</div>';
        $(_config.elem).html(tpl);
        paging.init({
            url: _config.url, //地址
            elem: '.btable-content', //内容容器
            type: _config.type,
            openWait: _config.openWait,
            tempType: 1,
            params: _config.params,
            fail: _config.onFail,
            complate: _config.onComplate,
            serverError: _config.onServerError,
            tempElem: getTpl({
                columns: _config.columns,
                checkbox: _config.checkbox,
                field: _config.field
            }), //模块容器
            paged: _config.paged,
            pageConfig: { //分页参数配置
                skip: true,
                elem: $(_config.elem).find('div[data-type=paged]'), //'#paged', //分页容器
                pageSize: _config.pageSize || 15 //分页大小
            },
            //数据渲染之前的处理
            renderBefore: function (html, callback, data) {
                var dataId = new Date().getTime();
                //创建临时节点
                $('body').append('<table id="' + dataId + '" style="display:none;">' + html + '</table>');
                var columns = _config.columns;
                for (var i = 0; i < columns.length; i++) {
                    if (columns[i].format) {
                        $('#' + dataId).find('tr').each(function () {
                            var id = $(this).find('input[data-item=id]').val();
                            var $field = $(this).children('td[data-field=' + columns[i].field + ']');
                            var obj = undefined;
                            for (var j = 0; j < data.length; j++) {
                                if (data[j].Id == id || data[j].ID == id || data[j].id == id) {
                                    obj = data[j];
                                    break;
                                }
                            }
                            $field.html(columns[i].format(id, obj));
                        });
                    }
                }
                //执行回调函数
                callback($('#' + dataId).find('tbody').html());
                //删除临时节点
                $('#' + dataId).remove();
            },
            success: function () { //完成的回调
                //处理排序
                $(_config.elem).find('thead > tr > th').each(function () {
                    var $that = $(this);
                    var field = $that.data('name');
                    $that.find('div.up').off('click').on('click', function () {
                        $(this).hide();
                        $(this).siblings('div.down').show();
                        $that.siblings('th').each(function () {
                            if ($(this).attr('data-name')) {
                                $(this).find('div.up').show();
                                $(this).find('div.down').show();
                            }
                        });
                        paging.get({
                            sort: field,
                            order: 'asc'
                        });
                    });
                    $that.find('div.down').off('click').on('click', function () {
                        $(this).hide();
                        $(this).siblings('div.up').show();
                        $that.siblings('th').each(function () {
                            if ($(this).attr('data-name')) {
                                $(this).find('div.up').show();
                                $(this).find('div.down').show();
                            }
                        });
                        paging.get({
                            sort: field,
                            order: 'desc'
                        });
                    });
                });
                //重新渲染复选框
                form.render('checkbox');
                form.on('checkbox(allselector)', function (data) {
                    var elem = data.elem;

                    $(_config.elem).find('tbody.btable-content').children('tr').each(function () {
                        var $that = $(this);
                        //全选或反选
                        $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
                        form.render('checkbox');
                    });
                });
                if (_config.checkbox) {
                    //绑定选择行事件
                    $(_config.elem).find('tbody.btable-content').children('tr').each(function (e) {
                        var $that = $(this);
                        $that.on('click', function () {
                            //只允许选择一行
                            if (_config.singleSelect) {
                                $that.siblings().each(function () {
                                    $(this).children('td').eq(0).children('input[type=checkbox]')[0].checked = false
                                });
                                $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = true;
                            } else {
                                //获取当前的状态
                                var currState = $that.children('td').eq(0).children('input[type=checkbox]')[0].checked;
                                $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = !currState;

                                //当前已选择的总行数
                                var cbxCount = 0;
                                $that.parent('tbody').children('tr').each(function () {
                                    var $that = $(this);
                                    if ($that.children('td:first-child').children('input')[0].checked) {
                                        cbxCount++;
                                    }
                                });
                                $(_config.elem).find('thead').children('tr').children('th:first-child').children('input[type=checkbox]')[0].checked =
                                    $that.parent('tbody').children('tr').length === cbxCount;
                            }
                            form.render('checkbox');
                        });
                    });
                }
                //渲染成功后的回调
                if (_config.onSuccess)
                    _config.onSuccess($(_config.elem).find('tbody.btable-content'));
            }
        });
        return that;
    };
	/**
	 * get方法，一般用到添加额外的条件时用到，比如搜索功能
	 */
    BTable.prototype.get = function (options) {
        paging.get(options);
    };
	/**
	 * 获取选择的行。
	 */
    BTable.prototype.getSelected = function (callback) {
        var that = this;
        var _config = that.config;
        if (!_config.singleSelect)
            return callback({});
        var $tbody = $(_config.elem).find('tbody.btable-content');
        $tbody.children('tr').each(function () {
            var $that = $(this);
            var $input = $that.children('td:first-child').children('input')
            if ($input[0].checked) {
                callback({
                    elem: $that,
                    id: $input.data('id')
                });
            }
        });
        return that;
    };
    /**
	 * 是否有选中的行
	 */
    BTable.prototype.isSelected = function () {
        var that = this;
        var _config = that.config;
        if (!_config.singleSelect)
            return callback({});
        var $tbody = $(_config.elem).find('tbody.btable-content');
        var flag = false;
        $tbody.children('tr').each(function () {
            var $that = $(this);
            var $input = $that.children('td:first-child').children('input')
            if ($input[0].checked) {
                flag = true;
            }
        });
        return flag;
    };
	/**
	 * 获取选择的所有行数据
	 */
    BTable.prototype.getSelections = function (callback) {
        var that = this;
        var _config = that.config;
        var $tbody = $(_config.elem).find('tbody.btable-content');
        var dom = [];
        var ids = [];
        var index = 0;
        $tbody.children('tr').each(function () {
            var $that = $(this);
            var $input = $that.children('td:first-child').children('input');
            if ($input[0].checked) {
                dom[index] = $that;
                ids[index] = $input.data('id');
                index++;
            }
        });
        return callback({
            elem: dom,
            ids: ids,
            count: dom.length
        });
    };

	/**
	 * 获取模板
	 * @param {Object} options
	 */
    function getTpl(options) {
        var columns = options.columns;
        var tpl = '{{# if(d.list.length>0 && d.list!=undefined){ }}';
        tpl += '{{# layui.each(d.list, function(index, item){ }}';
        var tds = '';
        for (var i = 0; i < columns.length; i++) {
            tds += '<td data-field="' + columns[i].field + '">{{ item.' + columns[i].field + ' }}</td>';
        }
        if (options.checkbox) {
            tds = '<td><input type="checkbox" data-item="id" data-id="{{ item.' + options.field + ' }}" lay-skin="primary" /></td><td>{{ (index+1) }}</td>' + tds;
        } else {
            tds = '<td style="display:none;"><input type="hidden" data-item="id" value="{{ item.' + options.field + ' }}" data-id="{{ item.' + options.field + ' }}" name="id" /></td><td>{{ (index+1) }}</td>' + tds;
        }
        tpl += '<tr>' + tds + '</tr>'
        tpl += '{{# }); }}';
        tpl += '{{# }else{ }}';
        var colLength = options.checkbox && !options.singleSelect ? columns.length + 1 : columns.length;
        tpl += '<tr col="' + colLength + '">暂无数据.</tr>';
        tpl += '{{# } }}';
        return tpl;
    }

    var btable = new BTable();

    exports('btable', function (options) {
        return btable.set(options);
    });
});