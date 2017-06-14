package com.i9he.m2b.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasig.cas.client.util.AssertionHolder;
import org.jasig.cas.client.util.CommonUtils;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

/**
 * 拦截指定path，进行权限验证，及用户的本地session过期后，重新进行赋值
 */
public class PrivilegeInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private ConfigUtil configUtil;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setAttribute("url", URLEncoder.encode(constructServiceUrl(request, response), "utf-8"));

		Assertion assertion = AssertionHolder.getAssertion();
		boolean i9he = !request.getServletPath().startsWith("/controller");
		if (i9he) {
			User user = SessionUtil.getSessionUser(request);
			if (assertion == null) {
				return true;
			}
			user = privilegeBaseApiService.getUserByLogin(assertion.getPrincipal().getName());
			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
			return true;
		}
		// 实际cas-client-core中org.jasig.cas.client.authentication.AuthenticationFilter已经进行了单点登录认证，这里主要是为了获得用户信息
		if (assertion == null || assertion.getPrincipal() == null || assertion.getPrincipal().getName() == null) {
			// 没有登录，跳转到没有登录页面
			response.sendRedirect(configUtil.getCasServerUrl());
			return false;
		}

		User user = SessionUtil.getSessionUser(request);

		if (user == null) {
			// 存储Session:用户登录名
			user = privilegeBaseApiService.getUserByLogin(assertion.getPrincipal().getName());
			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
		}
		// CommonUtils.constructServiceUrl(request, response, arg2, arg3, arg4,
		// arg5)
		// 判断权限，没有权限，进入没有权限页面

		return true;

	}

	protected final String constructServiceUrl(final HttpServletRequest request, final HttpServletResponse response) {
		// return CommonUtils.constructServiceUrl(request, response,
		// this.service, this.serverName, this.artifactParameterName,
		// this.encodeServiceUrl);
		String currentPage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + (CommonUtils.isNotBlank(request.getQueryString()) ? ("?" + request.getQueryString()) : "");
		String ticket = request.getParameter("ticket");
		// 去掉参数中所有ticket相关的部分
		currentPage = currentPage.replace("%3Fticket%3D" + ticket, "");
		currentPage = currentPage.replace("&ticket=" + ticket, "");
		currentPage = currentPage.replace("?ticket=" + ticket, "");
		currentPage = currentPage.replace("&service=", "?service");
		return currentPage;
	}
}
