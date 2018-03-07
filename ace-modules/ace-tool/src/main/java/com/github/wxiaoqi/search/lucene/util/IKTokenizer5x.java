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

import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.analysis.tokenattributes.TypeAttribute;
import org.wltea.analyzer.core.IKSegmenter;
import org.wltea.analyzer.core.Lexeme;

import java.io.IOException;

public class IKTokenizer5x extends Tokenizer{

	
	/*IK分词器实现*/
	private IKSegmenter _IKImplement;

	/*词元文本属性*/
	private final CharTermAttribute termAtt;
	/*词元位移属性*/
	private final OffsetAttribute offsetAtt;
	/*词元分类属性（该属性分类参考org.wltea.analyzer.core.Lexeme中的分类常量）*/
	private final TypeAttribute typeAtt;
	/*记录最后一个词元的结束位置*/
	private int endPosition;
	


	/*IK5.x 构造器*/
	public IKTokenizer5x(boolean useSmart){
	    super();
	    offsetAtt = addAttribute(OffsetAttribute.class);
	    termAtt = addAttribute(CharTermAttribute.class);
	    typeAtt = addAttribute(TypeAttribute.class);
		_IKImplement = new IKSegmenter(input , useSmart);
	}


	@Override
	public final boolean incrementToken() throws IOException {
		/*清除所有的词元属性*/
		clearAttributes();
		Lexeme nextLexeme = _IKImplement.next();
		if(nextLexeme != null){
			/*将Lexeme转成Attributes*/
			/*设置词元文本*/
			termAtt.append(nextLexeme.getLexemeText());
			/*设置词元长度*/
			termAtt.setLength(nextLexeme.getLength());
			/*设置词元位移*/
			offsetAtt.setOffset(nextLexeme.getBeginPosition(), nextLexeme.getEndPosition());
			/*记录分词的最后位置*/
			endPosition = nextLexeme.getEndPosition();
			/*记录词元分类*/
			typeAtt.setType(nextLexeme.getLexemeTypeString());			
			/*返会true告知还有下个词元*/
			return true;
		}
		/*返会false告知词元输出完毕*/
		return false;
	}
	

	@Override
	public void reset() throws IOException {
		super.reset();
		_IKImplement.reset(input);
	}	
	
	@Override
	public final void end() {
	    /*set final offset*/
		int finalOffset = correctOffset(this.endPosition);
		offsetAtt.setOffset(finalOffset, finalOffset);
	}
}
