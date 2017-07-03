package com.github.wxiaoqi.security.admin.rest;

import com.github.pagehelper.PageHelper;
import com.github.wxiaoqi.security.admin.biz.GateClientBiz;
import com.github.wxiaoqi.security.admin.entity.GateClient;
import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.admin.vo.GroupUsers;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import com.github.wxiaoqi.security.common.rest.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-29 15:58
 */
@Controller
@RequestMapping("gateClient")
public class GateClientController extends BaseController<GateClientBiz,GateClient> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<GateClient> page(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1")int offset, String name){
        Example example = new Example(GateClient.class);
        if(StringUtils.isNotBlank(name)) {
            example.createCriteria().andLike("name", "%" + name + "%");
            example.or().andLike("code", "%" + name + "%");
        }
        int count = baseBiz.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<GateClient>(count,baseBiz.selectByExample(example));
    }

    @RequestMapping(value = "/{id}/lock",method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse<GateClient> updateLock(GateClient entity){
        baseBiz.updateById(entity);
        return new ObjectRestResponse<GateClient>().rel(true);
    }

    @RequestMapping(value = "/{id}/service", method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse modifiyServices(@PathVariable int id,String services){
        baseBiz.modifyClientServices(id, services);
        return new ObjectRestResponse().rel(true);
    }

    @RequestMapping(value = "/{id}/service", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<GroupUsers> getServices(@PathVariable int id){
        return new ObjectRestResponse<GroupUsers>().rel(true).result(baseBiz.getClientServices(id));
    }


}
