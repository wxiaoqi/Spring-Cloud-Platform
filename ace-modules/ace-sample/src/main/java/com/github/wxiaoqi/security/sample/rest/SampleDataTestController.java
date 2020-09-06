package com.github.wxiaoqi.security.sample.rest;

import com.github.wxiaoqi.security.common.context.BaseContextHandler;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.rest.BaseController;
import com.github.wxiaoqi.security.sample.biz.SampleDataTestBiz;
import com.github.wxiaoqi.security.sample.entity.SampleDataTest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("sampleDataTest")
public class SampleDataTestController extends BaseController<SampleDataTestBiz,SampleDataTest> {
    @GetMapping("/who")
    public ObjectRestResponse<String> whoAmI(){
        return new ObjectRestResponse<>().data(BaseContextHandler.getName());
    }
}