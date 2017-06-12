package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.entity.User;
import com.github.wxiaoqi.security.common.biz.BaseBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.wxiaoqi.security.admin.mapper.UserMapper;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-08 16:23
 */
@Service
public class UserBiz extends BaseBiz<UserMapper,User> {
}
