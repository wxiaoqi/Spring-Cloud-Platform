package com.github.wxiaoqi.security.modules.auth.controller;

import com.alibaba.fastjson.JSON;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import com.github.wxiaoqi.security.common.constant.RedisKeyConstant;
import com.github.wxiaoqi.security.modules.admin.entity.OnlineLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Ths Sun
 * @create 2020/7/29.
 */
@RestController
@RequestMapping("online")
public class OnlineController {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @RequestMapping("/page")
    public TableResultResponse<OnlineLog> getOnlineInfo(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1") int offset) {
        stringRedisTemplate.opsForValue();
        //倒序查询分页的ids
        Set<String> ids = stringRedisTemplate.opsForZSet().reverseRange(RedisKeyConstant.REDIS_KEY_TOKEN, (offset - 1) * limit, (offset - 1) * limit + limit - 1);
        List<OnlineLog> logs = new ArrayList<>(ids.size());
        for (String id : ids) {
            String s = stringRedisTemplate.opsForValue().get(RedisKeyConstant.REDIS_KEY_TOKEN + ":" + id);
            if (s == null) {
                stringRedisTemplate.opsForZSet().remove(RedisKeyConstant.REDIS_KEY_TOKEN, id);
            } else {
                logs.add(JSON.parseObject(s, OnlineLog.class));
            }
        }
        return new TableResultResponse<>(stringRedisTemplate.opsForZSet().size(RedisKeyConstant.REDIS_KEY_TOKEN), logs);
    }


    @RequestMapping("/{id}")
    public ObjectRestResponse forceLogout(@PathVariable("id") String tokenId) {
        stringRedisTemplate.delete(RedisKeyConstant.REDIS_KEY_TOKEN + ":" + tokenId);
        stringRedisTemplate.opsForZSet().remove(RedisKeyConstant.REDIS_KEY_TOKEN, tokenId);
        return new ObjectRestResponse<>();
    }

}
