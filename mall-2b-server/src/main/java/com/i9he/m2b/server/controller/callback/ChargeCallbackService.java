package com.i9he.m2b.server.controller.callback;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;
import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.mapper.AlipayMapper;
import com.i9he.m2b.mapper.BusinessMapper;
import com.i9he.m2b.mapper.BusinessTrusteeshipMapper;
import com.i9he.m2b.mapper.JDPayMapper;
import com.i9he.m2b.mapper.WxpayMapper;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Alipay;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.JDPay;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.Wxpay;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.server.controller.PayController;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderTrusteeship;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.nr.comm.util.DateUtil;

@Service
public class ChargeCallbackService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private userBalance2bMapper userbalanceMapper;
	@Autowired
	private IWalletService walletService;
	@Autowired
	private AlipayMapper alipayMapper;
	@Autowired
	private WxpayMapper wxpayMapper;
	@Autowired
	private JDPayMapper jdpayMapper;
	
	public void onPaySuccess(Integer ChargeId,Integer chargeType) throws I9heException {

		userBalance ub = userbalanceMapper.selectByPrimaryKey(ChargeId);
		// 1 是充值
		Byte b = 1;
		userBalance UB = new userBalance();
		UB.setId(ChargeId);
		UB.setChargeType(chargeType);
		UB.setChargeLog("充值"+ub.getMoney()+"成功");
		if(chargeType==ConstantUtil.Charge_Pay){
			Alipay Cha = alipayMapper.selectByTypeOrderID(b, String.valueOf(ChargeId));
			UB.setChargeOrder(Cha.getTradeNo());
		}else if(chargeType==ConstantUtil.Charge_Wx){
			Wxpay Cha = wxpayMapper.selectByTypeOrderID(b, String.valueOf(ChargeId));
			UB.setChargeOrder(Cha.getProductId());
		}else{
			JDPay Cha = jdpayMapper.selectByTypeOrderID(b, String.valueOf(ChargeId));
			UB.setChargeOrder(Cha.getvOid());
		}
		
		Wallet wallet = new Wallet();
		Wallet wallet1 = walletService.findByUserId(ub.getUserId());
		wallet.setUserId(ub.getUserId());
		wallet.setMoney(wallet1.getMoney().add(ub.getMoney()));
		
		walletService.updateByUserId(wallet);
		userbalanceMapper.updateByPrimaryKeySelective(UB);
		logger.info("修改充值账单状态-已支付+增加wallet表用户余额"+ub.getMoney());
		
	}

}
