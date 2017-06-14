package com.i9he.m2b.server.biz;

import java.math.BigDecimal;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Alipay;
import com.i9he.m2b.model.JDPay;
import com.i9he.m2b.model.Wxpay;

/**
 * 第三方支付 (2016-12-20)
 * @author Jimmy
 *
 */
public interface IThirdPartyPaymentService {

	/**
	 * 新建支付宝支付订单
	 * @param totalFee 总金额
	 * @param type 订单类型
	 * @param orderID 订单ID
	 * @return 
	 * @throws I9heException
	 */
	public Alipay createAlipay(Integer userID, BigDecimal totalFee, byte type, String orderID) throws I9heException;
	
	/**
	 * 更新支付宝支付信息
	 * @param model 支付宝数据
	 * @return
	 * @throws I9heException
	 */
	public void updateAlipay(Alipay model) throws I9heException;
	
	/**
	 * 获取支付宝交易订单
	 * @param outTradeNo 订单号
	 * @return
	 * @throws I9heException
	 */
	public Alipay getAlipay(String outTradeNo) throws I9heException;
	
	/**
	 * 获取支付宝交易订单
	 * @param type 订单类型
	 * @param orderID 订单编号
	 * @param totalFee 订单金额(如果订单金额发生变化将取消原有订单)
	 * @return
	 * @throws I9heException
	 */
	public Alipay getAlipay(Byte type, String orderID, BigDecimal totalFee) throws I9heException;

	/**
	 * 创建微信支付订单
	 * @param totalFee 总金额
	 * @param type 订单类型
	 * @param orderID 订单ID
	 * @return
	 * @throws I9heException
	 */
	public Wxpay createWxpay(Integer userID, BigDecimal totalFee, byte type, String orderID) throws I9heException;
	
	/**
	 * 更新微信支付信息
	 * @param model
	 * @return
	 * @throws I9heException
	 */
	public void updateWxpay(Wxpay model) throws I9heException;
	
	/**
	 * 获取微信支付订单
	 * @param outTradeNo 订单号
	 * @return
	 * @throws I9heException
	 */
	public Wxpay getWxpay(String outTradeNo) throws I9heException;
	
	/**
	 * 获取微信支付订单
	 * @param type 订单类型
	 * @param orderID 订单编号
	 * @param totalFee 订单金额(如果订单金额发生变化将取消原有订单)
	 * @return
	 * @throws I9heException
	 */
	public Wxpay getWxpay(Byte type, String orderID, BigDecimal totalFee) throws I9heException;
	
	/**
	 * 创建京东网关支付订单
	 * @param userID 创建人
	 * @param totalFee 总金额
	 * @param type 订单类型
	 * @param orderID 内部订单号
	 * @return
	 * @throws I9heException
	 */
	public JDPay createJDPay(Integer userID, BigDecimal totalFee, byte type, String orderID) throws I9heException;
	
	/**
	 * 更新京东网关支付订单
	 * @param model
	 * @throws I9heException
	 */
	public void updateJDPay(JDPay model) throws I9heException;
	
	/**
	 * 获取京东网关支付订单
	 * @param type 订单类型
	 * @param orderID 订单内部ID
	 * @param totalFee 订单价格
	 * @return
	 * @throws I9heException
	 */
	public JDPay getJDPay(Byte type, String orderID, BigDecimal totalFee) throws I9heException;
	
	/**
	 * 获取京东网关支付订单
	 * @param type 订单类型
	 * @param orderID 订单内部ID
	 * @return
	 * @throws I9heException
	 */
	public JDPay getJDPay(Byte type, String orderID) throws I9heException;
	
	/**
	 * 通过对外订单号获取京东网关支付订单
	 * @param jdOrderID
	 * @return
	 * @throws I9heException
	 */
	public JDPay getJDPay(String jdOrderID) throws I9heException;
}
