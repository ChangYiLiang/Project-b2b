package com.i9he.m2b.controller.sms.taobao;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.common.sms.TaobaoSms;

public class ValidateCodeSmsSender extends TaobaoSms {
	
	@Override
	public boolean send(String recNum, String message) throws I9heException {
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("code", message);
		return super.send(recNum, JSON.toJSONString(data));
	}
	
}
