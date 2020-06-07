/** tab.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
layui.define(['element', 'common'], function (exports) {
    "use strict";

    var mod_name = 'tab',
        $ = layui.jquery,
        element = layui.element(),
        commo = layui.common,
        globalTabIdIndex = 0,
        layer = layui.layer,
        Tab = function () {
            this.config = {
                elem: undefined,
                closed: true, //是否包含删除按钮
                autoRefresh: false,
                contextMenu: false,
                onSwitch: undefined,
                openWait: true
            };
        };
    var ELEM = {};
    //版本号
    Tab.prototype.v = '0.1.5';
	/**
	 * 参数设置
	 * @param {Object} options
	 */
    Tab.prototype.set = function (options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
	/**
	 * 初始化
	 */
    Tab.prototype.init = function () {
        var that = this;
        var _config = that.config;
        if (typeof (_config.elem) !== 'string' && typeof (_config.elem) !== 'object') {
            common.throwError('Tab error: elem参数未定义或设置出错，具体设置格式请参考文档API.');
        }
        var $container;
        if (typeof (_config.elem) === 'string') {
            $container = $('' + _config.elem + '');
        }
        if (typeof (_config.elem) === 'object') {
            $container = _config.elem;
        }
        if ($container.length === 0) {
            common.throwError('Tab error:找不到elem参数配置的容器，请检查.');
        }
        var filter = $container.attr('lay-filter');
        if (filter === undefined || filter === '') {
            common.throwError('Tab error:请为elem容器设置一个lay-filter过滤器');
        }
        _config.elem = $container;
        ELEM.titleBox = $container.children('ul.layui-tab-title');
        ELEM.contentBox = $container.children('div.layui-tab-content');
        ELEM.tabFilter = filter;
        return that;
    };
	/**
	 * 查询tab是否存在，如果存在则返回索引值，不存在返回-1
	 * @param {String} 标题
	 */
    Tab.prototype.exists = function (title) {
        var that = ELEM.titleBox === undefined ? this.init() : this,
            tabIndex = -1;
        ELEM.titleBox.find('li').each(function (i, e) {
            var $cite = $(this).children('cite');
            if ($cite.text() === title) {
                tabIndex = i;
            };
        });
        return tabIndex;
    };
	/**
	 * 获取tabid
	 * @param {String} 标题
	 */
    Tab.prototype.getTabId = function (title) {
        var that = ELEM.titleBox === undefined ? this.init() : this,
            tabId = -1;
        ELEM.titleBox.find('li').each(function (i, e) {
            var $cite = $(this).children('cite');
            if ($cite.text() === title) {
                tabId = $(this).attr('lay-id');
            };
        });
        return tabId;
    };
	/**
	 * 添加选择卡，如果选择卡存在则获取焦点
	 * @param {Object} data
	 */
    Tab.prototype.tabAdd = function (data) {
        var that = this;
        var _config = that.config;
        var tabIndex = that.exists(data.title);
        var waitLoadIndex;
        if (tabIndex === -1) {
            if (_config.openWait) {
                waitLoadIndex = layer.load(2);
            }
            //设置只能同时打开多少个tab选项卡
            if (_config.maxSetting !== 'undefined') {
                var currentTabCount = _config.elem.children('ul.layui-tab-title').children('li').length;
                if (typeof _config.maxSetting === 'number') {
                    if (currentTabCount === _config.maxSetting) {
                        layer.msg('为了系统的流畅度，只能同时打开' + _config.maxSetting + '个选项卡。');
                        return;
                    }
                }
                if (typeof _config.maxSetting === 'object') {
                    var max = _config.maxSetting.max || 8;
                    var msg = _config.maxSetting.tipMsg || '为了系统的流畅度，只能同时打开' + max + '个选项卡。';
                    if (currentTabCount === max) {
                        layer.msg(msg);
                        return;
                    }
                }
            }
            globalTabIdIndex++;
            var content = '<iframe src="' + data.href + '" data-id="' + globalTabIdIndex + '"></iframe>';
            var title = '';
            if (data.icon !== undefined) {
                if (data.icon.indexOf('fa-') !== -1) {
                    title += '<i class="fa ' + data.icon + '" aria-hidden="true"></i>';
                } else {
                    title += '<i class="layui-icon">' + data.icon + '</i>';
                }
            }
            title += '<cite>' + data.title + '</cite>';
            if (_config.closed) {
                title += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + globalTabIdIndex + '">&#x1006;</i>';
            }
            //添加tab
            element.tabAdd(ELEM.tabFilter, {
                title: title,
                content: content,
                id: new Date().getTime()
            });
            //iframe 自适应
            ELEM.contentBox.find('iframe[data-id=' + globalTabIdIndex + ']').each(function () {
                $(this).height(ELEM.contentBox.height());
            });
            if (_config.closed) {
                //监听关闭事件
                ELEM.titleBox.find('li').children('i.layui-tab-close[data-id=' + globalTabIdIndex + ']').on('click', function () {
                    element.tabDelete(ELEM.tabFilter, $(this).parent('li').attr('lay-id')).init();
                    if (_config.contextMenu) {
                        $(document).find('div.uiba-contextmenu').remove(); //移除右键菜单dom
                    }
                });
            };
            //切换到当前打开的选项卡
            element.tabChange(ELEM.tabFilter, that.getTabId(data.title));

            ELEM.contentBox.find('iframe[data-id=' + globalTabIdIndex + ']').on('load', function () {
                //debugger;
                if (_config.openWait) {
                    layer.close(waitLoadIndex);
                }
            });
        } else {
            element.tabChange(ELEM.tabFilter, that.getTabId(data.title));
            //自动刷新
            if (_config.autoRefresh) {
                _config.elem.find('div.layui-tab-content > div').eq(tabIndex).children('iframe')[0].contentWindow.location.reload();
            }
        }
        if (_config.contextMenu) {
            element.on('tab(' + ELEM.tabFilter + ')', function (data) {
                $(document).find('div.admin-contextmenu').remove();
            });
            ELEM.titleBox.find('li').on('contextmenu', function (e) {
                var $that = $(e.target);
                e.preventDefault();
                e.stopPropagation();

                var $target = e.target.nodeName === 'LI' ? e.target : e.target.parentElement;
                //判断，如果存在右键菜单的div，则移除，保存页面上只存在一个
                if ($(document).find('div.admin-contextmenu').length > 0) {
                    $(document).find('div.admin-contextmenu').remove();
                }
                //创建一个div
                var div = document.createElement('div');
                //设置一些属性
                div.className = 'admin-contextmenu';
                div.style.width = '130px';
                div.style.backgroundColor = 'white';

                var ul = '<ul>';
                ul += '<li data-target="refresh" title="刷新当前选项卡"><i class="fa fa-refresh" aria-hidden="true"></i> 刷新</li>';
                ul += '<li data-target="closeCurrent" title="关闭当前选项卡"><i class="fa fa-close" aria-hidden="true"></i> 关闭当前</li>';
                ul += '<li data-target="closeOther" title="关闭其他选项卡"><i class="fa fa-window-close-o" aria-hidden="true"></i> 关闭其他</li>';
                ul += '<li data-target="closeAll" title="关闭全部选项卡"><i class="fa fa-window-close-o" aria-hidden="true"></i> 全部关闭</li>';
                ul += '</ul>';
                div.innerHTML = ul;
                div.style.top = e.pageY + 'px';
                div.style.left = e.pageX + 'px';
                //将dom添加到body的末尾
                document.getElementsByTagName('body')[0].appendChild(div);

                //获取当前点击选项卡的id值
                var id = $($target).find('i.layui-tab-close').data('id');
                //获取当前点击选项卡的索引值
                var clickIndex = $($target).attr('lay-id');
                var $context = $(document).find('div.admin-contextmenu');
                if ($context.length > 0) {
                    $context.eq(0).children('ul').children('li').each(function () {
                        var $that = $(this);
                        //绑定菜单的点击事件
                        $that.on('click', function () {
                            //获取点击的target值
                            var target = $that.data('target');
                            //
                            switch (target) {
                                case 'refresh': //刷新当前
                                    var src = ELEM.contentBox.find('iframe[data-id=' + id + ']')[0].src;
                                    ELEM.contentBox.find('iframe[data-id=' + id + ']')[0].src = src;
                                    break;
                                case 'closeCurrent': //关闭当前
                                    if (clickIndex !== 0) {
                                        element.tabDelete(ELEM.tabFilter, clickIndex);
                                    }
                                    break;
                                case 'closeOther': //关闭其他
                                    ELEM.titleBox.children('li').each(function () {
                                        var $t = $(this);
                                        var id1 = $t.find('i.layui-tab-close').data('id');
                                        if (id1 != id && id1 !== undefined) {
                                            element.tabDelete(ELEM.tabFilter, $t.attr('lay-id'));
                                        }
                                    });
                                    break;
                                case 'closeAll': //全部关闭
                                    ELEM.titleBox.children('li').each(function () {
                                        var $t = $(this);
                                        if ($t.index() !== 0) {
                                            element.tabDelete(ELEM.tabFilter, $t.attr('lay-id'));
                                        }
                                    });
                                    break;
                            }
                            //处理完后移除右键菜单的dom
                            $context.remove();
                        });
                    });

                    $(document).on('click', function () {
                        $context.remove();
                    });
                }
                return false;
            });
        }

        if (_config.onSwitch) {
            element.on('tab(' + ELEM.tabFilter + ')', function (data) {
                _config.onSwitch({
                    index: data.index,
                    elem: data.elem,
                    id: ELEM.titleBox.children('li').eq(data.index).attr('lay-id')
                });
            });
        }
    };
    /**
	 * 获取当前获得焦点的tabid
	 */
    Tab.prototype.getCurrentTabId = function () {
        var that = this;
        var _config = that.config;
        return $(_config.elem).find('ul.layui-tab-title').children('li.layui-this').attr('lay-id');
    }
    /**
	 * 删除指定的tab选项卡
	 * @param {String} id
	 */
    Tab.prototype.deleteTab = function (id) {
        var that = this;
        element.tabDelete(ELEM.tabFilter, id);
        return that;
    }

    var tab = new Tab();
    exports(mod_name, function (options) {
        return tab.set(options);
    });
});