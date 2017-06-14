package com.i9he.m2b.server.controller.callback;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.alipay.AlipayCallback;
import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.mapper.UserBonusMapper;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.server.controller.PayController;
import com.i9he.m2b.util.SessionUtil;

public class ChargeAlipayCallback implements AlipayCallback {
	
	@Autowired
	private userBalance2bMapper userbalanceMapper;
	@Autowired
	private IWalletService walletService;
	
	private static final Logger logger = Logger.getLogger(PayController.class);

	@Override
	public String onReturn(AlipayNotifyModel alipayModel, Object alipay) throws Exception {
		
		logger.info("支付支付宝回调状态"+alipayModel.isSuccess());
		
		if(alipayModel.isSuccess()){
		
			userBalance ub = new userBalance();
			ub.setChargeOrder(alipayModel.getTradeNo());
			ub.setId(userbalanceMapper.getUserbalanceId(SessionUtil.getSessionUser().getId()));
			ub.setChargeLog("会员"+SessionUtil.getSessionUser().getId()+"于"+new Date()+"支付宝充值"+alipayModel.getTotalFee()+"已充值"+"增加用户余额"+alipayModel.getTotalFee());
			
			Wallet wallet = new Wallet();
			Wallet wallet1 = walletService.findByUserId();
			wallet.setUserId(SessionUtil.getSessionUser().getId());
			wallet.setMoney(wallet1.getMoney().add(alipayModel.getTotalFee()));
			
			walletService.updateByUserId(wallet);
			userbalanceMapper.updateByPrimaryKeySelective(ub);
			logger.info("修改充值账单状态-已支付+增加wallet表用户余额"+alipayModel.getTotalFee());
		
		}else{
			
			logger.info("支付支付宝回调状态失败"+alipayModel.isSuccess());
			
		}
		
		return "redirect:/mark/usercharge.do?success=true";
	}

	@Override
	public boolean onNotity(AlipayNotifyModel alipayModel, Object alipay) {
		
		logger.info("支付支付宝回调状态"+alipayModel.isSuccess());
		if(alipayModel.isSuccess()){
			userBalance ub = new userBalance();
			ub.setChargeOrder(alipayModel.getTradeNo());
			ub.setId(userbalanceMapper.getUserbalanceId(SessionUtil.getSessionUser().getId()));
			ub.setChargeLog("会员"+SessionUtil.getSessionUser().getId()+"于"+new Date()+"支付宝充值"+alipayModel.getTotalFee()+"已充值"+"增加用户余额"+alipayModel.getTotalFee());
			
			Wallet wallet = new Wallet();
			Wallet wallet1 = walletService.findByUserId();
			wallet.setUserId(SessionUtil.getSessionUser().getId());
			wallet.setMoney(wallet1.getMoney().add(alipayModel.getTotalFee()));
			
			walletService.updateByUserId(wallet);
			userbalanceMapper.updateByPrimaryKeySelective(ub);
			logger.info("修改充值账单状态-已支付+增加wallet表用户余额"+alipayModel.getTotalFee());
		}else{
			logger.info("支付支付宝回调状态失败"+alipayModel.isSuccess());
		}
		
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
