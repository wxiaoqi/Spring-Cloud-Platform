package com.github.wxiaoqi.security.admin.biz;

import com.github.wxiaoqi.security.admin.entity.GateClient;
import com.github.wxiaoqi.security.admin.mapper.GateClientMapper;
import com.github.wxiaoqi.security.common.biz.BaseBiz;
import com.github.wxiaoqi.security.common.constant.UserConstant;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * ${DESCRIPTION}
 *
 * @author wanghaobin
 * @create 2017-06-29 15:58
 */
@Service
public class GateClientBiz extends BaseBiz<GateClientMapper,GateClient> {

    @Override
    public void insertSelective(GateClient entity) {
        String secret = new BCryptPasswordEncoder(UserConstant.PW_ENCORDER_SALT).encode(entity.getSecret());
        entity.setSecret(secret);
        super.insertSelective(entity);
    }

    @Override
    public void updateById(GateClient entity) {
        GateClient old = (GateClient) mapper.selectByIds(entity.getId() + "").get(0);
        if(!entity.getSecret().equals(old.getSecret())){
            String secret = new BCryptPasswordEncoder(UserConstant.PW_ENCORDER_SALT).encode(entity.getSecret());
            entity.setSecret(secret);
        }
        super.updateById(entity);
    }
}
