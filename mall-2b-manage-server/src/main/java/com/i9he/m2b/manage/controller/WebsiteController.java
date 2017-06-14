package com.i9he.m2b.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IWebsiteService;
import com.i9he.m2b.model.Website;

@Controller
@RequestMapping("/controller/website")
public class WebsiteController extends AbstractController {

	@Autowired
	private IWebsiteService websiteService;

	@RequestMapping("/list")
	public String list() {
		return "website/list.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = MIME_JSON)
	public String list(Object form) throws I9heException {
		List<?> websites = websiteService.getWebsites();
		return JSON.toJSONStringWithDateFormat(wrapDataTable(websites, 0), "yyyy-MM-dd HH:mm");
	}

	@RequestMapping("/create")
	public String create() {
		return "website/create.ftl";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Website website) {
		websiteService.addWebsite(website);
		return "redirect:list.do";
	}

	@RequestMapping("/edit")
	public String edit(Integer id, ModelMap map) {
		Website website = websiteService.getWebsite(id);
		map.put("website", website);
		return "website/edit.ftl";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(Integer id, Website website, RedirectAttributes attributes) {
		websiteService.updateWebsite(website);
		attributes.addFlashAttribute("message", "更新成功");
		return "redirect:edit.do?id=" + id;
	}
}
