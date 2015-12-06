package com.keepthinker.meerp.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

public class ShiroSessionUtils {
	/**
	 * 获取当前用户的Shiro管理的Session
	 * @return
	 */
	public static Session getSession(){
		return SecurityUtils.getSubject().getSession();
	}
	/**
	 * 获取当前用户的Shiro管理的Session中的对应key的Attribute
	 * @return
	 */
	public static Object getSessionAttribute(String key){
		Object object = getSession().getAttribute(key);
		return object;
	}
	/**
	 * 设置当前用户的Shiro管理的Session中的对应key的Attribute
	 * @return
	 */
	public static void setSessionAttribute(String key,Object object){
		getSession().setAttribute(key,object);
	}
	/**
	 * 获取当前访问该系统的用户名称 
	 * @return
	 */
	public static String getCurrentUserName(){
		if(SecurityUtils.getSubject().getPrincipal()==null){
			return "游客";
		}else{
			return (String) SecurityUtils.getSubject().getPrincipal();
		}
	}
}
