package com.i9he.m2b.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.IConcernService;
import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.search.ConcernSearchModel;
@Controller
@RequestMapping("/controller/concern")
public class ConcernController extends AbstractController {
	
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	@Autowired
	private IConcernService concernService;
	@RequestMapping("/list")
	public String list(){
		return "2buser/concern.ftl";
	}
	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST, produces=MIME_JSON)
	public String list(ConcernSearchModel csm){
		List<Concern> list = concernService.getList(csm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, csm), DATE_FORMAT); 
	}

}
