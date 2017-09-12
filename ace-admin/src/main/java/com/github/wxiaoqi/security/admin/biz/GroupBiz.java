package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.constant.AdminCommonConstant;
import com.github.wxiaoqi.security.admin.entity.*;
import com.github.wxiaoqi.security.admin.entity.Group;
import com.github.wxiaoqi.security.admin.mapper.GroupMapper;
import com.github.wxiaoqi.security.admin.mapper.MenuMapper;
import com.github.wxiaoqi.security.admin.mapper.ResourceAuthorityMapper;
import com.github.wxiaoqi.security.admin.mapper.UserMapper;
import com.github.wxiaoqi.security.admin.vo.AuthorityMenuTree;
import com.github.wxiaoqi.security.admin.vo.GroupUsers;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.wxiaoqi.security.common.biz.BaseBiz;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-12 8:48
 */
@Service
public class GroupBiz extends BaseBiz<GroupMapper,Group>{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ResourceAuthorityMapper resourceAuthorityMapper;
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public void insertSelective(Group entity) {
        if(AdminCommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Group entity) {
        if(AdminCommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }

    /**
     * 获取群组关联用户
     * @param groupId
     * @return
     */
    public GroupUsers getGroupUsers(int groupId) {
        return new GroupUsers(userMapper.selectMemberByGroupId(groupId),userMapper.selectLeaderByGroupId(groupId));
    }

    /**
     * 变更群主所分配用户
     * @param groupId
     * @param members
     * @param leaders
     */
    public void modifyGroupUsers(int groupId, String members, String leaders){
        mapper.deleteGroupLeadersById(groupId);
        mapper.deleteGroupMembersById(groupId);
        if(!StringUtils.isEmpty(members)){
            String[] mem = members.split(",");
            for(String m:mem){
                mapper.insertGroupMembersById(groupId,Integer.parseInt(m));
            }
        }
        if(!StringUtils.isEmpty(leaders)){
            String[] mem = leaders.split(",");
            for(String m:mem){
                mapper.insertGroupLeadersById(groupId,Integer.parseInt(m));
            }
        }
    }

    /**
     * 变更群组关联的菜单
     * @param groupId
     * @param menus
     */
    public void modifyAuthorityMenu(int groupId, String[] menus){
        resourceAuthorityMapper.deleteByAuthorityIdAndResourceType(groupId+"", AdminCommonConstant.RESOURCE_TYPE_MENU);
        List<Menu> menuList = menuMapper.selectAll();
        Map<String,String> map = new HashMap<String, String>();
        for(Menu menu:menuList){
            map.put(menu.getId().toString(),menu.getParentId().toString());
        }
        Set<String> relationMenus = new HashSet<String>();
        relationMenus.addAll(Arrays.asList(menus));
        ResourceAuthority authority = null;
        for(String menuId:menus){
            findParentID(map,relationMenus,menuId);
        }
        for(String menuId:relationMenus){
            authority = new ResourceAuthority(AdminCommonConstant.AUTHORITY_TYPE_GROUP, AdminCommonConstant.RESOURCE_TYPE_MENU);
            authority.setAuthorityId(groupId+"");
            authority.setResourceId(menuId);
            authority.setParentId("-1");
            resourceAuthorityMapper.insertSelective(authority);
        }
    }

    private void findParentID(Map<String,String> map,Set<String> relationMenus,String id){
        String parentId = map.get(id);
        if(String.valueOf(AdminCommonConstant.ROOT).equals(id)){
            return ;
        }
        relationMenus.add(parentId);
        findParentID(map,relationMenus,parentId);
    }

    /**
     * 分配资源权限
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void modifyAuthorityElement(int groupId,int menuId,int elementId){
        ResourceAuthority authority = new ResourceAuthority(AdminCommonConstant.AUTHORITY_TYPE_GROUP, AdminCommonConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId + "");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.insertSelective(authority);
    }

    /**
     * 移除资源权限
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void removeAuthorityElement(int groupId, int menuId, int elementId) {
        ResourceAuthority authority = new ResourceAuthority();
        authority.setAuthorityId(groupId+"");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.delete(authority);
    }


    /**
     * 获取群主关联的菜单
     * @param groupId
     * @return
     */
    public List<AuthorityMenuTree> getAuthorityMenu(int groupId){
        List<Menu> menus = menuMapper.selectMenuByAuthorityId(String.valueOf(groupId), AdminCommonConstant.AUTHORITY_TYPE_GROUP);
        List<AuthorityMenuTree> trees = new ArrayList<AuthorityMenuTree>();
        AuthorityMenuTree node = null;
        for (Menu menu : menus) {
            node = new AuthorityMenuTree();
            node.setText(menu.getTitle());
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return trees;
    }


    public List<Integer> getAuthorityElement(int groupId) {
        ResourceAuthority authority = new ResourceAuthority(AdminCommonConstant.AUTHORITY_TYPE_GROUP, AdminCommonConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId+"");
        List<ResourceAuthority> authorities = resourceAuthorityMapper.select(authority);
        List<Integer> ids = new ArrayList<Integer>();
        for(ResourceAuthority auth:authorities){
            ids.add(Integer.parseInt(auth.getResourceId()));
        }
        return ids;
    }
}
