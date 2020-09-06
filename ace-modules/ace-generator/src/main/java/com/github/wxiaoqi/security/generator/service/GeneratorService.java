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

package com.github.wxiaoqi.security.generator.service;

import com.github.wxiaoqi.security.generator.mapper.GeneratorMapper;
import com.github.wxiaoqi.security.generator.utils.GeneratorUtils;
import com.github.wxiaoqi.security.common.util.Query;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成器
 *
 * @author 老干爹
 * @version 2017年08月25日
 * @email 2014314038@qq.com
 */
@Service
public class GeneratorService {
    @Autowired
    private GeneratorMapper generatorMapper;

    public List<Map<String, Object>> queryList(Query query) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("offset", query.getPage() - 1);
        map.put("limit", query.getLimit());
        map.putAll(query);
        return generatorMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return generatorMapper.queryTotal(map);
    }

    public Map<String, String> queryTable(String tableName) {
        return generatorMapper.queryTable(tableName);
    }

    public List<Map<String, String>> queryColumns(String tableName) {
        return generatorMapper.queryColumns(tableName);
    }

    public byte[] generatorCode(String[] tableNames, String path, String mainModule, String author,String tablePrefix) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);

        for (String tableName : tableNames) {
            //查询表信息
            Map<String, String> table = queryTable(tableName);
            //查询列信息
            List<Map<String, String>> columns = queryColumns(tableName);
            //生成代码
            GeneratorUtils.generatorCode(table, columns, zip, author, path, mainModule,tablePrefix);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }
}
