package com.i9he.m2b.manage.zqutil;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ZqConfigUtil {
	@Value("${zq.id}")
	private String zqid;
	@Value("${zq.request.url}")
	private String request_url;
	@Value("${zq.private.key}")
	private String private_key;
	@Value("${zq.public.key}")
	private String public_key;
	@Value("${zq.register.notify.url}")
	private String register_notify_url;
	@Value("${zq.template.id}")
	private String template_id;
	@Value("${zq.user.code}")
	private String user_code;
	@Value("${zq.return.url}")
	private String return_url;
	@Value("${zq.message.return.url}")
	private String message_return_url;

	private String contract_name = "合合..同";
	public String getMessage_return_url() {
		return message_return_url;
	}

	public String getReturn_url() {
		return return_url;
	}

	public String getContract_name() {
		return contract_name;
	}

	public String getTemplate_id() {
		return template_id;
	}

	public String getUser_code() {
		return user_code;
	}

	public String getRegister_notify_url() {
		return register_notify_url;
	}

	public String getZqid() {
		return zqid;
	}

	public String getRequest_url() {
		return request_url;
	}

	public String getPrivate_key() {
		return private_key;
	}

	public String getPublic_key() {
		return public_key;
	}

}
