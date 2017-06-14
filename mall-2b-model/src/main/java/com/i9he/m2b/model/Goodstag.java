package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Goodstag implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4364605604626846449L;

	/**
     * 
     */
    private Integer id;

    /**
     * 
     */
    private Integer goodsId;

    /**
     * 外键
     */
    private String goodsTag;
    
    /**
     * 属性
     * */
    private String goodsAttr;
    
    /**
     * 是否显示
     * */
    private Integer isShow;
    
    /**
     * 排序
     * */
    private Integer sort;

    /**
     * get set 后面第一个字母要大写，不然json解析不出来，鸡巴
     * */
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
    public String getGoodsTag() {
        return goodsTag;
    }

    /**
     */
    public void setGoodsTag(String goodsTag) {
        this.goodsTag = goodsTag == null ? null : goodsTag.trim();
    }
    
    /**
     */
    public String getGoodsAttr() {
        return goodsAttr;
    }

    /**
     */
    public void setGoodsAttr(String goodsAttr) {
        this.goodsAttr = goodsAttr == null ? null : goodsAttr.trim();
    }
    
    public Integer getIsShow() {
        return isShow;
    }

    /**
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }
    
    public Integer getSort() {
        return sort;
    }

    /**
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Goodstag [id=");
		builder.append(id);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", goodsTag=");
		builder.append(goodsTag);
		builder.append(", goodsAttr=");
		builder.append(goodsAttr);
		builder.append(", isShow=");
		builder.append(isShow);
		builder.append(", sort=");
		builder.append(sort);
		builder.append("]");
		return builder.toString();
	}
    
}