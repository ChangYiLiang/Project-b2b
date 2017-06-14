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
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.SuggestMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Goodstag;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Suggest;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TruDatacenter;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.ItemSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;


@Controller
@RequestMapping("/controller/suggest")
public class SuggestController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
	
	@Autowired
	private SuggestMapper suggestmapper;
	@Autowired
	private FestLogMapper festlogmapper;
	@Autowired
	private Balances2bMapper balancesmapper; 
	
	@RequestMapping("/suggestlog")
	public String suggest(ModelMap map) throws I9heException {
		List<Suggest> list = suggestmapper.getalldata();
		map.put("list", list);
		return "suggest/suggest.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value ="shenhe",produces="text/plain;charset=UTF-8")
	public String shenhe(Integer id) throws I9heException{
		//修改审核状态
		suggestmapper.upsubmit(id);
		
		Suggest suggest = suggestmapper.selectByPrimaryKey(id);
		int userId = suggest.getUserId();
		Balances ba = balancesmapper.selectByPrimaryKey(userId);
		int add = ba.getFestBalance()+100;
		
		//增加用户节操币
		Balances balances = new Balances();
		balances.setUserId(userId);
		balances.setFestBalance(add);
		balancesmapper.updateByPrimaryKeySelective(balances);
		//记录节操币使用明细
		FestLog festlog = new FestLog();
		festlog.setUserId(userId);
		festlog.setLogNum(100);
		festlog.setLogTime(new Date());
		festlog.setLogFlag(0);
		festlog.setLogDesc("投诉建议增加节操币"+100);
		festlogmapper.insertSelective(festlog);
		
		return ConstantUtil.Success;
		
	}
	
}