package com.i9he.zq.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ZqConfigUtil {
	@Value("${zqid}")
	private String zqid;
	@Value("${request_url}")
	private String request_url;
	@Value("${private_key}")
	private String private_key;
	@Value("${public_key}")
	private String public_key;
	@Value("${register_notify_url}")
	private String register_notify_url;
	@Value("${template_id}")
	private String template_id;
	@Value("${user_code}")
	private String user_code;

	private String contract_name = "合合..同";

	@Value("${return_url}")
	private String return_url;
	@Value("${message_return_url}")
	private String message_return_url;

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
