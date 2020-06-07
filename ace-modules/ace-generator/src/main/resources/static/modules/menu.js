
/*
 * smartMenu.js 智能上下文菜单插件
 * http://www.zhangxinxu.com/
 *
 * Copyright 2011, zhangxinxu
 *
 * 2011-05-26 v1.0	编写
 * 2011-06-03 v1.1	修复func中this失准问题
 * 2011-10-10 v1.2  修复脚本放在<head>标签中层无法隐藏的问题
 * 2011-10-30 v1.3  修复IE6~7下二级菜单移到第二项隐藏的问题
 * 上述注释为原插件作者所写。
 * 2016-12-16 v1.4 for layim 修改成为符合Layui插件格式
 * IE8或以下浏览器 数组长度问题 [1,2,3,4,] 长度为 5 否则为 4
 *
 */

layui.define(function (exports) {
    var $ = layui.jquery;

    (function ($) {
        var D = $(document).data("func", {});
        $.smartMenu = $.noop;
        $.fn.smartMenu = function (data, options) {
            var B = $("body"), defaults = {
                name: "",
                offsetX: 2,
                offsetY: 2,
                textLimit: 6,
                beforeShow: $.noop,
                afterShow: $.noop
            };
            var params = $.extend(defaults, options || {});

            var htmlCreateMenu = function (datum) {
                var dataMenu = datum || data, nameMenu = datum ? Math.random().toString() : params.name, htmlMenu = "", htmlCorner = "", clKey = "smart_menu_";
                if ($.isArray(dataMenu) && dataMenu.length) {
                    htmlMenu = '<div id="smartMenu_' + nameMenu + '" class="' + clKey + 'box">' +
                    '<div class="' + clKey + 'body">' +
                    '<ul class="' + clKey + 'ul">';

                    $.each(dataMenu, function (i, arr) {
                        if (i) {
                            htmlMenu = htmlMenu + '<li class="' + clKey + 'li_separate">&nbsp;</li>';
                        }
                        if ($.isArray(arr)) {
                            $.each(arr, function (j, obj) {
                                var text = obj.text, name = obj.name, icon = obj.icon || '', htmlMenuLi = "", strTitle = "", rand = Math.random().toString().replace(".", "");
                                if (icon) {
                                    icon += '&nbsp;';
                                }
                                if (text) {
                                    if (text.length > params.textLimit) {
                                        text = text.slice(0, params.textLimit) + "…";
                                        strTitle = ' title="' + obj.text + '"';
                                    }
                                    if ($.isArray(obj.child) && obj.child.length) {
                                        htmlMenuLi = '<li class="layui-icon ' + clKey + 'li" data-hover="true">' + htmlCreateMenu(obj.child) +
                                        '<a href="javascript:" class="' + clKey + 'a"' + strTitle + ' data-name="' + name + '" data-key="' + rand + '"><i class="' + clKey + 'triangle"></i>' + icon + text + '</a>' +
                                        '</li>';
                                    } else {
                                        htmlMenuLi = '<li class="layui-icon ' + clKey + 'li">' +
                                        '<a href="javascript:" class="' + clKey + 'a"' + strTitle + ' data-name="' + name + '" data-key="' + rand + '">' + icon + text + '</a>' +
                                        '</li>';
                                    }

                                    htmlMenu += htmlMenuLi;

                                    var objFunc = D.data("func");
                                    objFunc[rand] = obj.func;
                                    D.data("func", objFunc);
                                }
                            });
                        }
                    });

                    htmlMenu = htmlMenu + '</ul>' +
                    '</div>' +
                    '</div>';
                }
                return htmlMenu;
            }, funSmartMenu = function () {
                var idKey = "#smartMenu_", clKey = "smart_menu_", jqueryMenu = $(idKey + params.name);
                if (!jqueryMenu.size()) {
                    $("body").append(htmlCreateMenu());

                    //事件
                    $(idKey + params.name + " a").bind("click", function () {
                        var key = $(this).attr("data-key"), name = $(this).attr('data-name')
                        callback = D.data("func")[key];
                        if ($.isFunction(callback)) {
                            callback(name, D.data("trigger"));
                        }
                        $.smartMenu.hide();
                        return false;
                    });
                    $(idKey + params.name + " li").each(function () {
                        var isHover = $(this).attr("data-hover"), clHover = clKey + "li_hover";

                        $(this).hover(function () {
                            var jqueryHover = $(this).siblings("." + clHover);
                            jqueryHover.removeClass(clHover).children("." + clKey + "box").hide();
                            jqueryHover.children("." + clKey + "a").removeClass(clKey + "a_hover");

                            if (isHover) {
                                $(this).addClass(clHover).children("." + clKey + "box").show();
                                $(this).children("." + clKey + "a").addClass(clKey + "a_hover");
                            }

                        });

                    });
                    return $(idKey + params.name);
                }
                return jqueryMenu;
            };

            $(this).each(function () {
                this.oncontextmenu = function (e) {
                    //回调
                    call.beforeshow ? call.beforeshow[0]($(this)) : '';
                    e = e || window.event;
                    //阻止冒泡
                    e.cancelBubble = true;
                    if (e.stopPropagation) {
                        e.stopPropagation();
                    }
                    //隐藏当前上下文菜单，确保页面上一次只有一个上下文菜单
                    $.smartMenu.hide();
                    var st = D.scrollTop();
                    var jqueryMenu = funSmartMenu();
                    if (jqueryMenu) {
                        jqueryMenu.css({
                            display: "block",
                            left: e.clientX + params.offsetX,
                            top: e.clientY + st + params.offsetY
                        });
                        D.data("target", jqueryMenu);
                        D.data("trigger", this);
                        //回调
                        if ($.isFunction(params.afterShow)) {
                            params.afterShow.call(this);
                        }
                        return false;
                    }
                };
            });
            if (!B.data("bind")) {
                B.bind("click", $.smartMenu.hide).data("bind", true);
            }
        };
        $.extend($.smartMenu, {
            hide: function () {
                var target = D.data("target");
                if (target && target.css("display") === "block") {
                    target.hide();
                }
            },
            remove: function () {
                var target = D.data("target");
                if (target) {
                    target.remove();
                }
            }
        });
    })($);

    var items = {
        menu: [], beforeShow: function () {

        }
    };

    var menuData = [];
    var call = {};

    var menu = function () {
        $(document).on('click', function () {
            $.smartMenu.hide();
        });
    }
    //初始化
    menu.prototype.init = function (options) {
        config(options);
        layui.each(menuData, function (i) {
            $(menuData[i].ele).smartMenu(menuData[i].data, {
                name: menuData[i].id, beforeShow: items.beforeShow
            });
        });
    }
    //监听菜单点击回调
    menu.prototype.on = function (events, callback) {
        if (typeof callback === 'function') {
            call[events] ? call[events].push(callback) : call[events] = [callback];
        }
        return this;
    };
    //点击菜单回调
    function menuclick_callback(othis, name) {
        call.menuclick ? call.menuclick[0](othis, name) : '';
    }
    //配置
    function config(options) {
        $.extend(items, options);
        if (items && items.menu.length) {
            layui.each(items.menu, function (i) {
                init(items.menu[i]);
            });
        }
    }

    //处理数据格式
    function init(item) {
        var data = [];
        var groups = [];
        var prapare = {};
        var defaultItem = { group: 'default', icon: '', func: menuclick_callback };
        layui.each(item.items, function (i) {
            $.extend(item.items[i], defaultItem);
            var itemDetail = item.items[i];
            if (!itemDetail) {
                return;
            }
            var g = item.items[i]['group'];
            if (!prapare[g]) {
                prapare[g] = [];
                groups.push(g);
            }
            //处理子菜单
            if (item.items[i].child) {
                var cgroups = [];
                var cprapare = [];
                var cdata = [];
                layui.each(item.items[i].child, function (c) {
                    var ch = item.items[i].child[c];
                    $.extend(ch, defaultItem);
                    var cg = ch.group || 'cdefault';
                    if (!cprapare[cg]) {
                        cprapare[cg] = [];
                        cgroups.push(cg);
                    }
                    cprapare[cg].push(ch);
                });
                if (cgroups.length) {
                    layui.each(cgroups, function (g) {
                        cdata.push(cprapare[cgroups[g]]);
                    });
                }
                item.items[i].child = cdata;
            }
            prapare[g].push(item.items[i]);
        });

        if (groups.length) {
            layui.each(groups, function (i) {
                data.push(prapare[groups[i]]);
            });
        }
        menuData.push({
            id:item.id,
            ele: item.ele,
            data: data
        });

    }

    var m = new menu();
    exports("menu", m);
});