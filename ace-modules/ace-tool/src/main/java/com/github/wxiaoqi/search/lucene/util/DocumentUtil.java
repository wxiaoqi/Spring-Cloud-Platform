/*
 *
 *  *  Copyright (C) 2018  Wanghaobin<463540703@qq.com>
 *
 *  *  AG-Enterprise 企业版源码
 *  *  郑重声明:
 *  *  如果你从其他途径获取到，请告知老A传播人，奖励1000。
 *  *  老A将追究授予人和传播人的法律责任!
 *
 *  *  This program is free software; you can redistribute it and/or modify
 *  *  it under the terms of the GNU General Public License as published by
 *  *  the Free Software Foundation; either version 2 of the License, or
 *  *  (at your option) any later version.
 *
 *  *  This program is distributed in the hope that it will be useful,
 *  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  *  GNU General Public License for more details.
 *
 *  *  You should have received a copy of the GNU General Public License along
 *  *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 */

package com.github.wxiaoqi.search.lucene.util;

import com.github.wxiaoqi.security.api.vo.search.IndexObject;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StoredField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.search.highlight.Highlighter;

import java.io.StringReader;

/**
 * Description:sss
 *
 * @author ace
 * @create 2017-05-18
 **/
public class DocumentUtil {

    public static Document IndexObject2Document(IndexObject indexObject) {
        Document doc = new Document();
        doc.add(new StoredField("id", indexObject.getId()));
        doc.add(new TextField("title",indexObject.getTitle(), Field.Store.YES));
        doc.add(new TextField("summary",indexObject.getKeywords(), Field.Store.YES));
        doc.add(new TextField("descripton",indexObject.getDescripton(), Field.Store.YES));
        doc.add(new StoredField("postDate", indexObject.getPostDate()));
        doc.add(new StoredField("url", indexObject.getUrl()));
        return doc;  
    }  
  
    public static  IndexObject document2IndexObject(Analyzer analyzer, Highlighter highlighter, Document doc,float score) throws Exception {
        IndexObject indexObject = new IndexObject();
        indexObject.setId(Long.parseLong(doc.get("id")));
        indexObject.setTitle(stringFormatHighlighterOut(analyzer, highlighter,doc,"title"));
        indexObject.setKeywords(stringFormatHighlighterOut(analyzer, highlighter,doc,"summary"));
        indexObject.setDescripton(stringFormatHighlighterOut(analyzer, highlighter,doc,"descripton"));
        indexObject.setPostDate(doc.get("postDate"));
        indexObject.setUrl(doc.get("url"));
        indexObject.setScore(score);
        return indexObject;
    }


    /*关键字加亮*/
    private static String stringFormatHighlighterOut(Analyzer analyzer, Highlighter highlighter, Document document, String field) throws Exception{
        String fieldValue = document.get(field);
        if(fieldValue!=null){
            TokenStream tokenStream=analyzer.tokenStream(field, new StringReader(fieldValue));
            return highlighter.getBestFragment(tokenStream, fieldValue);
        }
        return null;
    }
}