package com.i9he.m2b.server.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.i9he.common.config.MapUtils;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementAddition;
import com.i9he.m2b.model.PurchaseRequirementOffer;
import com.i9he.m2b.server.biz.IPurchaseService;
import com.i9he.m2b.server.form.PurchaseRequirementForm;
import com.i9he.m2b.util.B2BConstrant;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.ThreadContextHolder;

/**
 * 采购
 * @author Jimmy
 *
 */
@Security
@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	private IPurchaseService purchaseService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	
	@RequestMapping("/requirement")
	public String requirement(ModelMap map) throws I9heException {
		if (SessionUtil.getSessionUser() != null) {
			Integer userId = SessionUtil.getSessionUser().getId();
			List<PurchaseRequirement> records = purchaseService.getRequirements(userId);
			map.put("records", records);
		}
		map.put("types", MapUtils.wrap(B2BConstrant.PURCHASE_REQUIREMENT_TYPES));
		map.put("states", MapUtils.wrap(B2BConstrant.PURCHASE_REQUIREMENT_STATES));
		return "purchase/requirement.ftl";
	}
	
	@RequestMapping(value = "/requirement", method = RequestMethod.POST)
	public String requirement(PurchaseRequirementForm form, RedirectAttributes attrs) throws I9heException {
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String[] files = request.getParameterValues("file");
		List<PurchaseRequirementAddition> additions = null;
		if (files != null) {
			additions = new ArrayList<PurchaseRequirementAddition>();
			for (String f : files) {
				if (StringUtils.isNotBlank(f)) {
					PurchaseRequirementAddition addition = new PurchaseRequirementAddition();
					addition.setFilename(f);
					String[] names = f.split("/|\\\\");	// 获取文件名
					if (names.length > 0) {
						addition.setName(names[names.length - 1]);
					}
					additions.add(addition);
				}
			}
		}
		
		purchaseService.createRequirement(form.getRequirement(), Arrays.asList(form.getGoods()), additions);
		attrs.addFlashAttribute("message", "提交成功, 我们的客服人员将会尽快与您取得联系!");
		return "redirect:requirement.do#record";
	}
	
	@RequestMapping("/details")
	public String details(Integer id, ModelMap map) throws I9heException {
		PurchaseRequirement requirement = purchaseService.getRequirement(id);
		List<?> requirementAdditions = purchaseService.getRequirementAdditions(id);
		List<?> requirementGoods = purchaseService.getRequirementGoods(id);
		PurchaseRequirementOffer offer = purchaseService.getRequirementOffer(id);

		map.put("requirement", requirement);
		map.put("additions", requirementAdditions);
		map.put("goods", requirementGoods);
		map.put("offer", offer);

		map.put("types", MapUtils.wrap(B2BConstrant.PURCHASE_REQUIREMENT_TYPES));
		map.put("states", MapUtils.wrap(B2BConstrant.PURCHASE_REQUIREMENT_STATES));
		
		return "purchase/details.ftl";
	}
	
	@Security(validate = false)
	@RequestMapping("/offer")
	public String offer(ModelMap map) throws I9heException {
		this.requirement(map);
		return "purchase/offer.ftl";
	}
	
	@Security(validate = false)
	@RequestMapping(value = "/offer", method = RequestMethod.POST)
	public String offer(PurchaseRequirementForm form, RedirectAttributes attrs, String redirect) throws I9heException {
		this.requirement(form, attrs);
		// redirect = http://www.9he.com
		redirect = StringUtils.defaultIfEmpty(redirect, "offer.do");
		return "redirect:" + redirect;
	}
	
	@Security(validate = false)
	@RequestMapping("/offermodal")
	public String offermodal(ModelMap map) throws I9heException {
		this.requirement(map);
		return "purchase/offermodal.ftl";
	}
	
	@Security(validate = false)
	@RequestMapping(value = "/offermodal", method = RequestMethod.POST)
	public String offermodal(PurchaseRequirementForm form, RedirectAttributes attrs) throws I9heException {
		this.requirement(form, attrs);
		return "redirect:offermodal.do";
	}
	
}
