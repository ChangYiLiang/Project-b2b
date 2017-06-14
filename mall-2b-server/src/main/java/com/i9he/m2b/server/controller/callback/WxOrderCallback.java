package com.i9he.m2b.server.controller.callback;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.wxpay.WxCallback;
import com.i9he.common.wxpay.WxPayData;
import com.i9he.m2b.model.Wxpay;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;

public class WxOrderCallback  implements WxCallback{
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	@Autowired
	private OrderCallbackService orderCallbackService;

	@Override
	public String getOrderID(String productID) {
		// TODO Auto-generated method stub
		return productID.split("_")[1];
	}

	@Override
	public Byte getOrderType() {
		
		return B2BConstants.PAY_TYPE_ORDER;
	}

	@Override
	public int getUserID(String orderID) {
		try {
			Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderID));
			return order.getUserId();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

	@Override
	public String getProductName(String orderID) {
		// TODO Auto-generated method stub
		return "订购订单";
	}

	@Override
	public BigDecimal getTotalFee(String orderID) {
		try {
			Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderID));
			return order.getAmount();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

	@Override
	public void onPay(WxPayData payData, Object wxpayModel) {
		try {
			Wxpay model = (Wxpay) wxpayModel;
			String orderId = model.getOrderId();
			// 商品总价
			orderCallbackService.onPaySuccess(orderId, "微信支付");
		} catch (Exception e) {
			throw new RuntimeException(e);

		}

	}

}
