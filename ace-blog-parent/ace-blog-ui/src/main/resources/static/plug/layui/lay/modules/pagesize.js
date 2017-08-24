
layui.define('jquery', function (exports) {
    var $ = layui.jquery;
    function pagesize(id, pageSize) {
        $('#' + id + ' .layui-laypage').append('<span class="laypage-extend-pagesize">&#x6bcf;&#x9875; <input type="number" min="1" onkeyup="this.value = this.value.replace(/\D/, \'\');" value="1" class="layui-laypage-skip" > &#x6761; <button type="button" class="layui-laypage-btn">&#x786e;&#x5b9a;</button></span>');
        $('#' + id + ' .laypage-extend-pagesize input[class=layui-laypage-skip]').val(pageSize);
        var pagesize = {
            btn: $('#' + id + ' .laypage-extend-pagesize .layui-laypage-btn'),
            callback: function (callback) {
                this.ok = callback;
            },
            ok: null
        };
        $(pagesize.btn).on('click', function () {
            pagesize.ok(pagesize.btn.siblings('input[class=layui-laypage-skip]').val());
        });
        return pagesize;
    }
    exports('pagesize', pagesize);
});