package com.i9he.m2b.server.controller.callback;

import java.math.BigDecimal;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.wxpay.WxCallback;
import com.i9he.common.wxpay.WxPayData;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Wxpay;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;


public class WxChargeCallback implements WxCallback{
	
	@Autowired
	private ChargeCallbackService chargeCallbackService;
	
	@Autowired
	private userBalance2bMapper userbalanceMapper;
	
	private static final Logger logger = Logger.getLogger(WxChargeCallback.class);
	
	@Override
	public String getOrderID(String productID) {
		
		return productID.split("_")[1];
		
	}

	@Override
	public Byte getOrderType() {
		
		return B2BConstants.PAY_TYPE_CHARGE;
		
	}

	@Override
	public int getUserID(String orderID) {
		try {
			userBalance ub = userbalanceMapper.selectByPrimaryKey(Integer.parseInt(orderID));
			return ub.getUserId();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

	@Override
	public String getProductName(String orderID) {

		return "充值订单";
	}

	@Override
	public BigDecimal getTotalFee(String orderID) {
		try {
			userBalance ub = userbalanceMapper.selectByPrimaryKey(Integer.parseInt(orderID));
			System.out.println("fuck"+ub.getMoney());
			return ub.getMoney();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

	@Override
	public void onPay(WxPayData payData, Object wxpayModel) {
		try {
			Wxpay model = (Wxpay) wxpayModel;
			String orderID = model.getOrderId();
			// 商品总价
			chargeCallbackService.onPaySuccess(Integer.parseInt(orderID), ConstantUtil.Charge_Wx);
		} catch (Exception e) {
			logger.error("调用API出现异常！",e);
			throw new RuntimeException(e);
		}

	}

}
