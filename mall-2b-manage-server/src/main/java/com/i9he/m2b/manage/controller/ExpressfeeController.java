package com.i9he.m2b.manage.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IExpressfeeService;
import com.i9he.m2b.manage.model.TemplatePageModel;
import com.i9he.m2b.model.ExpressfeeTemplateEX;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.search.ExpressfeeTemplateSearchModel;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Region;

@Controller
@RequestMapping("/controller/expressfee")
public class ExpressfeeController extends AbstractController{

	public static final Logger logger = Logger.getLogger(ExpressfeeController.class);
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IExpressfeeService expressfeeService;

	@RequestMapping(value="/addtemplate",method=RequestMethod.GET)
	public String addTemplate(ModelMap maps) throws I9heException{
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		maps.put("province", wrap(map));
		return "expressfee/addtemplate.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/addtemplate",method=RequestMethod.POST,produces = "application/json;charset=utf8")
	public String addTemplate(ExpressfeeTemplateEX template) throws I9heException{
		ExpressfeeTemplateEX newTemplate = expressfeeService.formatTemplate(template);
		int res = expressfeeService.addTemplate(newTemplate);
		return JSON.toJSONString(res>0);
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String templateList (HttpServletRequest request, ModelMap map,ExpressfeeTemplateSearchModel searchModel) throws UnsupportedEncodingException{
		String keyword ="";
		if(searchModel.getKeyword() != null){
			keyword = URLDecoder.decode(request.getParameter("keyword"),"UTF-8");  
			map.put("keyword", keyword);
		}
		Integer type = 3;//没有选择模板类型时将类型设为3
		if(searchModel.getExpressType() != null){
			type = searchModel.getExpressType();
		}
		//设置页大小 和页码
		searchModel.setKeyword(keyword);
		searchModel.setPageSize(5);
		if(searchModel.getPageNo() == null){
			searchModel.setPageNo(1);
		}
		List<ExpressfeeTemplateEX> templates = expressfeeService.getTemplateList(searchModel);
		TemplatePageModel pageModel = expressfeeService.getPageModel(searchModel);
		
		map.put("type", type);
		map.put("page", pageModel);
		map.put("templates", templates);
		return "expressfee/list.ftl";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modifyTemplate(Integer templateId,ModelMap map) throws I9heException{
		ExpressfeeTemplateEX template = expressfeeService.getTemplateById(templateId);
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> maps = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			maps.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		
		map.put("province", wrap(maps));
		map.put("template", template);
		return "expressfee/modify.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="modify",method=RequestMethod.POST,produces="application/json;charset=utf8")
	public String modifyTemplate(ExpressfeeTemplateEX template) throws I9heException{
		ExpressfeeTemplateEX newTemplate = expressfeeService.formatTemplate(template);
		int res = expressfeeService.modifyTemplate(newTemplate);
		return JSON.toJSONString(res>0);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete")
	public String deleteTemplate(Integer templateId){
		int res = expressfeeService.deleteTemplate(templateId);
		return JSON.toJSONString(res>0);
	}
	
	@ResponseBody
	@RequestMapping(value="/disable")
	public String desableTemplate(Integer templateId){
		int res = expressfeeService.disableTemplate(templateId);
		return JSON.toJSONString(res>0);
	}
	
	@ResponseBody
	@RequestMapping(value="/enable")
	public String enableTemplate(Integer templateId){
		int res = expressfeeService.enableTemplate(templateId);
		return JSON.toJSONString(res>0);
	}
	
	// 获得所有省级单位
	@RequestMapping(value = "/getprovince", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String threelinkage() throws I9heException {
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}

	// 根据父级查找下级城市
	@RequestMapping(value = "/city", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getCity(String parentId) throws I9heException {
		List<Region> regions = privilegeBaseApiService.getCity(parentId);
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}

	public static Map<String, Object> wrap(Map sources) {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		for (Object key : sources.keySet()) {
			result.put(String.valueOf(key), sources.get(key));
		}
		return result;
	}
}