package com.i9he.m2b.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.IGsService;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.search.GsSearchModel;

@Controller
@RequestMapping("/controller/gsUser")
public class SyManageController extends AbstractController {
	
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	
	@Autowired
	private IGsService gsService;
	
	@RequestMapping("/list")
	public String list(){
		return "gs/user.ftl";
	}
	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST, produces = MIME_JSON)
	public String list(GsSearchModel gsm){
		List<SyUser> list = gsService.getUserList(gsm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, gsm), DATE_FORMAT);
	}
	
	@RequestMapping("/orderList")
	public String orderList(){
		return "gs/order.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="orderList",method=RequestMethod.POST, produces = MIME_JSON)
	public String orderList(GsSearchModel gsm){
		List<HistoryOrder> list = gsService.getOrderList(gsm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, gsm), DATE_FORMAT);
	}

}
