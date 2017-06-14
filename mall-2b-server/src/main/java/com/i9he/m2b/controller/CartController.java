package com.i9he.m2b.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.model.Cart;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.model.User;

/**
 * 主界面及登录验证相关的控制器
 */

@Controller
@RequestMapping(value = { "/cart", "/i9he/cart" })
public class CartController {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");

	@Resource
	private ICartService cartService;

	@ResponseBody
	@RequestMapping("/add")
	public String addCart(Cart cart, HttpServletRequest request, HttpServletResponse response, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser();
		if (user == null) {
			return ConstantUtil.Exists;
		}
		cart.setUserId(user.getId());
		if (cartService.insertCart(cart)) {
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}
	
	@ResponseBody
	@RequestMapping("/add2")
	public String addCart2(Cart cart, HttpServletRequest request, HttpServletResponse response, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser();
		if (user == null) {
			return ConstantUtil.Exists;
		}
		cart.setUserId(user.getId());
		if (cartService.insertCart(cart)) {
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}

	@ResponseBody
	@RequestMapping("/delete")
	public String deleteCart(Integer id) throws I9heException {
		User user = SessionUtil.getSessionUser();
		if (user == null) {
			return ConstantUtil.Exists;
		}
		cartService.deleteByPrimaryKey(id);
		return ConstantUtil.Success;
	}
}