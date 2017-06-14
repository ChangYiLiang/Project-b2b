package com.i9he.m2b.manage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAreaService;
import com.i9he.m2b.manage.biz.ITrustService;
import com.i9he.m2b.manage.biz.ITrusteeshipService;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TruDatacenter;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.ItemSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

@Controller
@RequestMapping("/controller/trustlog")
public class TrustLogController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
	
	@Autowired
	private IAreaService areaService;
	
	@Autowired
	private ITrustService trustService;
	
	@Autowired
	private ITrusteeshipService trusteeshipService;
	
	@RequestMapping("/trustlog")
	public String trust(ModelMap map) throws I9heException {
		return "trustarea/trustlog.ftl";
	}
	
	@RequestMapping("/uptrustlog")
	public String uptrust(ModelMap map,Integer id) throws I9heException {
		Trusteeship trulog = trusteeshipService.getlogid(id);
		int cityId = trulog.getArea();
		List<TruDatacenter> trucity = trustService.gettrucity(cityId);
		map.put("trucity", trucity);
		map.put("trulog", trulog);
		return "trustarea/uptrustlog.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/trustlist", produces = "application/json;charset=utf-8")
	public String trustlist(TrusteeshipSearchModel searchModel) throws I9heException {
		List<Trusteeship> list = trusteeshipService.getjointruord(searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", list);
		map.put("iTotalRecords", searchModel.getTotal());
		map.put("iTotalDisplayRecords", searchModel.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/uptrustlogg", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String uptrustlogg(Trusteeship record) throws I9heException {
		trusteeshipService.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
}