package com.i9he.m2b.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ConfigUtil {
	
	private @Value("${cas.server.url}")
	String casServerUrl;

	@Value("${user.forgetpassword.key}")
	private String forgetPasswordKey;
	@Value("${user.forgetpassword.limit}")
	private long forgetuserPasswordTimeLimit;
	@Value("${user.forgetpassword.template.root}")
	private String forgetPasswordTemplateRoot;
	@Value("${web.basepath}")
	private String basepath;
	
	public String getBasepath() {
		return basepath;
	}

	public String getCasServerUrl() {
		return casServerUrl;
	}
	
	public String getForgetPasswordKey() {
		return forgetPasswordKey;
	}

	public long getForgetuserPasswordTimeLimit() {
		return forgetuserPasswordTimeLimit;
	}

	public String getForgetPasswordTemplateRoot() {
		return forgetPasswordTemplateRoot;
	}
}
