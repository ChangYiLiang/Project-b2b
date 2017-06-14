package com.i9he.m2b.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 */
public class GoodsItem  implements Serializable{
	private static final long serialVersionUID = 9172100461422766149L;

	/**
     * 
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
     * 展示类型 预留，待定义
     */
    private Boolean showType;

    /**
     * 创建时间
     */
    private Date createDate;
    
    /**
     * 是否显示
     * */
    private Integer isShow;
    
    private Integer sort;
    
    public Integer getSort(){
    	return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
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
    public Boolean getShowType() {
        return showType;
    }

    /**
     */
    public void setShowType(Boolean showType) {
        this.showType = showType;
    }

    /**
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    /**
     */
    public Integer getIsShow() {
        return isShow;
    }

    /**
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GoodsItem [id=");
		builder.append(id);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", itemId=");
		builder.append(itemId);
		builder.append(", showType=");
		builder.append(showType);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", isShow=");
		builder.append(isShow);
		builder.append("]");
		return builder.toString();
	}
    
}