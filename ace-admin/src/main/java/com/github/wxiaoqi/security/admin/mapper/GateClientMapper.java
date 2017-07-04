package com.github.wxiaoqi.security.admin.mapper;

import com.github.wxiaoqi.security.admin.entity.GateClient;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.Mapper;

public interface GateClientMapper extends Mapper<GateClient> {
    public void insertClientServiceById (@Param("clientId") int clientId,@Param("serviceId") int serviceId);
    public void deleteClientServiceById (@Param("clientId") int clientId);
}