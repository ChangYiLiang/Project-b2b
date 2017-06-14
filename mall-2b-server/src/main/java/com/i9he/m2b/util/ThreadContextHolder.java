package com.i9he.m2b.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ThreadContextHolder {

	private static final ThreadLocal<HttpSession> SessionThreadLocalHolder = new ThreadLocal<HttpSession>();
	private static final ThreadLocal<HttpServletRequest> HttpRequestThreadLocalHolder = new ThreadLocal<HttpServletRequest>();
	private static final ThreadLocal<HttpServletResponse> HttpResponseThreadLocalHolder = new ThreadLocal<HttpServletResponse>();

	public static void setHttpRequest(HttpServletRequest request) {
		HttpRequestThreadLocalHolder.set(request);
	}

	public static HttpServletRequest getHttpRequest() {
		return (HttpServletRequest) HttpRequestThreadLocalHolder.get();
	}

	public static void remove() {
		SessionThreadLocalHolder.remove();
		HttpRequestThreadLocalHolder.remove();
		HttpResponseThreadLocalHolder.remove();
	}

	public static void setHttpResponse(HttpServletResponse response) {
		HttpResponseThreadLocalHolder.set(response);
	}

	public static HttpServletResponse getHttpResponse() {
		return (HttpServletResponse) HttpResponseThreadLocalHolder.get();
	}

	public static void setSession(HttpSession session) {
		SessionThreadLocalHolder.set(session);
	}

	public static HttpSession getSession() {
		if (SessionThreadLocalHolder.get() == null) {
			HttpServletRequest httpRequest = getHttpRequest();
			SessionThreadLocalHolder.set(httpRequest != null ? httpRequest.getSession() : null);
		}
		return (HttpSession) SessionThreadLocalHolder.get();
	}
}
