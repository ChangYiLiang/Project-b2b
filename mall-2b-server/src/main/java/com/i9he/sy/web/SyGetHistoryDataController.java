package com.i9he.sy.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
@Controller
@RequestMapping("/historyData")
public class SyGetHistoryDataController {
	
	@Autowired
	private SyConfigUtil SyConfigUtil;
	
	@Autowired
	private SyUrlService syUrlService;
	
	@ResponseBody
	@RequestMapping(value="/info",produces = "application/json;charset=UTF-8")
	public String getInfo(HttpServletRequest request) throws NumberFormatException, I9heException{
		String signId = request.getParameter("id");
		String id = SyAESUtil.decrypt(SyConfigUtil.getsKey(),signId);
		return JSON.toJSONString(syUrlService.getHistoryOrderData(Integer.parseInt(id)));
	}
}
