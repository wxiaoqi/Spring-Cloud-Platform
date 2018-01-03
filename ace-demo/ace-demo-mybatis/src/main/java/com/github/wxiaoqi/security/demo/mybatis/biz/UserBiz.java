package com.github.wxiaoqi.security.demo.mybatis.biz;

import com.github.wxiaoqi.security.common.biz.BaseBiz;
import com.github.wxiaoqi.security.demo.mybatis.entity.User;
import com.github.wxiaoqi.security.demo.mybatis.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-08 16:23
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserBiz extends BaseBiz<UserMapper,User> {

}
