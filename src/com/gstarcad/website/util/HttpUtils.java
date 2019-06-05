package com.gstarcad.website.util;


import javax.servlet.http.HttpServletRequest;


public class HttpUtils {


	/**
	 * 得到请求的根目录
	 * 
	 * @param request
	 * @return
	 */
	public static String getBasePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName();
		if(request.getServerPort() == 80 || request.getServerPort() == 443){
			basePath = basePath + path;
		}else{
			basePath = basePath + ":" + request.getServerPort() + path;
		}
		
		return basePath;
	}

	/**
	 * 得到结构目录
	 * 
	 * @param request
	 * @return
	 */
	public static String getContextPath(HttpServletRequest request) {
		String path = request.getContextPath();
		return path;
	}

}
