package com.i9he.m2b.server.controller.callback;

import com.i9he.common.alipay.AlipayCallback;
import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;

public class DefaultAlipayCallback implements AlipayCallback {

	@Override
	public String onReturn(AlipayNotifyModel alipayModel, Object alipay) throws Exception {
		
		System.out.println("测试鸡");
		//在这里执行回调后的数据库操作充值什么的
		
		return "redirect:/demo/pay.do?success=true";
	}

	@Override
	public boolean onNotity(AlipayNotifyModel alipayModel, Object alipay) {
		return true;
	}

	@Override
	public String onReturnError(AlipayNotifyModel alipayModel, Object alipay) throws Exception {
		return "redirect:/demo/pay.do?success=false";
	}

	@Override
	public boolean onRefundNotify(AlipayRefundNotifyModel refundModel) {
		return true;
	}

	
}
