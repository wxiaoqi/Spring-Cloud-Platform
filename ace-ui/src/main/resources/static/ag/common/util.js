/**
 * 设置表单值
 * @param el
 * @param data
 */
function setFromValues(el, data) {
    for (var p in data) {
        el.find(":input[name='" + p + "']").val(data[p]);
    }
}
var treeViewHelper = {};
/**
 * tree view遍历节点值
 * @param node
 * @returns {Array}
 */
treeViewHelper.getChildrenNodeIdArr = function ( node ){
    var ts = [];
    if(node.nodes){
        for(x in node.nodes){
            ts.push(node.nodes[x].nodeId)
            if(node.nodes[x].nodes){
                var getNodeDieDai = this.getChildrenNodeIdArr(node.nodes[x]);
                for(j in getNodeDieDai){
                    ts.push(getNodeDieDai[j]);
                }
            }
        }
    }else{
        ts.push(node.nodeId);
    }
    return ts;
}
/**
 * 获取treeview的父级节点
 * @param treeId
 * @param node
 * @returns {Array}
 */
treeViewHelper.getParentIdArr = function (treeId,node){
    var ts = [];
    var parent  =   $('#'+treeId).treeview('getParent', node);
    while(parent.id&&parent.id!=0){
        ts.push(parent);
        parent = $('#'+treeId).treeview('getParent', parent);
    }
    return ts;
}
var tip = {
    alert: function (info, iconIndex) {
        parent.layer.msg(info, {
            icon: iconIndex
        });
    }
} ;
$(function(){
    // 设置jQuery Ajax全局的参数
    $.ajaxSetup({
        type: "POST",
        error: function(jqXHR, textStatus, errorThrown){
            switch (jqXHR.status){
                case(500):
                    tip.alert("服务器系统内部错误");
                    break;
                case(401):
                    tip.alert("未登录");
                    break;
                case(403):
                    tip.alert("无权限执行此操作");
                    break;
                case(408):
                    tip.alert("请求超时");
                    break;
                default:
                    tip.alert("未知错误");
            }
        }
    });
});