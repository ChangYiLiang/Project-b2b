package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;


public class GoodsDetail implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4453735527197342400L;

	/**
     * id
     */
    private Integer id;

    /**
     * 商品id
     */
    private Integer goodsId;

    /**
     * 配件id
     */
    private Integer itemId;

    /**
     * 月付价格
     */
    private BigDecimal monthPay;

    /**
     * 季付价格 如果7天无条件退款，退全款；超过7天，则扣除安装费（冗余）
     */
    private BigDecimal quartPay;

    /**
     * 半年付价格
     */
    private BigDecimal hyPay;

    /**
     * 年付价格
     */
    private BigDecimal yearPay;

    /**
     * 2年付价格
     */
    private BigDecimal tyPay;

    /**
     * 月付续费价格
     */
    private BigDecimal mrenewPay;

    /**
     * 季付续费价格
     */
    private BigDecimal qrenewPay;

    /**
     * 半年付续费价格
     */
    private BigDecimal hrenewPay;

    /**
     * 年付续费价格
     */
    private BigDecimal yrenewPay;

    /**
     * 2年付续费价格
     */
    private BigDecimal trenewPay;

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
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     */
    public Integer getItemId() {
        return itemId;
    }

    /**
     */
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    /**
     */
    public BigDecimal getMonthPay() {
        return monthPay;
    }

    /**
     */
    public void setMonthPay(BigDecimal monthPay) {
        this.monthPay = monthPay;
    }

    /**
     */
    public BigDecimal getQuartPay() {
        return quartPay;
    }

    /**
     */
    public void setQuartPay(BigDecimal quartPay) {
        this.quartPay = quartPay;
    }

    /**
     */
    public BigDecimal getHyPay() {
        return hyPay;
    }

    /**
     */
    public void setHyPay(BigDecimal hyPay) {
        this.hyPay = hyPay;
    }

    /**
     */
    public BigDecimal getYearPay() {
        return yearPay;
    }

    /**
     */
    public void setYearPay(BigDecimal yearPay) {
        this.yearPay = yearPay;
    }

    /**
     */
    public BigDecimal getTyPay() {
        return tyPay;
    }

    /**
     */
    public void setTyPay(BigDecimal tyPay) {
        this.tyPay = tyPay;
    }

    /**
     */
    public BigDecimal getMrenewPay() {
        return mrenewPay;
    }

    /**
     */
    public void setMrenewPay(BigDecimal mrenewPay) {
        this.mrenewPay = mrenewPay;
    }

    /**
     */
    public BigDecimal getQrenewPay() {
        return qrenewPay;
    }

    /**
     */
    public void setQrenewPay(BigDecimal qrenewPay) {
        this.qrenewPay = qrenewPay;
    }

    /**
     */
    public BigDecimal getHrenewPay() {
        return hrenewPay;
    }

    /**
     */
    public void setHrenewPay(BigDecimal hrenewPay) {
        this.hrenewPay = hrenewPay;
    }

    /**
     */
    public BigDecimal getYrenewPay() {
        return yrenewPay;
    }

    /**
     */
    public void setYrenewPay(BigDecimal yrenewPay) {
        this.yrenewPay = yrenewPay;
    }

    /**
     */
    public BigDecimal getTrenewPay() {
        return trenewPay;
    }

    /**
     */
    public void setTrenewPay(BigDecimal trenewPay) {
        this.trenewPay = trenewPay;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GoodsDetail [id=");
		builder.append(id);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", itemId=");
		builder.append(itemId);
		builder.append(", monthPay=");
		builder.append(monthPay);
		builder.append(", quartPay=");
		builder.append(quartPay);
		builder.append(", hyPay=");
		builder.append(hyPay);
		builder.append(", yearPay=");
		builder.append(yearPay);
		builder.append(", tyPay=");
		builder.append(tyPay);
		builder.append(", mrenewPay=");
		builder.append(mrenewPay);
		builder.append(", qrenewPay=");
		builder.append(qrenewPay);
		builder.append(", hrenewPay=");
		builder.append(hrenewPay);
		builder.append(", yrenewPay=");
		builder.append(yrenewPay);
		builder.append(", trenewPay=");
		builder.append(trenewPay);
		builder.append("]");
		return builder.toString();
	}
    
}