package com.i9he.m2b.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.i9he.m2b.interceptor.Security;

@Security	// 默认开启登录验证
@Controller
public class TestController {

	@Security(validate = false)	// 改方法不需要登录
	@RequestMapping("/t1")
	@ResponseBody
	public String t1() {
		return "t1";
	}

	@RequestMapping("/t2")
	@ResponseBody
	public String t2() {
		return "t2";
	}

}
