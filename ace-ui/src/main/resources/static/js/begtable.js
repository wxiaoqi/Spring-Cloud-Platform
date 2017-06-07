layui.config({
	base: 'plugins/layui/modules/'
});
layui.define(['layer', 'laypage', 'icheck'], function(exports) {
	"use strict";
	var $ = layui.jquery,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage;
	/**
	 * @description begtable元素
	 */
	var ELEM = {
		table: 'beg-table',
		hover: 'beg-table-hovered',
		border: 'beg-table-bordered',
		strip: 'beg-table-striped'
	};
	/**
	 * @constructor begTable 构造函数
	 */
	var begTable = function() {
		this.config = {
			elem: undefined, //存放begtable的窗口，必填
			bordered: false, //是否加边框
			striped: false, //是否显示斑马线
			hovered: false, //鼠标悬停样式
			checked: false, //显示多选按钮
			checkboxClass: 'icheckbox_flat-green', //checkbox样式
			tips: '这是默认Tips',
			columns: undefined, // 数据列
			url: undefined, //远程地址
			data: undefined, //数据
			identity: undefined, // 标识字段
			paged: true, //启用分页功能
			type: 'get', //远程读取数据的方式
			pageSet: {
				jump: undefined, // 
				groups: 5,
			} //分页设置
		};
	};
	/**
	 * @description 设置
	 * @param {Object} options
	 */
	begTable.prototype.set = function(options) {
		var that = this;
		$.extend(true, that.config, options);
		return that;
	};
	/**
	 * @description 获取选择的行
	 */
	begTable.prototype.getSelectedRows = function() {
		console.log(this.config.tips);
	};
	/**
	 * 初始化begtable
	 */
	begTable.prototype.init = function() {
		var _that = this;
		var _config = _that.config;
		var elem = _config.elem;
		if(typeof(elem) !== 'string' && typeof(elem) !== 'object') {
			throwError('elem参数未定义或设置出错，具体设置格式请参考文档API.');
		}
		var $container;
		if(typeof(elem) === 'string') {
			$container = $(elem);
		}
		if(typeof(elem) === 'object') {
			$container = elem;
		}
		if($container.length === 0) {
			throwError('找不到elem参数配置的容器，请检查.');
		}
		if(typeof(_config.columns) !== 'object') {
			throwError('请配置columns参数，具体设置格式请参考文档API');
		}
		var tableClass = ELEM.table;
		if(_config.bordered) {
			tableClass += ' ' + ELEM.border;
		}
		if(_config.hovered) {
			tableClass += ' ' + ELEM.hover;
		}
		if(_config.striped) {
			tableClass += ' ' + ELEM.strip;
		}
		var tableTemp = '<table class="' + tableClass + '">';
		var columns = _config.columns;
		var theadTemp = '<thead><tr>';
		//添加全选按钮
		if(_config.checked) {
			theadTemp += '<th style="width:25px;"><input type="checkbox" id="begtable-selected-all"></th>'
		}
		for(var i = 0; i < columns.length; i++) {
			theadTemp += '<th>' + columns[i].title + '</th>'
		}
		theadTemp += '</tr></thead>';
		var tbodyTemp = '<tbody>';
		var data = _config.data;
		if(data !== undefined && typeof(data) === 'object') {
			for(var i = 0; i < data.length; i++) {
				var tr = '<tr>';
				if(_config.checked) {
					tr += '<td style="text-align: center;"><input type="checkbox" /></td>';
				}
				for(var j = 0; j < columns.length; j++) {
					tr += '<td>' + data[i][columns[j].field] + '</td>';
				}
				tr += '</tr>';
				tbodyTemp += tr;
			}
		}
		tbodyTemp += '</tbody>';
		tableTemp = tableTemp + theadTemp + tbodyTemp + '</table>';
		//渲染table
		$container.html('<div class="beg-table-box"><div class="beg-table-body">' + tableTemp + '</div></div>');
		//checkbox
		if(_config.checked) {
			//渲染checkbox
			$container.find('input[type=checkbox]').iCheck({
				checkboxClass: _config.checkboxClass
			});
		}
		//分页
		if(_config.paged) {
			var $tableBox = $container.children('.beg-table-box');
			$tableBox.append('<div class="beg-table-paged"></div>');
			loadData($tableBox, 1);
		} else {
			$container.find('.' + ELEM.table).css('margin-bottom', '0px');
		}

		//msgErrorTips('请对begtable返回正确的JSON字符');
		return _that;
	};
	begTable.prototype.getConfig = function() {
		return this.config;
	};
	/**
	 * 加载数据
	 * @param {Object} $tableBox
	 * @param {Number} page
	 */
	function loadData($tableBox, page) {
		//var that = '';
		/*$.ajax({
			type: that.config.type,
			success: function(result) {

			}
		});*/
		laypage({
			cont: $tableBox.find('.beg-table-paged'),
			curr: page,
			pages: 25, //总页数
			groups: 5, //连续显示分页数					
			jump: function(obj, first) {
				//得到了当前页，用于向服务端请求对应数据
				var curr = obj.curr;
				if(!first) {
					//layer.msg('第 '+ obj.curr +' 页');
					that.loadData()
				}
			}
		});
	}
	/**
	 * 抛出一个异常错误信息
	 * @param {String} msg
	 */
	function throwError(msg) {
		throw new Error('betTable error:' + msg);
		return;
	}
	/**
	 * 弹出一个错误提示
	 * @param {String} msg
	 */
	function msgErrorTips(msg) {
		layer.msg(msg, {
			icon: 5
		});
		return;
	}

	var begtable = new begTable();
	//begtable.init();

	exports('begtable', function(options) {
		return begtable.set(options);
	});
});