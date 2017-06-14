package com.i9he.m2b.server.controller.callback;

import java.util.Map;

import com.i9he.common.exception.I9heException;
import com.i9he.common.wxpay.WxCallback;

public class WxCallbackConfig {
	
	private Map<String, WxCallback> callbacks;
	
	public WxCallback getWxCallback(String productID) throws I9heException {
		for (String key : callbacks.keySet()) {
			if(productID.startsWith(key)) {
				return callbacks.get(key);
			}
		}
		
		throw new I9heException("500", "不支持该微信支付");
	}

	public void setCallbacks(Map<String, WxCallback> callbacks) {
		this.callbacks = callbacks;
	}

}
