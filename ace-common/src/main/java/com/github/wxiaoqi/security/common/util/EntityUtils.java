package com.github.wxiaoqi.security.common.util;

import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;


import org.springframework.web.context.request.RequestContextHolder;

/**
 * 实体类相关工具类 
 * 解决问题： 1、快速对实体的常驻字段，如：crtUser、crtHost、updUser等值快速注入
 * 
 * @author Ace
 * @version 1.0
 * @date 2016年4月18日
 * @since 1.7
 */
public class EntityUtils {
	/**
	 * 快速将bean的crtUser、crtHost、crtTime、updUser、updHost、updTime附上相关值
	 * 
	 * @param entity 实体bean 
	 * 		user类型为com.neusoft.unieap.techcomp.org.entity.User，time类型为Timestamp
	 * @author 王浩彬
	 */
	public static <T> void setCreatAndUpdatInfo(T entity) {
		setCreateInfo(entity);
		setUpdatedInfo(entity);
	}
	
	/**
	 * 快速将bean的crtUser、crtHost、crtTime附上相关值
	 * 
	 * @param entity 实体bean
	 * 		user类型为com.neusoft.unieap.techcomp.org.entity.User，time类型为Timestamp
	 * @author 王浩彬
	 */
	public static <T> void setCreateInfo(T entity){
//		RequestContextHolder
//		HttpServletRequest request = (HttpServletRequest) UnieapRequestContextHolder.getRequestContext()
//				.get("currentRequest");
		String hostIp = "";
//		if(request!=null)
//			hostIp = ClientUtil.getClientIp(request);
		// 默认属性
		String[] fields = {"crtUser","crtHost","crtTime"};
		Field field = ReflectionUtils.getAccessibleField(entity, "crtTime");
		// 默认值
		Object [] value = null;
		if(field!=null&&field.getType().equals(Date.class)){
			value = new Object []{hostIp,new Date()};
		}else{
			value = new Object []{hostIp,new Timestamp(new Date().getTime())};
		}
		// 填充默认属性值
		setDefaultValues(entity, fields, value);
	}

	/**
	 * 快速将bean的updUser、updHost、updTime附上相关值
	 * 
	 * @param entity 实体bean
	 * 		user类型为com.neusoft.unieap.techcomp.org.entity.User，time类型为Timestamp
	 * @author 王浩彬
	 */
	public static <T> void setUpdatedInfo(T entity){
//		User user = UniEAPContextHolder.getContext().getCurrentUser();
//		HttpServletRequest request = (HttpServletRequest) UnieapRequestContextHolder.getRequestContext()
//				.get("currentRequest");
		String hostIp = "";
//		if(request!=null)
//			hostIp = ClientUtil.getClientIp(request);
		// 默认属性
		String[] fields = {"updUser","updHost","updTime"};
		Field field = ReflectionUtils.getAccessibleField(entity, "updTime");
		Object [] value = null;
		if(field!=null&&field.getType().equals(Date.class)){
			value = new Object []{hostIp,new Date()};
		}
		// 填充默认属性值
		setDefaultValues(entity, fields, value);
	}
	/**
	 * 依据对象的属性数组和值数组对对象的属性进行赋值
	 * 
	 * @param entity 对象
	 * @param fields 属性数组
	 * @param value 值数组
	 * @author 王浩彬
	 */
	private static <T> void setDefaultValues(T entity, String[] fields, Object[] value) {
		for(int i=0;i<fields.length;i++){
			String field = fields[i];
			if(ReflectionUtils.hasField(entity, field)){
				ReflectionUtils.invokeSetter(entity, field, value[i]);
			}
		}
	}
	/**
	 * 根据主键属性，判断主键是否值为空
	 * 
	 * @param entity
	 * @param field
	 * @return 主键为空，则返回false；主键有值，返回true
	 * @author 王浩彬
	 * @date 2016年4月28日
	 */
	public static <T> boolean isPKNotNull(T entity,String field){
		if(!ReflectionUtils.hasField(entity, field))
			return false;
		Object value = ReflectionUtils.getFieldValue(entity, field);
		return value!=null&&!"".equals(value);
	}
}
