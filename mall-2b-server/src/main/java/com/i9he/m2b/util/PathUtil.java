package com.i9he.m2b.util;

import javax.servlet.http.HttpServletRequest;

public class PathUtil {
	
	public static String getPath(HttpServletRequest request){
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	} 

}
