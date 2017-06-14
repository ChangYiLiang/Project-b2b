package com.i9he.m2b.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.interceptor.ChildOnly;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.server.biz.IWebsiteService;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;

@Controller
@ChildOnly
@RequestMapping("/widget")
public class WidgetController {
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	@Autowired
	private IGoodsService goodsService;
	
	@Autowired
	private IWebsiteService websiteService;
	
	private ModelAndView tocontent(String htmlContent) {
		return new ModelAndView("widget/content.ftl", "html", htmlContent);
	}

	@RequestMapping("/ordergoods")
	public String orderGoods(Integer orderId, ModelMap map) throws I9heException {
		Order order = orderBaseApiServcie.getOrderById(orderId);
		OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
		Goods goods =  goodsService.getGoodsByid(orderGoods.getGoodsId());
		map.put("goods", goods);
		map.put("order", order);
		map.put("orderGoods", orderGoods);
		return "widget/ordergoods.ftl";
	}
	
	@RequestMapping("/website/{areacode}")
	public ModelAndView website(@PathVariable("areacode") String areacode, ModelMap map) {
		String content = websiteService.getWeisteContent(areacode);
		return tocontent(content);
	}
	
	
}
