package com.i9he.m2b.server.biz.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.AlipayMapper;
import com.i9he.m2b.mapper.JDPayMapper;
import com.i9he.m2b.mapper.WxpayMapper;
import com.i9he.m2b.model.Alipay;
import com.i9he.m2b.model.JDPay;
import com.i9he.m2b.model.Wxpay;
import com.i9he.m2b.server.biz.IThirdPartyPaymentService;

@Service
public class ThirdPartyPaymentServiceImpl implements IThirdPartyPaymentService {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String WXPAY_TRADE_NO_FORMAT = "10000yyyyMMddHHmmssSSS[CODE]";
	
	private static final String ALIPAY_TRADE_NO_FORMAT = "20000yyyyMMddHHmmssSSS[CODE]";
	
	private static final String JDPAY_ORDER_NO_FORMAT = "30000yyyyMMddHHmmssSSS[CODE]";
	
	@Autowired
	private AlipayMapper alipayMapper;
	
	@Autowired
	private WxpayMapper wxpayMapper;
	
	@Autowired
	private JDPayMapper jdpayMapper;
	
	private static int tradeNo = 0;
	private synchronized static String getNewTradeNo(String format, Date time) {
		String code = String.format("%06d", tradeNo);
		format = format.replace("[CODE]", code);
		tradeNo = (tradeNo + 1 % 1000000);
		return new SimpleDateFormat(format).format(time);
	}

	@Override
	public Alipay createAlipay(Integer userID, BigDecimal totalFee, byte type, String orderId) throws I9heException {
		// 获取原有订单
		Alipay alipay = alipayMapper.selectByTypeOrderID(type, orderId);
		if (alipay != null) {
			return alipay;
		}
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		Date endTime = cal.getTime();
		
		alipay = new Alipay();
		alipay.setCreateUserId(userID);
		alipay.setCreateTime(new Date());
		alipay.setType(type);
		alipay.setOrderId(orderId);
		alipay.setEndTime(endTime);
		alipay.setPayState(B2BConstants.PAY_STATUS_UNPAY);
		alipay.setTotalFee(totalFee);
		alipay.setOutTradeNo(getNewTradeNo(ALIPAY_TRADE_NO_FORMAT, alipay.getCreateTime()));
		alipayMapper.insertSelective(alipay);
		return alipay;
	}

	@Override
	public Wxpay createWxpay(Integer userID, BigDecimal totalFee, byte type, String orderID) throws I9heException {
		Wxpay wxpay = this.getWxpay(type, orderID, totalFee);
		if (wxpay != null) {
			return wxpay;
		}

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		Date endTime = cal.getTime();
		
		wxpay = new Wxpay();
		wxpay.setCreateUserId(userID);
		wxpay.setCreateTime(new Date());
		wxpay.setType(type);
		wxpay.setOrderId(orderID);
		wxpay.setEndTime(endTime);
		wxpay.setPayState(B2BConstants.PAY_STATUS_UNPAY);
		wxpay.setTotalFee(totalFee);
		wxpay.setOutTradeNo(getNewTradeNo(WXPAY_TRADE_NO_FORMAT, wxpay.getCreateTime()));
		wxpayMapper.insertSelective(wxpay);
		return wxpay;
	}

	@Override
	public void updateAlipay(Alipay model) throws I9heException {
		alipayMapper.updateByPrimaryKeySelective(model);
	}

	@Override
	public Alipay getAlipay(String outTradeNo) throws I9heException {
		Alipay alipay = alipayMapper.selectByOutTradeNo(outTradeNo);
		
		return alipay;
	}

	@Override
	public void updateWxpay(Wxpay model) throws I9heException {
		wxpayMapper.updateByPrimaryKeySelective(model);
	}

	@Override
	public Wxpay getWxpay(String outTradeNo) throws I9heException {
		Wxpay wxpay = wxpayMapper.selectByOutTradeNo(outTradeNo);
		
		return wxpay;
	}

	@Override
	public Alipay getAlipay(Byte type, String orderID, BigDecimal totalFee) throws I9heException {
		DecimalFormat fmt = new DecimalFormat("#.00");
		Alipay alipay = alipayMapper.selectByTypeOrderID(type, orderID);
		if (alipay != null) {
			// 订单过期
			if (alipay.getEndTime().getTime() < System.currentTimeMillis()) {
				return null;
			}
			// 订单取消/关闭
			
			// 订单金额变化
			if (!fmt.format(totalFee).equals(fmt.format(alipay.getTotalFee()))) {
				return null;
			}
		}
		return alipay;
	}

	@Override
	public Wxpay getWxpay(Byte type, String orderID, BigDecimal totalFee) throws I9heException {
		DecimalFormat fmt = new DecimalFormat("#.00");
		Wxpay wxpay = wxpayMapper.selectByTypeOrderID(type, orderID);
		if (wxpay != null) {
			// 订单过期
			if (wxpay.getEndTime().getTime() < System.currentTimeMillis()) {
				logger.warn("订单已取消");
				return null;
			}
			// 订单取消/关闭
			
			// 订单金额变化
			if (!fmt.format(totalFee).equals(fmt.format(wxpay.getTotalFee()))) {
				logger.warn("订单金额发生变化");
				return null;
			}
		}
		return wxpay;
	}

	@Override
	public JDPay createJDPay(Integer userID, BigDecimal totalFee, byte type, String orderID) throws I9heException {
		
		JDPay jdpay = this.getJDPay(type, orderID, totalFee);
		if (jdpay != null) {
			return jdpay;
		}
		
		jdpay = new JDPay();
		// 对内数据
		jdpay.setCreateTime(new Date());
		jdpay.setCreateUserId(userID);
		jdpay.setType(type);
		jdpay.setOrderId(orderID);
		jdpay.setPayState(B2BConstants.PAY_STATUS_UNPAY);
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		Date endTime = cal.getTime();
		jdpay.setEndTime(endTime);
		
		// 对外数据
		jdpay.setTotalFee(totalFee);
		
		NumberFormat numFormat = NumberFormat.getInstance();
		numFormat.setGroupingUsed(false);
		numFormat.setMaximumFractionDigits(2);
		numFormat.setMinimumFractionDigits(2);
		String vAmount = numFormat.format(totalFee);
		String jdOrderID = getNewTradeNo(JDPAY_ORDER_NO_FORMAT, jdpay.getCreateTime());
		jdpay.setvOid(jdOrderID);
		jdpay.setvAmount(vAmount);
		jdpayMapper.insertSelective(jdpay);
		return jdpay;
	}

	@Override
	public void updateJDPay(JDPay model) throws I9heException {
		jdpayMapper.updateByPrimaryKeySelective(model);
	}

	@Override
	public JDPay getJDPay(Byte type, String orderID, BigDecimal totalFee) throws I9heException {
		DecimalFormat fmt = new DecimalFormat("#.00");
		JDPay jdpay = jdpayMapper.selectByTypeOrderID(type, orderID);
		if (jdpay != null) {
			// 订单过期
			if (jdpay.getEndTime().getTime() < System.currentTimeMillis()) {
				logger.warn("订单已取消");
				return null;
			}
			// 订单取消/关闭
			
			// 订单金额变化
			if (!fmt.format(totalFee).equals(fmt.format(jdpay.getTotalFee()))) {
				logger.warn("订单金额发生变化");
				return null;
			}
		}
		return jdpay;
	}

	@Override
	public JDPay getJDPay(String jdOrderID) throws I9heException {
		return jdpayMapper.selectByVoid(jdOrderID);
	}

	@Override
	public JDPay getJDPay(Byte type, String orderID) throws I9heException {
		return jdpayMapper.selectByTypeOrderID(type, orderID);
	}
}
