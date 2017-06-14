package com.i9he.m2b.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ChildOnlyInterceptor extends HandlerInterceptorAdapter {

	private final String INTERCEPTOR_SYMBOL = getClass().getName().concat(".INTERCEPTOR_SYMBOL");

	private final Object INTERCEPTOR_SYMBOL_VALUE = new Object();

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		ChildOnly childOnly = null;
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			childOnly = handlerMethod.getMethodAnnotation(ChildOnly.class);
			if (childOnly == null) {
				childOnly = handlerMethod.getBeanType().getAnnotation(ChildOnly.class);
			}
		}
		if (childOnly != null && request.getAttribute(INTERCEPTOR_SYMBOL) != INTERCEPTOR_SYMBOL_VALUE) {
			logger.warn("Interceptor: " + request.getRequestURL());
			return false;
		}
		request.setAttribute(INTERCEPTOR_SYMBOL, INTERCEPTOR_SYMBOL_VALUE);
		return true;
	}

}
