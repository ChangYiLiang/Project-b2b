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
import com.i9he.log.api.utils.LogUtils;
import com.i9he.m2b.manage.biz.IPurchaseRequirementService;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementOffer;
import com.i9he.m2b.model.search.PurchaseRequirementSearchModel;

@Controller
@RequestMapping("/controller/requirement")
public class RequirementController extends AbstractController {
	
	@Autowired
	private IPurchaseRequirementService purchaseRequirementService;
	
	@RequestMapping("/list")
	public String list() {
		return "requirement/list.ftl";
	}
	
	@ResponseBody
	@RequestMapping( value = "/list", method = RequestMethod.POST, produces = MIME_JSON)
	public String list(PurchaseRequirementSearchModel searchModel) throws I9heException {
		List<?> list = purchaseRequirementService.searchRequirement(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, searchModel), "yyyy-MM-dd HH:mm");
	}
	
	@RequestMapping("/details")
	public String details(Integer id, ModelMap map) throws I9heException {
		PurchaseRequirement requirement = purchaseRequirementService.getRequirement(id);
		List<?> requirementAdditions = purchaseRequirementService.getRequirementAdditions(id);
		List<?> requirementGoods = purchaseRequirementService.getRequirementGoods(id);
		PurchaseRequirementOffer offer = purchaseRequirementService.getRequirementOffer(id);

		map.put("requirement", requirement);
		map.put("additions", requirementAdditions);
		map.put("goods", requirementGoods);
		map.put("offer", offer);
		return "requirement/details.ftl";
	}
	
	@RequestMapping(value = "/offer", method = RequestMethod.POST)
	public String offer(PurchaseRequirementOffer offer, RedirectAttributes attrs) throws I9heException {
		purchaseRequirementService.saveRequirementOffer(offer);
		LogUtils.writeLog("pur0", String.format("保存采购需求报价[id:%d]", offer.getId()));
		attrs.addFlashAttribute("message", "已经添加/更新了报价信息");
		return "redirect:details.do?id=" + offer.getRequirementId();
	}
	
	
}
