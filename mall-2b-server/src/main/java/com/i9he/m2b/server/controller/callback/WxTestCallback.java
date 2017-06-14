package com.i9he.m2b.server.controller.callback;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.wxpay.WxCallback;
import com.i9he.common.wxpay.WxPayData;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.model.Wxpay;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

public class WxTestCallback implements WxCallback {

	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	
	@Override
	public String getOrderID(String productID) {
		// 例如ORDER_1   订单号码为: 1
		// 订单：333		ORDER_333
		return productID.split("_")[1];
	}

	@Override
	public Byte getOrderType() {
		// B2BConstants.PAY_TYPE_ORDER
		return 5;
	}

	@Override
	public int getUserID(String orderID) {
		// 获取订单帐号
		return 5149; // Jimmy帐号
	}

	@Override
	public String getProductName(String orderID) {
		// 通过订单获取商品名称/也可以是常量(充值订单)
		return "测试商品";
	}

	@Override
	public BigDecimal getTotalFee(String orderID) {
		// 获取订单金额
		return new BigDecimal(0.02);
	}

	@Override
	public void onPay(WxPayData payData, Object wxpayModel) {
		// 更新订单状态
		Wxpay wxpay = (Wxpay) wxpayModel;
		if(wxpay.getPayState() == B2BConstants.PAY_STATUS_SUCCESS){
		}
		
	}

	
	
}
