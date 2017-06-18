package com.github.wxiaoqi.security.admin.rest;

import java.util.ArrayList;
import java.util.List;

import com.github.wxiaoqi.security.admin.constant.CommonConstant;
import com.github.wxiaoqi.security.admin.vo.GroupUsers;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.wxiaoqi.security.admin.biz.GroupBiz;
import com.github.wxiaoqi.security.admin.entity.Group;
import com.github.wxiaoqi.security.admin.vo.GroupTree;
import com.github.wxiaoqi.security.common.rest.BaseController;
import com.github.wxiaoqi.security.common.util.TreeUtil;

import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-12 8:49
 */
@Controller
@RequestMapping("group")
public class GroupController extends BaseController<GroupBiz, Group> {
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Group> list(String name,String groupType) {
        if(StringUtils.isBlank(name)&&StringUtils.isBlank(groupType))
            return new ArrayList<Group>();
        Example example = new Example(Group.class);
        if (StringUtils.isNotBlank(name))
            example.createCriteria().andLike("name", "%" + name + "%");
        if (StringUtils.isNotBlank(groupType))
            example.createCriteria().andEqualTo("groupType", groupType);

        return baseBiz.selectByExample(example);
    }

    @RequestMapping(value = "/sys", method = RequestMethod.GET)
    @ResponseBody
    public List<Group> getSys() {
        Group Group = new Group();
        Group.setParentId(CommonConstant.ROOT);
        return baseBiz.selectList(Group);
    }

    @RequestMapping(value = "/group", method = RequestMethod.GET)
    @ResponseBody
    public List<GroupTree> listGroup(Integer parentId) {
        try {
            if (parentId == null) {
                parentId = this.getSys().get(0).getId();
            }
        } catch (Exception e) {
            return new ArrayList<GroupTree>();
        }
        List<GroupTree> trees = new ArrayList<GroupTree>();
        GroupTree node = null;
        Example example = new Example(Group.class);
        Group parent = baseBiz.selectById(parentId);
        example.createCriteria().andLike("path", parent.getPath() + "%").andNotEqualTo("id",parent.getId());
        for (Group Group : baseBiz.selectByExample(example)) {
            node = new GroupTree();
            BeanUtils.copyProperties(Group, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees,parent.getId());
    }

    @RequestMapping(value = "/{id}/user", method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse addUsers(@PathVariable int id,String members,String leaders){
        baseBiz.addGroupUsers(id,members,leaders);
        return new ObjectRestResponse().rel(true);
    }

    @RequestMapping(value = "/{id}/user", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<GroupUsers> getUsers(@PathVariable int id){
        return new ObjectRestResponse<GroupUsers>().rel(true).result(baseBiz.getGroupUsers(id));
    }
}
