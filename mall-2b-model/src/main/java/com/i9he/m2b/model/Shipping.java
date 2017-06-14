package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Shipping implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -1526025392384437117L;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	/**
     * 主键
     */
    private Integer id;

    /**
     * 所属订单id
     */
    private Integer orderId;

    /**
     * 物流公司名称
     */
    private String expressCompany;

    /**
     * 运单号
     */
    private String expressNo;

    /**
     * 运费
     */
    private BigDecimal expressFee;

    /**
     * 物流状态(0-未发货,1-已发货,2-已签收)
     */
    private byte state;

    /**
     * 发货日期
     */
    private Date sendDate;

    /**
     * 签收日期
     */
    private Date signDate;

    /**
     * 创建日期
     */
    private Date createdDate;

    /**
     * 更新日期
     */
    private Date updatedDate;
    
    private String origincode;
    
    private String destcode;
    

    public String getOrigincode() {
		return origincode;
	}

	public void setOrigincode(String origincode) {
		this.origincode = origincode;
	}

	public String getDestcode() {
		return destcode;
	}

	public void setDestcode(String destcode) {
		this.destcode = destcode;
	}

	/**
     */
    public Integer getId() {
        return id;
    }

    /**
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     */
    public String getExpressCompany() {
        return expressCompany;
    }

    /**
     */
    public void setExpressCompany(String expressCompany) {
        this.expressCompany = expressCompany == null ? null : expressCompany.trim();
    }

    /**
     */
    public String getExpressNo() {
        return expressNo;
    }

    /**
     */
    public void setExpressNo(String expressNo) {
        this.expressNo = expressNo == null ? null : expressNo.trim();
    }

    /**
     */
    public BigDecimal getExpressFee() {
        return expressFee;
    }

    /**
     */
    public void setExpressFee(BigDecimal expressFee) {
        this.expressFee = expressFee;
    }

    /**
     */
    public byte getState() {
        return state;
    }

    /**
     */
    public void setState(byte state) {
        this.state = state;
    }

    /**
     */
    public Date getSendDate() {
        return sendDate;
    }

    /**
     */
    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    /**
     */
    public Date getSignDate() {
        return signDate;
    }

    /**
     */
    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    /**
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    /**
     */
    public Date getUpdatedDate() {
        return updatedDate;
    }

    /**
     */
    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }
}