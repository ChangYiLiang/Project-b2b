package com.i9he.m2b.manage.utils;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import com.i9he.common.privilege.PrivilegeUtils;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

public class B2BFreeMarkerView extends FreeMarkerView {

	private IPrivilegeBaseApiService privilegeBaseApiService;

	@Override
	protected void initServletContext(ServletContext servletContext) throws BeansException {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		privilegeBaseApiService = ctx.getBean("privilegeBaseApiService", IPrivilegeBaseApiService.class);
		
		super.initServletContext(servletContext);
	}

	@Override
	protected void applyContentType(HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "POST, GET");
		response.addHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
		super.applyContentType(response);
	}

	@Override
	protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request) throws Exception {
		String visitedModule = StringUtils.defaultIfEmpty(request.getParameter("visitedModule"), "b2b");
		String visitedResource = StringUtils.defaultIfEmpty(request.getParameter("visitedResource"), "");
		// 初始化用户、菜单
		User user = SessionUtil.getSessionUser(request);
		String menus = "";
		try {
			String sysFlag = PrivilegeUtils.getSystemFlag(request);
			menus = privilegeBaseApiService.getModuleTree(user.getId(), visitedModule, visitedResource, sysFlag);
		} catch (Exception e) {
			logger.error("获取用户菜单异常", e);
		}
		model.put("user", user);
		model.put("menus", menus);
		
		model.put("BasePath", getClientPath(request, ""));
		super.exposeHelpers(model, request);
	}

	private String getClientPath(HttpServletRequest request, String relativePath) {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme());
		sb.append("://");
		sb.append(request.getServerName());
		if(request.getServerPort() != 80) {
			sb.append(":");
			sb.append(request.getServerPort());
		}
		sb.append(request.getContextPath());
		sb.append(relativePath);
		return sb.toString();
	}
}
