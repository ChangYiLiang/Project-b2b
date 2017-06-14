package com.i9he.m2b.manage.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.i9he.privilege.model.User;

public class SessionUtil {

	/**
	 * 系统登录用户名
	 */
	public static final String SessionSystemLoginUserName = "SessionSystemLoginUserName";

	/**
	 * 清空session
	 */
	public static final void clearSession(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.removeAttribute(SessionUtil.SessionSystemLoginUserName);

		session.invalidate();// 非必须，单点登出接收到服务器消息时，会自动销毁session
	}

	/**
	 * 返回session中的用户对象
	 * 
	 * @param request
	 * @return
	 */
	public static final User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(SessionUtil.SessionSystemLoginUserName);
	}

	public static final User getSessionUser() {
		final HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return getSessionUser(request);
	}
	
	public static final Integer getSessionUserId() {
		User user = getSessionUser();
		return user != null ? user.getId() : 0;
	}
	
	public static final String getRemoteAddr() {
		final HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getRemoteAddr();
	}

}
