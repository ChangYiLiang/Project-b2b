package com.i9he.m2b.server.controller.callback;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.alipay.AlipayCallback;
import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;
import com.i9he.common.config.B2BConstants;
import com.i9he.m2b.model.Alipay;

public class PayOrderCallback implements AlipayCallback {

	@Autowired
	private OrderCallbackService orderCallbackService;

	private static final Logger logger = Logger.getLogger(PayOrderCallback.class);

	@Override
	public String onReturn(AlipayNotifyModel alipayModel, Object model) throws Exception {
		if (this.onNotity(alipayModel, model)) {
			return "redirect:/cart/success.do";
		}
		return "";
	}

	@Override
	public boolean onNotity(AlipayNotifyModel alipayModel, Object model) {
		try {
			Alipay alipay = (Alipay) model;
			String orderId = alipay.getOrderId();
			// 商品总价
			if (alipay.getPayState() != B2BConstants.PAY_STATUS_SUCCESS.byteValue()) {
				logger.info("支付不成功!");
				return false;
			}
			this.orderCallbackService.onPaySuccess(orderId, "支付宝支付");
			return true;
		} catch (Exception e) {
			logger.info("调用API出现异常！");
			return false;
		}
	}

	@Override
	public String onReturnError(AlipayNotifyModel alipayModel, Object alipay) throws Exception {
		return null;
	}

	@Override
	public boolean onRefundNotify(AlipayRefundNotifyModel refundModel) {
		return false;
	}

}
