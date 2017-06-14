package com.i9he.m2b.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	
	@RequestMapping("/shouhou")
	public String toshouhou(ModelMap map) {
		return "about/shouhou.ftl";
	}
	   
	@RequestMapping("/tuan/index")
	public String totuan(ModelMap map) {
		return "about/tuan.ftl";
	}
	
	@RequestMapping("/jr/shezhang")
	public String tojinrong(ModelMap map) {
		return "about/jinrong.ftl";
	}
	
	@RequestMapping("/club/index")
	public String toshequ(ModelMap map) {
		return "about/shequ.ftl";
	}

}