package com.hjs.study.spring.util;

import javax.servlet.http.HttpServletRequest;

public class StringUtil {

	public static boolean isNotEmpty(String content){
		if(content!=null&&!content.equals("")){
			return true;
		}
		return false;
	}
	
	/**
	 * 获取ip地址
	 */
	public static String getRemoteIp(HttpServletRequest request){
		if (request.getHeader("x-forwarded-for") == null) {  
		     return request.getRemoteAddr();  
		}  
		return request.getHeader("x-forwarded-for");  
	}
}
