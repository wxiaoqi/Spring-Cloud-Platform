/*
 *  Copyright (C) 2018  老干爹<2014314038@qq.com>

 *  Boot-Platform 企业版源码
 *  郑重声明:
 *  如果你从其他途径获取到，请告知老干爹传播人，奖励1000。
 *  老干爹将追究授予人和传播人的法律责任!

 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.

 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

package com.github.wxiaoqi.security.generator.rest;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.wxiaoqi.security.common.msg.TableResultResponse;
import com.github.wxiaoqi.security.common.util.Query;
import com.github.wxiaoqi.security.generator.config.SwitchDB;
import com.github.wxiaoqi.security.generator.service.GeneratorService;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 老干爹 on 2017/8/25.
 */
@Controller
@RequestMapping("/code/generator")
public class GeneratorRest {

    @Autowired
    private GeneratorService generatorService;

    @Autowired
    private SwitchDB switchDB;

    @Autowired
    private List<DruidDataSource> source;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/dbs")
    public TableResultResponse<String> getDbList() {
        return new TableResultResponse(new Long(source.size()), source.stream().map(DruidDataSource::getName).collect(Collectors.toList()));
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/page")
    public TableResultResponse<Map<String, Object>> list(@RequestParam Map<String, Object> params) {
        String dbName = String.valueOf(params.get("dbName"));
        switchDB.change(dbName);
        Query query = new Query(params);
        List<Map<String, Object>> result = generatorService.queryList(query);
        int total = generatorService.queryTotal(query);
        return new TableResultResponse(total, result);
    }

    /**
     * 生成代码
     */
    @RequestMapping("/build")
    public void code(String tables, String path, String mainModule, String author, String dbName, String tablePrefix, HttpServletResponse response) throws IOException {
        if (StringUtils.isNoneBlank(tables)) {
            switchDB.change(dbName);
            byte[] data = generatorService.generatorCode(tables.split(","), path, mainModule, author, tablePrefix);
            response.reset();
            response.setHeader("Content-Disposition", "attachment; filename=\"generator-code.zip\"");
            response.addHeader("Content-Length", "" + data.length);
            response.setContentType("application/octet-stream; charset=UTF-8");
            IOUtils.write(data, response.getOutputStream());
        }
    }
}
