package com.i9he.m2b.manage.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component
public class GsConfigUtil {
	
	@Value("${sy.key}")
	private String sKey;
	
	@Value("${2b.phone}")
	private String b2bTel;
	
	@Value("${sy.returnGoods.url}")
	private String returnGoodsUrl;

	public String getsKey() {
		return sKey;
	}

	public String getB2bTel() {
		return b2bTel;
	}

	public String getReturnGoodsUrl() {
		return returnGoodsUrl;
	}
	
	

}
