package com.i9he.m2b.manage.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.manage.biz.ISerialNumberService;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.SerialNumber;
import com.i9he.m2b.model.search.SerialSearchModel;
@Controller
@RequestMapping("/controller/serial")
public class SerialNumberController extends AbstractController{
	
private static final String DATE_FORMAT = "yyyy-MM-dd";
	
	@Autowired
	private ISerialNumberService serialNumberService;
	
	@Autowired
	private IGoodsService  goodsService;
	
	@RequestMapping("/list")
	public String list(){
		return "serial/serialNumber.ftl";
	}
	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST, produces = MIME_JSON)
	public String list(SerialSearchModel ssm){
		List<SerialNumber> list = serialNumberService.getAll(ssm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, ssm), DATE_FORMAT);
	}

	@ResponseBody
	@RequestMapping("/save")
	public String orderList(String id,String b2bSerial,String manufacturerSerial,String goodsid) throws NumberFormatException, I9heException {
//		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(goodsid));
		Goods goods = goodsService.selectByPrimaryKey(Integer.parseInt(goodsid));
		Integer userId = SessionUtil.getSessionUser().getId();
		if (goods != null) {
			if (id!= null && !"".equals(id)) {
				SerialNumber serialNumber = new SerialNumber();
				
				serialNumber.setId(Integer.parseInt(id));
				serialNumber.setUpdateMan(userId);
				serialNumber.setUpdateTime(new Date());
				serialNumber.setManufacturerSerial(manufacturerSerial);
				serialNumber.setB2bSerial(b2bSerial);
				
				serialNumberService.update(serialNumber);
			} else {
				
				SerialNumber serialNumber = new SerialNumber();
				serialNumber.setCreateTime(new Date());
				serialNumber.setCreateMan(userId);
				serialNumber.setManufacturerSerial(manufacturerSerial);
				serialNumber.setB2bSerial(b2bSerial);
				serialNumber.setGoodsid(Integer.parseInt(goodsid));
				serialNumberService.insert(serialNumber);
			}
			return JSON.toJSONString(true);
		} else {
			return JSON.toJSONString(false);
		}

	}
	@ResponseBody
	@RequestMapping("/findById")
	public String findById(String id){
		SerialNumber serialNumber = serialNumberService.findById(id);
		return JSON.toJSONString(serialNumber);
	}
	@ResponseBody
	@RequestMapping(value="getGoods",method=RequestMethod.POST, produces = MIME_JSON)
	public String getGoodsById(String id){
		SerialNumber serialNumber = serialNumberService.searchModel(id);
		return JSON.toJSONString(serialNumber);
	}
}
