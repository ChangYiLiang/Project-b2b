package com.i9he.m2b.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.MDC;

public class ThreadContextHolderFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		try {
			ThreadContextHolder.setHttpRequest((HttpServletRequest) request);
			ThreadContextHolder.setHttpResponse((HttpServletResponse) response);
			MDC.put("ip", request.getRemoteHost());	// log4j添加ip变量
			filterChain.doFilter(request, response);
		} finally {
			ThreadContextHolder.remove();
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
