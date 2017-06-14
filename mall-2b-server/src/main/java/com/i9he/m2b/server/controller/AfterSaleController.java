package com.i9he.m2b.server.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.config.MapUtils;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleExample;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.search.SimpleSearchModel;
import com.i9he.m2b.server.biz.IAfterSaleService;
import com.i9he.m2b.server.biz.IOrderService;
import com.i9he.m2b.server.form.AfterSaleApplyForm;
import com.i9he.m2b.util.B2BConstrant;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Order;

@Security
@Controller
@RequestMapping("/afs")
public class AfterSaleController {
	
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IAfterSaleService afterSaleService;
	
	@RequestMapping("/apply")
	public String apply(Integer orderId, Integer goodsId, ModelMap map) throws I9heException {
		Order order = orderService.getUserOrder(orderId);
		Goods goods = orderService.getOrderGoods(orderId, goodsId);
		map.put("order", order);
		map.put("goods", goods);
		return "afs/apply.ftl";
	}
	
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public String apply(AfterSaleApplyForm applyForm) throws I9heException {
		afterSaleService.apply(applyForm.getAftersale(), applyForm.getRefund(), applyForm.getShipping());
		return "redirect:/afs/repair.do";
	}
	
	@RequestMapping("/repair")
	public String repair(SimpleSearchModel searchModel, ModelMap map) throws I9heException {
		searchModel.setPageSize(5);
		AfterSaleExample example = new AfterSaleExample();
		example.createCriteria()
			   .andUserIdEqualTo(SessionUtil.getSessionUserID());
		example.setOrderByClause("id desc");
		
		List<AfterSale> aftersales = afterSaleService.getAfterSales(example, searchModel);
		Map<String, Order> orders = new HashMap<String, Order>();
		for (AfterSale afs : aftersales) {
			if (orders.get(afs.getOrderId().toString()) != null) {
				continue;
			}
			Order order = orderService.getUserOrder(afs.getOrderId());
			if (order != null) {
				orders.put(order.getId().toString(), order);
			}
		}

		map.put("states", MapUtils.wrap(B2BConstrant.AFTER_SALE_STATES));
		map.put("types", MapUtils.wrap(B2BConstrant.AFTER_SALE_TYPES));
		
		map.put("aftersales", aftersales);
		map.put("orders", orders);
		map.put("searchModel", searchModel);
		return "afs/repair.ftl";
	}
	
	@RequestMapping("/servicedetails")
	public String servicedetails(ModelMap map, Integer id) throws I9heException {
		AfterSale afs = afterSaleService.getAfterSale(id);
		List<AfterSaleRecord> records = afterSaleService.getAfterSaleRecord(id);
		
		map.put("aftersale", afs);
		map.put("records", records);
		map.put("states", MapUtils.wrap(B2BConstrant.AFTER_SALE_STATES));
		map.put("types", MapUtils.wrap(B2BConstrant.AFTER_SALE_TYPES));
		return "afs/servicedetails.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancel", method = RequestMethod.POST, produces = "applicatoin/json;charset=utf-8")
	public String cancel(Integer id) throws I9heException {
		afterSaleService.cancel(id);
		return JSON.toJSONString(true);
	}
}
