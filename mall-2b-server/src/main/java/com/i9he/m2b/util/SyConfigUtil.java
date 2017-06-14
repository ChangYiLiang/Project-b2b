package com.i9he.m2b.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component
public class SyConfigUtil {
	@Value("${web.basepath}")
	private String basepath;
	
	@Value("${sy.register.url}")
	private String registerUrl;
	
	@Value("${sy.downOrder.url}")
	private String downOrderUrl;
	
	@Value("${sy.infoChange.url}")
	private String infoChangeUrl;
	
	@Value("${sy.returnGoods.url}")
	private String returnGoodsUrl;
	
	@Value("${sy.cancelorder.url}")
	private String cancelorderUrl;
	
	@Value("${sy.orderInfo.url}")
	private String orderInfoUrl;
	
	@Value("${sy.logistics.url}")
	private String logisticsUrl;
	
	@Value("${sy.accept.url}")
	private String acceptUrl;
	
	@Value("${sy.url}")
	private String syUrl;
	
	@Value("${sy.key}")
	private String sKey;
	
	@Value("${2b.phone}")
	private String b2bTel;
	
	@Value("${sy.downOrder.returnUrl}")
	private String returnUrl;
	
	

	public String getReturnUrl() {
		return returnUrl;
	}

	public String getBasepath() {
		return basepath;
	}

	public String getRegisterUrl() {
		return registerUrl;
	}

	public String getDownOrderUrl() {
		return downOrderUrl;
	}

	public String getInfoChangeUrl() {
		return infoChangeUrl;
	}

	public String getReturnGoodsUrl() {
		return returnGoodsUrl;
	}

	public String getCancelorderUrl() {
		return cancelorderUrl;
	}

	public String getOrderInfoUrl() {
		return orderInfoUrl;
	}

	public String getLogisticsUrl() {
		return logisticsUrl;
	}

	public String getAcceptUrl() {
		return acceptUrl;
	}

	public String getSyUrl() {
		return syUrl;
	}

	public String getsKey() {
		return sKey;
	}

	public String getB2bTel() {
		return b2bTel;
	}
	

}
