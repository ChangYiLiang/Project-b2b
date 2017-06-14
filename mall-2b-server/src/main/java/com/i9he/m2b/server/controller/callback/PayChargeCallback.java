package com.i9he.m2b.server.controller.callback;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.alipay.AlipayCallback;
import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;
import com.i9he.common.config.B2BConstants;
import com.i9he.m2b.model.Alipay;
import com.i9he.m2b.util.ConstantUtil;

public class PayChargeCallback implements AlipayCallback {

	@Autowired
	private ChargeCallbackService chargeCallbackService;

	private static final Logger logger = Logger.getLogger(PayChargeCallback.class);

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
			String ChargeId = alipay.getOrderId();
			// 商品总价
//			if (alipay.getPayState() != B2BConstants.PAY_STATUS_SUCCESS.byteValue()) {
//				logger.info("支付不成功!");
//				return false;
//			}
			this.chargeCallbackService.onPaySuccess(Integer.parseInt(ChargeId), ConstantUtil.Charge_Pay);
			return true;
		} catch (Exception e) {
			logger.error("调用API出现异常！",e);
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
