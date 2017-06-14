package com.i9he.m2b.manage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAreaService;
import com.i9he.m2b.manage.biz.ITrustService;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.TruDatacenterMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Bonus;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.TruDatacenter;

@Controller
@RequestMapping("/controller/trust")
public class TrustAreaController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
	
	@Autowired
	private IAreaService areaService;
	
	@Autowired
	private ITrustService trustService;
	
	@Autowired
	private Goods2bMapper goodsmapper;
	
	@Autowired
	private TruDatacenterMapper trustmapper;

	@RequestMapping("/trust")
	public String trust(ModelMap map) throws I9heException {
		List<TruDatacenter> Trulist = trustService.getjointru();
		List<Area> area = areaService.getallArea();
		List<Goods> goods = goodsmapper.getIdcGoods();
		map.put("goods", goods);
		map.put("Trulist", Trulist);
		map.put("area", area);
		return "trustarea/trust.ftl";
	}
	
	@RequestMapping("/uptrust")
	public String uptrust(ModelMap map,Integer id) throws I9heException {
		TruDatacenter Tru = trustService.selectByPrimaryKey(id);
		List<Area> area = areaService.getallArea();
		List<Goods> goods = goodsmapper.getIdcGoods();
		map.put("goods", goods);
		map.put("area", area);
		map.put("Tru", Tru);
		return "trustarea/uptrust.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addtrust", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String addtrust(TruDatacenter record) throws I9heException {
		trustmapper.insertSelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/addarea", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String addarea(Area record) throws I9heException {
		areaService.insertSelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/uptru", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String uptru(TruDatacenter record) throws I9heException {
		trustService.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/uparea", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String uparea(Area record) throws I9heException {
		areaService.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
}