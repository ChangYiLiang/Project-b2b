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
@RequestMapping("/infoChange")
public class SyInfoChangeController {
	
	@Autowired
	private SyConfigUtil SyConfigUtil;
	
	@ResponseBody
	@RequestMapping("/change")
	public String infoChange(HttpServletRequest request){
		String userinfo = request.getParameter("userinfo");
		String sign = request.getParameter("sign");
		//TODO 测试信息变更
		String sStr = "act=update&buserid=1556&content=北京,大望路万达广场11号楼8层-王六六-18645097095-&euserid=402885f6569bfda701569c02f97c0000&phone=18888888888&time=2016-08-23&type=1";
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		System.out.println("参数信息：["+userinfo+"]");
		System.out.println("加密参数：["+sign+"]");
		System.out.println("加密信息：["+nowSign+"]");
		if(!sign.equals(nowSign)){
			return JSON.toJSONString("validata_error");
		}
		return JSON.toJSONString("success");
	}
	
}
