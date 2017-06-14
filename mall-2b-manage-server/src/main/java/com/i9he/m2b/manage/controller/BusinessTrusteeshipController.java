package com.i9he.m2b.manage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IBusinessTrusteeshipService;
import com.i9he.m2b.manage.biz.IGoodsGalleryService;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.mapper.BusinessMapper;
import com.i9he.m2b.mapper.BusinessTrusteeshipMapper;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.GoodsGalleryMapper;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.search.BusinessTrusteeshipSearchModel;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;



@Controller
@RequestMapping("/controller/trusteeshiplog")
public class BusinessTrusteeshipController {
	
	@Autowired
	private IBusinessTrusteeshipService BusinessTrusteeshipSerice;
	@Autowired
	private BusinessMapper businessMapper;
	@Autowired
	private BusinessTrusteeshipMapper businessTrusteeshipMapper; 

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
		
	@RequestMapping("/list")
	public String main(ModelMap map) {
		return "busitrusteeship/list.ftl";
	}
	
	@RequestMapping("/edit")
	public String edit(ModelMap map,Integer id) {
		Business Bs = businessMapper.selectByPrimaryKey(id);
		BusinessTrusteeship Bt = businessTrusteeshipMapper.selectByPrimaryKey(id);
		map.put("Bs", Bs);
		map.put("Bt", Bt);
		return "busitrusteeship/edit.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/busitrusteeshiplist", produces = "application/json;charset=utf-8")
	public String tobusitrusteeshiplist(BusinessTrusteeshipSearchModel searchModel) throws I9heException {
		List<BusinessTrusteeship> list = BusinessTrusteeshipSerice.GetSearchDate(searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", list);
		map.put("iTotalRecords", searchModel.getTotal());
		map.put("iTotalDisplayRecords", searchModel.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/up", produces = "application/json;charset=utf-8")
	public String toup(Business record) throws I9heException {
		businessMapper.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
}