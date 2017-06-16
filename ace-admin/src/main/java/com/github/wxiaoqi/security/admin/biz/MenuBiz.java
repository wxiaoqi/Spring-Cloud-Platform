package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.common.biz.BaseBiz;
import com.github.wxiaoqi.security.common.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.wxiaoqi.security.admin.mapper.MenuMapper;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-12 8:48
 */
@Service
public class MenuBiz extends BaseBiz<MenuMapper,Menu> {
    @Override
    public void insertSelective(Menu entity) {
        if(TreeUtil.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Menu entity) {
        if(TreeUtil.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }
}
