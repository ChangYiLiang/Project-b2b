package com.i9he.m2b.manage.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/controller")
public class MainController {
	
	@RequestMapping("/main")
	public String main(ModelMap map) {
		map.put("hour", Calendar.getInstance().get(Calendar.HOUR_OF_DAY));
		return "main.ftl";
	}
	
	@RequestMapping("/error")
	public String error() {
		return "error.ftl";
	}

}
