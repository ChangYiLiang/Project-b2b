package com.i9he.m2b.server.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.i9he.m2b.model.LogisticsDetail;
import com.i9he.m2b.model.LogisticsInfo;
import com.i9he.m2b.server.biz.ILogisticService;

@Controller
@RequestMapping("/logistic")
public class LogisticController {

	public static final Logger logger = Logger.getLogger(LogisticController.class);
	
	@Autowired
	private ILogisticService logisticService;
	
	//物流推送
	@ResponseBody
	@RequestMapping(value = "/logisticspush", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String logisticsPush(HttpServletRequest request,ModelMap map) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String data = request.getParameter("RequestData");
		JSONObject da = JSON.parseObject(data);
		Date pushTime = sdf1.parse(da.getString("PushTime"));
		JSONArray jsonArray = da.getJSONArray("Data");
		for(Object c:jsonArray){
			LogisticsInfo logisticsInfo  = JSON.parseObject(c.toString(), LogisticsInfo.class);
			JSONObject parseObject = JSON.parseObject(c.toString());
			JSONArray jsonArray2 = parseObject.getJSONArray("Traces");
			List<LogisticsDetail> LogisticsDetails = JSON.parseArray(jsonArray2+"", LogisticsDetail.class);
			logisticsInfo.setPushTime(pushTime);
			logisticService.addLogistics(logisticsInfo,LogisticsDetails);
		}
		
		map.put("EBusinessID", "1268162");
		map.put("UpdateTime", sdf.format(new Date()));
		map.put("Success", true);
		map.put("Reason", "");
		return JSON.toJSONString(map);
	}

	@RequestMapping(value="/textLogists")
	public String text(){
		
		return "order/test.ftl";
	}
}