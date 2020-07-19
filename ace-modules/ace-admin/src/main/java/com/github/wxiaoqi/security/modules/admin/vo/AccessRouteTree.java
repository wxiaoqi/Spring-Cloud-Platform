package com.github.wxiaoqi.security.modules.admin.vo;

import com.alibaba.fastjson.JSONObject;
import com.github.wxiaoqi.security.common.vo.TreeNode;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author the sun
 * @create 2017-06-19 13:03
 */
@Data
public class AccessRouteTree extends TreeNode implements Serializable {
    String name;
    String icon;
    String path;
    String component;
    String componentPath;
    /**
     * "meta": {
     * "title": "系统设置",
     * "cache": true
     * }
     */
    JSONObject meta;

    List<AccessRouteTree> nodes = new ArrayList<AccessRouteTree>();


    @Override
    public void setChildren(List<TreeNode> children) {
        super.setChildren(children);
        nodes = new ArrayList<AccessRouteTree>();
    }

    @Override
    public void add(TreeNode node) {
        super.add(node);
        AccessRouteTree n = new AccessRouteTree();
        BeanUtils.copyProperties(node, n);
        nodes.add(n);
    }
}
