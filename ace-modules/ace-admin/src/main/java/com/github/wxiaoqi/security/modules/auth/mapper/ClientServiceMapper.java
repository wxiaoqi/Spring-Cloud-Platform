package com.github.wxiaoqi.security.modules.auth.mapper;

import com.github.wxiaoqi.security.modules.auth.entity.ClientService;
import tk.mybatis.mapper.common.Mapper;

public interface ClientServiceMapper extends Mapper<ClientService> {
    void deleteByServiceId(int id);
}