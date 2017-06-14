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
@RequestMapping("/auth")
public class SyLoginController {
	@Autowired
	private SyConfigUtil SyConfigUtil;
	@ResponseBody
	@RequestMapping("/accept")
	public String accept(HttpServletRequest request){
		
		String client_id = request.getParameter("client_id");
		String client_secret = request.getParameter("client_secret");
		String client_name = request.getParameter("client_name");
		String redirect_uri = request.getParameter("redirect_uri");
		String phone = request.getParameter("phone");
		String sign = request.getParameter("sign");
		String sStr = "client_id="+client_id+"&redirect_uri="+redirect_uri+"&phone="+phone;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		System.out.println("请求参数["+client_secret+" "+client_name+" "+sStr+"]");
		System.out.println("加密参数["+sign+"]");
		System.out.println("加密信息["+nowSign+"]");
		if(!sign.equals(nowSign)){
			return JSON.toJSONString("validata_error");
		}
		return JSON.toJSONString("success");
		
	}

}
