package com.github.wxiaoqi.security.modules.auth.controller;

import com.alibaba.druid.util.Base64;
import com.github.wxiaoqi.security.common.msg.ObjectRestResponse;
import com.github.wxiaoqi.security.common.util.UUIDUtils;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.github.wxiaoqi.security.modules.admin.constant.AdminCommonConstant.LOGIN_CAPTCHA_EXPIRATION;
import static com.github.wxiaoqi.security.common.constant.RedisKeyConstant.REDIS_KEY_CAPTCHA;

/**
 * @author Ths Sun
 * @create 2020/7/26.
 */
@RestController
public class CaptchaController {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    @RequestMapping("/captcha")
    public ObjectRestResponse captcha() throws Exception {
        // 三个参数分别为宽、高、位数
        SpecCaptcha specCaptcha = new SpecCaptcha(130, 48, 4);
        // 设置字体
        specCaptcha.setFont(new Font("Verdana", Font.PLAIN, 32));  // 有默认字体，可以不用设置
        // 设置类型，纯数字、纯字母、字母数字混合
        specCaptcha.setCharType(Captcha.TYPE_ONLY_NUMBER);

        String uuid = UUIDUtils.generateShortUuid();
        String text = specCaptcha.text().toLowerCase();
        stringRedisTemplate.opsForValue().set(String.format(REDIS_KEY_CAPTCHA, uuid), text, LOGIN_CAPTCHA_EXPIRATION, TimeUnit.MINUTES);

        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        // 输出图片流
        specCaptcha.out(stream);
        String captcha = Base64.byteArrayToBase64(stream.toByteArray());
        Map map = new HashMap<>();
        map.put("captcha", captcha);
        map.put("uuid", uuid);
        return new ObjectRestResponse().data(map);
    }
}
