package com.i9he.m2b.model;

import java.io.Serializable;

public class GoodsRank implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String goods_name;
	
	private String goodsCount;

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}
	
	

}
