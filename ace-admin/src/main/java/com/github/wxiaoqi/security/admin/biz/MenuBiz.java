package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.entity.Menu;
import com.github.wxiaoqi.security.common.biz.BaseBiz;
import com.github.wxiaoqi.security.admin.constant.AdminCommonConstant;
import org.springframework.stereotype.Service;
import com.github.wxiaoqi.security.admin.mapper.MenuMapper;

import java.util.List;

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
        if(AdminCommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Menu entity) {
        if(AdminCommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }
    /**
     * 获取用户可以访问的菜单
     * @param id
     * @return
     */
    public List<Menu> getUserAuthorityMenuByUserId(int id){
        return mapper.selectAuthorityMenuByUserId(id);
    }

    /**
     * 根据用户获取可以访问的系统
     * @param id
     * @return
     */
    public List<Menu> getUserAuthoritySystemByUserId(int id){
        return mapper.selectAuthoritySystemByUserId(id);
    }
}
