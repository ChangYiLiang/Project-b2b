package com.i9he.m2b.manage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.ISeoService;
import com.i9he.m2b.model.Seo;

@Controller
@RequestMapping("/controller/seo")
public class SeoController extends AbstractController {
	
	@Autowired
	private ISeoService seoService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request) {
		return "seo/list.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = MIME_JSON)
	public String list(Object model) {
		List<Seo> items = seoService.getSeoList();
		return JSON.toJSONStringWithDateFormat(wrapDataTable(items, 0), "yyyy-MM-dd HH:mm");
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap map) {
		return "seo/create.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST, produces = MIME_JSON)
	public String create(Seo seo) {
		seoService.addSeo(seo);
		return JSON.toJSONString(true);
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Integer id, ModelMap map) {
		Seo seo = seoService.getSeo(id);
		map.put("seo", seo);
		return "seo/edit.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST, produces = MIME_JSON)
	public String edit(Seo seo) {
		seoService.updateSeo(seo);
		return JSON.toJSONString(true);
	}
	
}
