package com.i9he.sy.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;

@Controller
@RequestMapping("/returnGoods")
public class SyReturnGoodsController {
	@Autowired
	private SyConfigUtil SyConfigUtil;
	@ResponseBody
	@RequestMapping("/calcreturn")
	public String returnGoods(HttpServletRequest request){
		
		String orderno = request.getParameter("orderno");
		String orderamount = request.getParameter("orderamount");
		String returnamount = request.getParameter("returnamount");
		String euserid = request.getParameter("euserid");
		String phone = request.getParameter("phone");
		String ordertime = request.getParameter("ordertime");
		String loanid = request.getParameter("loanid");
		String goods = request.getParameter("goods");
		String sign = request.getParameter("sign");
		
		String sStr = "orderno="+orderno+"&orderamount="+orderamount+"&returnamount="+returnamount+"&euserid="+euserid+"&phone="+phone+"&ordertime="+ordertime+"&loanid="+loanid+"&goods="+goods;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		if(!sign.equals(nowSign)){
			return JSON.toJSONString("validata_error");
		}
		return JSON.toJSONString("success");
	}

}
