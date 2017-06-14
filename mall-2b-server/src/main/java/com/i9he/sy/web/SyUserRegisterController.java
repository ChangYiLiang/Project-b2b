package com.i9he.sy.web;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;

@Controller
@RequestMapping("/register")
public class SyUserRegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(SyUserRegisterController.class);
	@Autowired
	private SyConfigUtil SyConfigUtil;
	@Autowired
	private ISyUserService syUserService;

	@ResponseBody
	@RequestMapping("/data")
	public String test(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		String balance = request.getParameter("balance");
		String state = request.getParameter("state");
		String buserid = request.getParameter("buserid");
		String info = request.getParameter("info");
		String sign = request.getParameter("sign");
		
		//userid=**&balance=**&state=**&buserid=**
		String content = "userid="+userid+"&balance="+balance+"&state="+state+"&buserid="+buserid;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(), content);
		if(!sign.equals(nowSign)){
			return JSON.toJSONString("validata_error");
		}
		try{
			JSONObject jsonObject = JSONObject.fromObject(info);
			SyUser syUser = new SyUser();
			syUser.setUserId(userid);
			if(balance!=null){
				syUser.setBalance(new BigDecimal(balance));
			}
			syUser.setState(Byte.valueOf(state));
			syUser.setBuserid(Integer.parseInt(buserid));
			syUser.setPhone(jsonObject.getString("phone"));
			syUser.setEnterpriseName(jsonObject.getString("enterprise_name"));
			syUser.setLegalperson(jsonObject.getString("legalperson"));
			syUser.setIdcard(jsonObject.getString("idcard"));
			syUser.setOfficephone(jsonObject.getString("officephone"));
			syUser.setCard(Byte.valueOf(jsonObject.getString("card")));
			String staffcount = jsonObject.getString("staffcount");
			if(!"".equals(staffcount) && staffcount!=null){
				syUser.setStaffcount(Integer.parseInt(jsonObject.getString("staffcount")));
			}
			syUser.setBinum(jsonObject.getString("binum"));
			syUser.setOrgCode(jsonObject.getString("org_code"));
			syUser.setTaxCardNum(jsonObject.getString("tax_card_num"));
			syUser.setCardno(jsonObject.getString("cardno"));
			syUser.setSccardno(jsonObject.getString("sccardno"));
			syUser.setCreateTime(new Date());
			syUserService.insert(syUser);
			System.out.println("请求参数["+info+"]");
			return JSON.toJSONString("success");
		}catch(JSONException e){
			logger.error("json错误");
			return JSON.toJSONString("error"); 
		}
	}

	@ResponseBody
	@RequestMapping("/confer")
	public String confer(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		String balance = request.getParameter("balance");
		String state = request.getParameter("state");
		String buserid = request.getParameter("buserid");
		String sign = request.getParameter("sign");
		
		SyUser syUser = new SyUser();
		syUser.setUserId(userid);
		if(balance!=null){
			syUser.setBalance(new BigDecimal(balance));
		}
		syUser.setState(Byte.valueOf(state));
		syUser.setBuserid(Integer.parseInt(buserid));
		syUser.setId(syUserService.findByUser(buserid).getId());
		
		String sStr = "userid=" + userid + "&balance=" + balance + "&state=" + state + "&buserid=" + buserid;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		
		logger.info("请求参数["+sStr+"]");
		
		logger.info("   sign:--"+sign);
		logger.info("nowSign:--"+nowSign);
		if (nowSign.equals(sign)) {
			int i = syUserService.update(syUser);
			if (i > 0) {
				return JSON.toJSONString("success");
			}
		} else {
			logger.info("签名验证错误");
			return JSON.toJSONString("validate_error");
			
		}
		logger.info("数据出错");
		return JSON.toJSONString("error");
	}


}
