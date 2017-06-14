package com.i9he.m2b.server.controller.callback;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.jdpay.JDPayCallback;
import com.i9he.common.jdpay.JDPayReceiveModel;
import com.i9he.m2b.model.JDPay;
import com.i9he.m2b.util.ConstantUtil;

public class JDPayChargeCallback implements JDPayCallback {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private ChargeCallbackService chargeCallbackService;

	@Override
	public void onpay(JDPayReceiveModel jdpayModel, Object objJDPay) {
		JDPay jdpay = (JDPay) objJDPay;
		// 判断金额是否一致
		String orderId = jdpay.getOrderId();

		try {
			chargeCallbackService.onPaySuccess(Integer.parseInt(orderId), ConstantUtil.Charge_Pay);
		} catch (Exception e) {
			logger.error("京东网关支付失败", e);
		}
	}

	@Override
	public void onquery(JDPayReceiveModel jdpayModel, Object objJDPay) {
		if (jdpayModel.isSuccess()) {
			this.onpay(jdpayModel, objJDPay);
		}
	}

}
