package com.i9he.m2b.manage.model;

import java.math.BigDecimal;

import com.i9he.m2b.model.TagMapping;

public class TagMappingGoodsViewModel extends TagMapping {

	private static final long serialVersionUID = 1L;

	private String goodsName;

	private BigDecimal goodsPrice;

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public BigDecimal getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(BigDecimal goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
}
