/**
 @Name：layui.markdown markdown编辑器
 @Author：zhangkx
 @License：LGPL
 */
layui.define(['layer', 'form'], function (exports) {
    var $ = layui.jquery,
        _form = layui.form(),
        _layer = layui.layer,
        markdown = function () {
            //全局配置
            this.config = {
                //默认工具bar
                tools: [
                    'face', 'image', 'link', 'code', 'help', 'full_screen', 'subfield', 'preview'
                ],
                height: 280 //默认高
            };
        };

    // markdown 解析器
    var _parser = new HyperDown;

    var tools = {
        face: '<span title="插入表情"><i class="iconfont" event="face">&#xe61d;</i><span event="face" class="tool-tip">表情</span></span>',
        image: '<span event="image" title="插入图片"><i class="iconfont" event="image">&#xe680;</i><span class="tool-tip">图片</span></span>',
        link: '<span event="link" title="插入链接"><i class="iconfont" event="link">&#xe6aa;</i><span class="tool-tip">链接</span></span>',
        code: '<span event="code" title="插入代码" class="divide"><i class="iconfont" event="code">&#xe6a1;</i><span class="tool-tip">代码</span></span>',
        full_screen: '<span event="full_screen" title="全屏"><i class="iconfont" event="full_screen">&#xe620;</i><span class="tool-tip">全屏</span></span>',
        subfield: '<span event="subfield" title="分栏预览" class="hide"><i class="iconfont" event="subfield">&#xe658;</i><span class="tool-tip">分栏</span></span>',
        preview: '<span event="preview" title="全屏预览"><i class="iconfont" event="preview">&#xe659;</i><span class="tool-tip">预览</span></span>'
    };

    // 建立编辑器
    markdown.prototype.build = function (id, settings) {
        var dom = $('#' + id);
        var _settings = $.extend({}, this.config, (settings || {}));
        var image_upload_action = _settings.image_upload_action; // 上传图片的action
        var _tools = (function () {
            var _nodes = [];
            $.each(_settings.tools, function (item) {
                if (tools[_settings.tools[item]])
                    _nodes.push(tools[_settings.tools[item]]);
            });
            return _nodes.join('');
        })();

        console.log(_settings.required)
        var _required = _settings.required ? ' required lay-verify="required" ' : '';
        var editor = $([
            '<div class="layui-markdown markdown-editor">',
            '  <div class="tools">' + _tools + '<span type="help" style="float: right; color: #afafaf"><small>markdown</small></span></div>',
            '  <textarea placeholder="请输入内容" class="layui-textarea" ' + _required + ' name="markdown_content" v-model="markdown_content" debounce="500" style="min-height: ' + _settings.height + 'px"></textarea>',
            '</div>'].join('')
        );

        dom.empty().append(editor);

        // 表情
        dom.find("i[event='face'], span[event='face']").click(function () {
            face($(this), function (img) {
                // insertTextarea(document.getElementsByName("markdown_content")[0], "@" + img.alt +"(" + img.src + ")")
                insertTextarea(document.getElementsByName("markdown_content")[0], "@" + img.alt);
            })
        });

        // 图片
        dom.find("span[event='image']").click(function () {
            // _layer.msg("开发中...", {shift: 6, time: 1000});
            var textarea = document.getElementsByName("markdown_content")[0];
            image($(this), image_upload_action, function (image) {
                insertTextarea(textarea, "![" + image.alt + "](" + image.src + ")");
            });
        });

        // 链接
        dom.find("span[event='link']").click(function () {
            var textarea = document.getElementsByName("markdown_content")[0];
            var text = textarea.value.substring(textarea.selectionStart, textarea.selectionEnd);
            link($(this), text, function (link) {
                var text = "";
                if (link.title && link.url) {
                    text = link.title ? "[" + link.title + "](" + link.url + ")" : link.url
                } else if (!link.title && link.url) {
                    text = link.url;
                }
                insertTextarea(textarea, text);
            });
        });

        // 插入代码
        dom.find("span[event='code']").click(function () {
            var textarea = document.getElementsByName("markdown_content")[0];
            code($(this), function (_code) {
                insertTextarea(textarea, "\n```lang-" + _code.lang + "\n" + _code.content + "\n" + "```" + "\n");
            });
        });

        // 预览
        dom.find("span[event='preview']").click(function () {
            var textarea = document.getElementsByName("markdown_content")[0];
            _layer.open({
                title: "预览", type: 1, area: ["100%", "100%"], btn: null, shadeClose: true, shade: 0.2,
                content: "<div class='layui-markdown' style='width: 1000px; margin: 5px auto 20px; padding: 25px 20px; background: #FBFBFB;'>" +
                _parser.makeHtml(textarea.value) + "</div>",
                success: function (layero, index) {
                    $(document).on('keydown', function (e) {
                        if (e.keyCode == 27)
                            _layer.close(index);
                    });
                    Prism.highlightAll();
                }
            });
        });

        // 全屏写作
        var shade = null;
        var is_full_screen = false;
        var is_half_screen = false;
        dom.find("span[event='full_screen']").click(function () {
            if (!is_full_screen) {
                $(".layui-body").css("position", "static");
                dom.find(".layui-markdown").addClass('full-screen');
                dom.find(".layui-markdown .tools span[event='subfield']").removeClass("hide");
            } else {
                // $(".layui-header, .layui-side").show();
                $(".layui-body").css("position", 'absolute');
                dom.find(".layui-markdown").removeClass('full-screen');
                dom.find(".layui-markdown .tools span[event='subfield']").addClass("hide");
                dom.find(".layui-markdown").removeClass('half');
                $(".article-preview").removeClass("full");
                is_half_screen = false;
                if (shade)
                    shade.remove();
            }
            is_full_screen = !is_full_screen;
        });

        // 分栏
        dom.find("span[event='subfield']").click(function () {
            if (!is_full_screen) {
                return false;
            }
            if (!is_half_screen) {
                shade = $('<div class="layui-layer-shade" style="z-index:1110; background:#fff"></div>')
                $("body").append(shade);
                dom.find(".layui-markdown").addClass('half');
                $(".article-preview").addClass("full");
            } else {
                dom.find(".layui-markdown").removeClass('half');
                $(".article-preview").removeClass("full");
                if (shade)
                    shade.remove();
            }
            is_half_screen = !is_half_screen;
        });
    };

    // 修改textarea文字
    var insertTextarea = function (textarea, str) {
        if (textarea) {
            var _value = textarea.value;
            textarea.value = _value.substring(0, textarea.selectionStart) + str + _value.substring(textarea.selectionEnd);
        }
    };

    // code
    var code = function(obj, callback) {
        var _width = ($(window).width() < 800) ? "98%" : "800px";
        return _layer.open({
            title: "插入代码：", type: 1, area: [_width, "500px"], btn: null, shadeClose: true, shade: 0.2,
            content: "<div class='layui-form' style='padding: 20px;'>" +
            "  <div class='layui-form-item' style='margin-left: -20px'>" +
            "    <div class='layui-input-inline'>" +
            "      <select name='lang'>" +
            "        <option value=''>请选择语言</option>" +
            "        <option value='javascript'>Javascript</option>" +
            "        <option value='html'>HTML</option>" +
            "        <option value='css'>CSS</option>" +
            "        <option value='php'>PHP</option>" +
            "        <option value='java'>Java</option>" +
            "        <option value='ruby'>Ruby</option>" +
            "        <option value='python'>Python</option>" +
            "        <option value='csharp'>C#</option>" +
            "        <option value='aspnet'>ASP.NET</option>" +
            "        <option value='json'>JSON</option>" +
            "        <option value='sql'>SQL</option>" +
            "        <option value='markdown'>Markdown</option>" +
            "      </select>" +
            "    </div>" +
            "  </div>" +
            "  <div class='layui-form-item' style='margin-top: 10px'>" +
            "    <textarea name='content' autofocus='true' " +
            "style='height: 300px; width: 100%; line-height: 20px; padding: 8px; -webkit-box-sizing: border-box; border: 1px solid #ccc; box-shadow: 1px 1px 5px rgba(0,0,0,.1) inset; color: #333'></textarea>" +
            "  </div>" +
            "  <div style='margin-top: 20px; text-align: right'>" +
            "    <button type='button' name='yes' class='layui-btn'><i class='iconfont'>&#xe7bd;</i>&ensp; 确&ensp;定 </button>" +
            "    <button style='margin-left: 20px;' type='button' class='layui-btn layui-btn-primary' name='cancel'> 取消 </button>" +
            "  </div>" +
            "</div>",
            success: function (layero, index) {
                _form.render("select");
                layero.find("button[name='yes']").click(function () {
                    var _lang = layero.find("select[name='lang']");
                    var _content = layero.find("textarea[name='content']");
                    if (_lang.val() == "") {
                        _lang.addClass("layui-form-danger").val("").focus();
                        _layer.msg("请选择语言", {shift: 6, time: 800});
                    }
                    else if (_content.val() == "") {
                        _content.addClass("layui-form-danger").val("").focus();
                        _layer.msg("请输入代码", {shift: 6, time: 800});
                    } else {
                        callback({
                            lang: _lang.val(), content: _content.val()
                        });
                        _layer.close(index);
                    }
                });
                layero.find("button[name='cancel']").click(function () {
                    _layer.close(index);
                });
                $(document).on('keydown', function (e) {
                    if (e.keyCode == 27)
                        _layer.close(index);
                });
            }
        });
    };

    var image = function (obj, image_upload_action, callback) {
        var _width = ($(window).width() < 470) ? "98%" : "470px";
        var _height = ($(window).width() < 420) ? "300px" : "265px";
        var _idx = _layer.open({
            title: "插入图片：", type: 1, area: [_width, _height], btn: null, shadeClose: true, shade: 0.2,
            content: "<div style='margin-top: 20px; margin-left: 16px'>" +
            "  <label class='layui-form-label' style='width: 100px !important; margin-left: -27px;'>图片描述</label>" +
            "  <div class='layui-input-block' style='margin-left: 90px !important'>" +
            "    <input type='text' name='text' class='layui-input' value='' autocomplete='off' style='width: 250px' />" +
            "  </div>" +
            "  <label class='layui-form-label required' style='width: 100px !important; margin-left: -27px; margin-top: 20px'>图片地址</label>" +
            "  <div class='layui-input-block' style='margin-left: 90px !important; margin-top: 20px'>" +
            "    <input type='url' name='url' autofocus class='layui-input' autocomplete='off' style='width: 250px; display: inline-block' />" +
            "<button class='layui-btn layui-btn-primary btn-upload' type='button' name='upload'>" +
            "      <i class='iconfont' style='position: relative; top: -3px; font-size: 18px;'>&#xe61f;</i> <span class='tool-tip'>上传</span></button>" +
            "    <form method='post' id='upload_image' enctype='multipart/form-data' action='" + image_upload_action + "'>" +
            "       <input type='file' name='file' accept='.jpg,.gif,.png,.bmp' style='display: none' /></form>" +
            "  </div>" +
            "  <div style='margin-top: 35px; text-align: right; padding-right: 30px;'>" +
            "    <button type='button' name='yes' class='layui-btn'><i class='iconfont'>&#xe7bd;</i>&ensp; 确&ensp;定 </button>" +
            "    <button style='margin-left: 20px;' type='button' class='layui-btn layui-btn-primary' name='cancel'> 取消 </button>" +
            "  </div>" +
            "</div>",
            success: function (layero, index) {
                layero.find("input[name='url']").focus();
                layero.find("button[name='upload']").click(function () {
                    if (image_upload_action == null || image_upload_action == '') {
                        _layer.msg("没有定义上传图片action地址！", {shift: 6, time: 1000});
                    } else {
                        layero.find("input[name='file']").click();
                    }
                });
                layero.find("input[name='file']").change(function () {
                    if ($(this).val() == '') return;
                    var load = _layer.load(8);
                    layero.find("#upload_image").ajaxSubmit({
                        success: function (data) {
                            _layer.close(load);
                            if (data.status == 0) {
                                layero.find("input[name='url']").val('');
                                _layer.alert(data.msg, {icon: 5, shade: 0.6});
                            } else {
                                layero.find("input[name='url']").val(data.src);
                            }
                        }
                    });
                });
                layero.find("button[name='yes']").click(function () {
                    var url = layero.find("input[name='url']");
                    if (url.val() == "" || url.val().match(/^((https|http)?:\/\/)?[^\s]+\.(png|jpg|jpeg|gif|svg|bmp)/gi  ) == null) {
                        url.addClass("layui-form-danger").val("").focus();
                        _layer.msg("请输入正确的图片地址", {shift: 6, time: 800});
                    } else {
                        callback({
                            alt: layero.find("input[name='text']").val(),
                            src: url.val()
                        });
                        _layer.close(index);
                    }
                });
                layero.find("button[name='cancel']").click(function () {
                    _layer.close(index);
                });
                $(document).on('keydown', function (e) {
                    if (e.keyCode == 27)
                        _layer.close(index);
                });
            }
        });
        // _layer.iframeAuto(_idx);
        return _idx;
    };

    // 链接
    var link = function (obj, text, callback) {
        var _width = ($(window).width() < 400) ? "98%" : "400px";
        return _layer.open({
            title: "插入链接：", type: 1, area: [_width, "260px"], btn: null, shadeClose: true, shade: 0.2,
            content: "<div style='margin-top: 20px; margin-left: 16px'>" +
            "  <label class='layui-form-label' style='width: 100px !important; margin-left: -27px;'>链接文字</label>" +
            "  <div class='layui-input-block' style='margin-left: 90px !important; width: 256px'>" +
            "    <input type='text' name='text' class='layui-input' value='" + text + "' autocomplete='off' />" +
            "  </div>" +
            "  <label class='layui-form-label required' style='width: 100px !important; margin-left: -27px; margin-top: 20px'>链接</label>" +
            "  <div class='layui-input-block' style='margin-left: 90px !important; width: 256px; margin-top: 20px'>" +
            "    <input type='url' name='url' autofocus class='layui-input' autocomplete='off' />" +
            "  </div>" +
            "  <div style='margin-top: 35px; text-align: right; padding-right: 38px;'>" +
            "    <button type='button' name='yes' class='layui-btn'><i class='iconfont'>&#xe7bd;</i>&ensp; 确&ensp;定 </button>" +
            "    <button style='margin-left: 20px;' type='button' class='layui-btn layui-btn-primary' name='cancel'> 取消 </button>" +
            "  </div>" +
            "</div>",
            success: function (layero, index) {
                layero.find("input[name='url']").focus();
                layero.find("button[name='yes']").click(function () {
                    var url = layero.find("input[name='url']");
                    if (url.val() == "" || url.val().match(/^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/g) == null) {
                        url.addClass("layui-form-danger").val("").focus();
                        _layer.msg("请输入正确的链接", {shift: 6, time: 800});
                    } else {
                        callback({
                            title: layero.find("input[name='text']").val(),
                            url: url.val()
                        });
                        _layer.close(index);
                    }
                });
                layero.find("button[name='cancel']").click(function () {
                    _layer.close(index);
                });
                $(document).on('keydown', function (e) {
                    if (e.keyCode == 27)
                        _layer.close(index);
                });
            }
        });
    };

    // 表情弹窗
    var face = function (obj, callback) {
        //表情库
        var faces = function () {
            var alt = ["[微笑]", "[嘻嘻]", "[哈哈]", "[可爱]", "[可怜]", "[挖鼻]", "[吃惊]", "[害羞]", "[挤眼]", "[闭嘴]",
                "[鄙视]", "[爱你]", "[泪]", "[偷笑]", "[亲亲]", "[生病]", "[太开心]", "[白眼]", "[右哼哼]", "[左哼哼]",
                "[嘘]", "[衰]", "[委屈]", "[吐]", "[哈欠]", "[抱抱]", "[怒]", "[疑问]", "[馋嘴]", "[拜拜]", "[思考]",
                "[汗]", "[困]", "[睡]", "[钱]", "[失望]", "[酷]", "[色]", "[哼]", "[鼓掌]", "[晕]", "[悲伤]", "[抓狂]",
                "[黑线]", "[阴险]", "[怒骂]", "[互粉]", "[心]", "[伤心]", "[猪头]", "[熊猫]", "[兔子]", "[ok]", "[耶]",
                "[good]", "[NO]", "[赞]", "[来]", "[弱]", "[草泥马]", "[神马]", "[囧]", "[浮云]", "[给力]", "[围观]",
                "[威武]", "[奥特曼]", "[礼物]", "[钟]", "[话筒]", "[蜡烛]", "[蛋糕]"], arr = {};
            layui.each(alt, function (index, item) {
                arr[item] = layui.cache.dir + 'images/face/' + index + '.gif';
            });
            return arr;
        }();
        face.hide = face.hide || function (e) {
                if ($(e.target).attr('event') !== 'face') {
                    _layer.close(face.index);
                }
            };
        var _idx = face.index = _layer.tips((function () {
            var content = [];
            layui.each(faces, function (key, item) {
                content.push('<li title="' + key + '"><img src="' + item + '" alt="' + key + '"></li>');
            });
            return '<ul class="layui-clear">' + content.join('') + '</ul>';
        })(), obj, {
            tips: 3, time: 0, skin: 'layui-box layui-util-face', maxWidth: 500,
            success: function (layero, index) {
                layero.css({
                    marginTop: -4, marginLeft: -10
                }).find('.layui-clear > li').on('click', function () {
                    callback && callback({
                        src: faces[this.title], alt: this.title
                    });
                    layer.close(index);
                });
                $(document).off('click', face.hide).on('click', face.hide);
            }
        });
        if ($(window).width() < 450) {
            $(".layui-util-face").css("left", "17px").css("width", "92%");
            $(".layui-util-face .layui-layer-content").css("width", "92%");
            $(".layui-util-face ul.layui-clear").css("width", "90%");//.css("padding-right", "1px");
        }
        return _idx;
    };

    exports('markdown', new markdown());
});
