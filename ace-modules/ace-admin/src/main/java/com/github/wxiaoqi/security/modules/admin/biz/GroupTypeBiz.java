package com.github.wxiaoqi.security.modules.admin.biz;

import com.github.wxiaoqi.security.modules.admin.entity.GroupType;
import org.springframework.stereotype.Service;

import com.github.wxiaoqi.security.modules.admin.mapper.GroupTypeMapper;
import com.github.wxiaoqi.security.common.biz.BaseBiz;
import org.springframework.transaction.annotation.Transactional;

/**
 * ${DESCRIPTION}
 *
 * @author the sun
 * @create 2017-06-12 8:48
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class GroupTypeBiz extends BaseBiz<GroupTypeMapper,GroupType> {
}
