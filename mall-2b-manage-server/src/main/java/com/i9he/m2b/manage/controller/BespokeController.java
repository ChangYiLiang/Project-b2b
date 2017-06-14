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
import com.i9he.common.util.DateUtil;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.BespokeMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.SuggestMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.Bespoke;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Goodstag;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Suggest;



@Controller
@RequestMapping("/controller/bespoke")
public class BespokeController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
	
	@Autowired
	private SuggestMapper suggestmapper;
	@Autowired
	private FestLogMapper festlogmapper;
	@Autowired
	private BespokeMapper bespokemapper;
	
	
	@RequestMapping("/bespokelog")
	public String bespoke(ModelMap map) throws I9heException {
		List<Bespoke> list = bespokemapper.getalllog();
		map.put("list", list);
		return "bespoke/bespoke.ftl";
	}
	
	@RequestMapping("/upbespoke")
	public String upbespoke(ModelMap map,Integer id) throws I9heException {
		Bespoke bespoke = bespokemapper.selectByPrimaryKey(id);
		map.put("list", bespoke);
		return "bespoke/upbespoke.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value ="shenhepoke",produces="text/plain;charset=UTF-8")
	public String shenhepoke(Bespoke record) throws I9heException{
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
        record.setEndDate(sdf.format(new Date()));
		bespokemapper.updateByPrimaryKeySelective(record);
		return ConstantUtil.Success;	
	}
	
}