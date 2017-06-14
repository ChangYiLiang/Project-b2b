package com.i9he.m2b.server.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IHistoryOrderService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;

@Security
@Controller
@RequestMapping("/gssy")
public class SyController {
	
	@Autowired
	private ISyUserService syUserService;
	
	@Autowired
	private SyUrlService syUrlService;
	@Autowired
	private IHistoryOrderService historyOrderService;
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	@Autowired
	private IGoodsService goodsService;
	
	@ResponseBody
	@RequestMapping("/isExists")
	public String isExists() throws I9heException{
		boolean b = syUserService.isExists();
		return JSON.toJSONString(b);
	}
	@RequestMapping("/register")
	public String register(ModelMap map,HttpServletResponse respo) throws IOException{
		boolean b = syUserService.isExists();
		if(b){
			//到后台
			return "redirect:/gssy/list.do";	
		}else{
			//去注册
			String url =  syUrlService.registerUrl();
			respo.sendRedirect(url); 
			return null;
		}
	}
	@RequestMapping("/list")
	public  String gsInfo(ModelMap map) throws I9heException{
		Integer userId = SessionUtil.getSessionUser().getId();
		boolean b = syUserService.isExists();
		String loginUrl = syUrlService.loginUrl();
		if(b){
			List<HistoryOrder> list = historyOrderService.findOrderListByUserId();
			BigDecimal balance =  syUserService.findByUser(userId.toString()).getBalance();
			map.put("balance", balance.toString());
			List<HistoryOrder> orderList = new ArrayList<HistoryOrder>();
			for(HistoryOrder h :list){
				OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(h.getOrderid());
				h.setGoodsId(orderGoods.getGoodsId());
				orderList.add(h);
			}
			map.put("list", orderList);
		}else{
			String registerUrl = syUrlService.registerUrl();
			map.put("registerUrl", registerUrl);
		}
		map.put("loginUrl", loginUrl);
		return "gs/list.ftl";
	}
}
