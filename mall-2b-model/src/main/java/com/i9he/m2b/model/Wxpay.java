package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Wxpay implements Serializable {

	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.id
	 * @mbggenerated
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_user_id
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.createUserId.validation.notempty}")
	private Integer createUserId;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_time
	 * @mbggenerated
	 */
	private Date createTime;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.type
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.type.validation.notempty}")
	private Byte type;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.order_id
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.orderId.validation.notempty}")
	@Length(message = "{m2b.wxpay.orderId.validation.length}", max = 50)
	private String orderId;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_state
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.payState.validation.notempty}")
	private Byte payState;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.end_time
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.endTime.validation.length}", max = 50)
	@NotEmpty(message = "{m2b.wxpay.endTime.validation.notempty}")
	private Date endTime;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.out_trade_no
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.outTradeNo.validation.length}", max = 50)
	private String outTradeNo;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.product_id
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.productId.validation.notempty}")
	@Length(message = "{m2b.wxpay.productId.validation.length}", max = 50)
	private String productId;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.total_fee
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.wxpay.totalFee.validation.notempty}")
	private BigDecimal totalFee;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.prepay_id
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.prepayId.validation.length}", max = 64)
	private String prepayId;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.code_url
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.codeUrl.validation.length}", max = 255)
	private String codeUrl;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.openid
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.openid.validation.length}", max = 64)
	private String openid;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_time
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.payTime.validation.length}", max = 50)
	private String payTime;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.transaction_id
	 * @mbggenerated
	 */
	@Length(message = "{m2b.wxpay.transactionId.validation.length}", max = 64)
	private String transactionId;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay
	 * @mbggenerated
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.id
	 * @return  the value of b2b_pay_wxpay.id
	 * @mbggenerated
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.id
	 * @param id  the value for b2b_pay_wxpay.id
	 * @mbggenerated
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_user_id
	 * @return  the value of b2b_pay_wxpay.create_user_id
	 * @mbggenerated
	 */
	public Integer getCreateUserId() {
		return createUserId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_user_id
	 * @param createUserId  the value for b2b_pay_wxpay.create_user_id
	 * @mbggenerated
	 */
	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_time
	 * @return  the value of b2b_pay_wxpay.create_time
	 * @mbggenerated
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.create_time
	 * @param createTime  the value for b2b_pay_wxpay.create_time
	 * @mbggenerated
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.type
	 * @return  the value of b2b_pay_wxpay.type
	 * @mbggenerated
	 */
	public Byte getType() {
		return type;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.type
	 * @param type  the value for b2b_pay_wxpay.type
	 * @mbggenerated
	 */
	public void setType(Byte type) {
		this.type = type;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.order_id
	 * @return  the value of b2b_pay_wxpay.order_id
	 * @mbggenerated
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.order_id
	 * @param orderId  the value for b2b_pay_wxpay.order_id
	 * @mbggenerated
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId == null ? null : orderId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_state
	 * @return  the value of b2b_pay_wxpay.pay_state
	 * @mbggenerated
	 */
	public Byte getPayState() {
		return payState;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_state
	 * @param payState  the value for b2b_pay_wxpay.pay_state
	 * @mbggenerated
	 */
	public void setPayState(Byte payState) {
		this.payState = payState;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.end_time
	 * @return  the value of b2b_pay_wxpay.end_time
	 * @mbggenerated
	 */
	public Date getEndTime() {
		return endTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.end_time
	 * @param endTime  the value for b2b_pay_wxpay.end_time
	 * @mbggenerated
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.out_trade_no
	 * @return  the value of b2b_pay_wxpay.out_trade_no
	 * @mbggenerated
	 */
	public String getOutTradeNo() {
		return outTradeNo;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.out_trade_no
	 * @param outTradeNo  the value for b2b_pay_wxpay.out_trade_no
	 * @mbggenerated
	 */
	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo == null ? null : outTradeNo.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.product_id
	 * @return  the value of b2b_pay_wxpay.product_id
	 * @mbggenerated
	 */
	public String getProductId() {
		return productId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.product_id
	 * @param productId  the value for b2b_pay_wxpay.product_id
	 * @mbggenerated
	 */
	public void setProductId(String productId) {
		this.productId = productId == null ? null : productId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.total_fee
	 * @return  the value of b2b_pay_wxpay.total_fee
	 * @mbggenerated
	 */
	public BigDecimal getTotalFee() {
		return totalFee;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.total_fee
	 * @param totalFee  the value for b2b_pay_wxpay.total_fee
	 * @mbggenerated
	 */
	public void setTotalFee(BigDecimal totalFee) {
		this.totalFee = totalFee;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.prepay_id
	 * @return  the value of b2b_pay_wxpay.prepay_id
	 * @mbggenerated
	 */
	public String getPrepayId() {
		return prepayId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.prepay_id
	 * @param prepayId  the value for b2b_pay_wxpay.prepay_id
	 * @mbggenerated
	 */
	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId == null ? null : prepayId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.code_url
	 * @return  the value of b2b_pay_wxpay.code_url
	 * @mbggenerated
	 */
	public String getCodeUrl() {
		return codeUrl;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.code_url
	 * @param codeUrl  the value for b2b_pay_wxpay.code_url
	 * @mbggenerated
	 */
	public void setCodeUrl(String codeUrl) {
		this.codeUrl = codeUrl == null ? null : codeUrl.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.openid
	 * @return  the value of b2b_pay_wxpay.openid
	 * @mbggenerated
	 */
	public String getOpenid() {
		return openid;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.openid
	 * @param openid  the value for b2b_pay_wxpay.openid
	 * @mbggenerated
	 */
	public void setOpenid(String openid) {
		this.openid = openid == null ? null : openid.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_time
	 * @return  the value of b2b_pay_wxpay.pay_time
	 * @mbggenerated
	 */
	public String getPayTime() {
		return payTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.pay_time
	 * @param payTime  the value for b2b_pay_wxpay.pay_time
	 * @mbggenerated
	 */
	public void setPayTime(String payTime) {
		this.payTime = payTime == null ? null : payTime.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.transaction_id
	 * @return  the value of b2b_pay_wxpay.transaction_id
	 * @mbggenerated
	 */
	public String getTransactionId() {
		return transactionId;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_pay_wxpay.transaction_id
	 * @param transactionId  the value for b2b_pay_wxpay.transaction_id
	 * @mbggenerated
	 */
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId == null ? null : transactionId.trim();
	}
}