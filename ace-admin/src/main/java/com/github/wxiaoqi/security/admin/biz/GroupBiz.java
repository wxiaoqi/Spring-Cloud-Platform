package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.constant.CommonConstant;
import com.github.wxiaoqi.security.admin.entity.Group;
import com.github.wxiaoqi.security.admin.entity.Group;
import com.github.wxiaoqi.security.admin.mapper.GroupMapper;
import com.github.wxiaoqi.security.admin.mapper.UserMapper;
import com.github.wxiaoqi.security.admin.vo.GroupUsers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.wxiaoqi.security.common.biz.BaseBiz;
import org.springframework.util.StringUtils;

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
    @Override
    public void insertSelective(Group entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Group entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }

    public GroupUsers getGroupUsers(int groupId) {
        return new GroupUsers(userMapper.selectMemberByGroupId(groupId),userMapper.selectLeaderByGroupId(groupId));
    }

    public void addGroupUsers(int groupId,String members,String leaders){
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
}
