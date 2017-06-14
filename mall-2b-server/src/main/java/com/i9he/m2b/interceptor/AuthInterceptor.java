package com.i9he.m2b.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.client.util.AssertionHolder;
import org.jasig.cas.client.util.CommonUtils;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	
	@Autowired
	private ConfigUtil config;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Assertion assertion = AssertionHolder.getAssertion();

		User user = SessionUtil.getSessionUser();
		// 获取单点登录用户信息
		if (assertion != null && user == null) {
			user = privilegeBaseApiService.getUserByLogin(assertion.getPrincipal().getName());
			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
		}
		// 权限验证
		Security ann = null;
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			ann = handlerMethod.getMethodAnnotation(Security.class);
			if (ann == null) {
				ann = handlerMethod.getBeanType().getAnnotation(Security.class);
			}
		}
		// 免登录验证
		if (ann == null || ann.validate() == false) {
			return true;
		}
		// 未登录用户
		if (user == null) {
			// 跳转登录页面
			final int defaultPort = request.isSecure() ? 443 : 80;
			String serverName = request.getServerName() + (request.getServerPort() == defaultPort ? "" : ":" + request.getServerPort());
			String serviceUrl = CommonUtils.constructServiceUrl(request, response, "", serverName, "ticket", false);
			//String casLoginUrl = CommonUtils.constructRedirectUrl(config.getCasServerUrl(), "service", serviceUrl, false, false);
			String loginUrl = "http://" + request.getServerName()
                    + ":"   
                    + request.getServerPort()           
                    + request.getContextPath() 
                    +"/login.html?service="
                    +URLEncoder.encode(serviceUrl, "utf-8");
			response.sendRedirect(loginUrl);
			return false;
		}
		// 判断用户是否删除/锁定
		if (Boolean.TRUE.equals(user.getIsDelete()) || Boolean.TRUE.equals(user.getIsLock())) {
			return false;
		}
		return true;
	}

}
