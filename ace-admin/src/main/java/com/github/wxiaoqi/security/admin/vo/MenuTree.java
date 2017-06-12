package com.github.wxiaoqi.security.admin.vo;

import com.github.wxiaoqi.security.common.vo.TreeNode;

/**
 * Created by Ace on 2017/6/12.
 */
public class MenuTree extends TreeNode {
    String icon;
    String title;
    String href;
    boolean spread = false;

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }
}
