package com.i9he.m2b.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.i9he.m2b.biz.ISeoService;
import com.i9he.m2b.model.Seo;

public class SeoInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private ISeoService seoService;
	
	@Resource(name = "defaultSeoInfo")
	private Seo defaultSeoInfo;
	
	private final String SeoExecutionName = getClass().getName() + ".seoExecutionName";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		if (request.getAttribute(SeoExecutionName) != null) {
			return;
		} else {
			request.setAttribute(SeoExecutionName, true);
		}
		
		if (!handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			return;
		}
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		ResponseBody responseBody = handlerMethod.getMethodAnnotation(ResponseBody.class);
		if (responseBody != null) {
			return;
		}
		if (modelAndView == null || modelAndView.getViewName() == null || modelAndView.getViewName().startsWith("redirect:")) {
			return;
		}
		
		// 基于URL
		Seo seo = seoService.getSeo(request.getServletPath());
		// 基于路由规则
		if (seo == null) {
			RequestMapping methodMapping = handlerMethod.getMethodAnnotation(RequestMapping.class);
			RequestMapping classMapping = handlerMethod.getMethod().getDeclaringClass().getAnnotation(RequestMapping.class);
			String prefix = "";
			String url = methodMapping.value()[0];
			if (classMapping != null && classMapping.value().length > 0) {
				prefix = classMapping.value()[0];
			}
			url = (prefix + "/" + url).replaceAll("/{1,}", "/");
			seo = seoService.getSeo(url);
		}
		// 默认
		if (seo == null) {
			modelAndView.addObject("SeoInfo", defaultSeoInfo);
			return;
		}

		String title = StringUtils.defaultString(seo.getTitle(), "{title}");
		String keyword = StringUtils.defaultString(seo.getKeyword(), "{keyword}");
		String description = StringUtils.defaultString(seo.getDescription(), "{description}");

		title = title.replace("{title}", defaultSeoInfo.getTitle());
		keyword = keyword.replace("{keyword}", defaultSeoInfo.getKeyword());
		description = description.replace("{description}", defaultSeoInfo.getDescription());
		
		seo.setTitle(title);
		seo.setKeyword(keyword);
		seo.setDescription(description);
		
		// Map<String, String> vars = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		
		modelAndView.addObject("SeoInfo", seo);
		super.postHandle(request, response, handler, modelAndView);
	}

}
