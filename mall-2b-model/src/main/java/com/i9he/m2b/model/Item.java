package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Item implements Serializable{
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
    private String title;

    /**
     * 外键
     */
    private Integer brandId;

    /**
     * 外键
     */
    private Integer categoryId;

    /**
     * 配件价格
     */
    private BigDecimal price;

    /**
     * 创建时间
     */
    private Date createdDate;

    /**
     * 配件类型1-机架类型2-处理器3-内存4-硬盘5-芯片组6-网卡7-RAID配置8-PCIe插槽9-电源10-租用型号 11-cpu核数12-内存容量13-硬盘容量14-公网IP
15-网络带宽
16-操作系统
17-托管规格
18-机柜功率
19-防御峰值
20-默认配置
21-主板
     */
    private Byte itemType;

    /**
     * 预留字段1
     */
    private String args0;

    /**
     * 预留字段2
     */
    private String args1;

    /**
     * 预留字段3
     */
    private String args2;

    /**
     * 预留字段4
     */
    private String args3;

    /**
     * 预留字段5
     */
    private String args4;
    
    
    private Integer isShow;
    
    private Integer sort;
    
    /**
     */
    public Integer getSort() {
        return sort;
    }

    /**
     */
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
    public String getTitle() {
        return title;
    }

    /**
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    /**
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
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
    public Byte getItemType() {
        return itemType;
    }

    /**
     */
    public void setItemType(Byte itemType) {
        this.itemType = itemType;
    }

    /**
     */
    public String getArgs0() {
        return args0;
    }

    /**
     */
    public void setArgs0(String args0) {
        this.args0 = args0 == null ? null : args0.trim();
    }

    /**
     */
    public String getArgs1() {
        return args1;
    }

    /**
     */
    public void setArgs1(String args1) {
        this.args1 = args1 == null ? null : args1.trim();
    }

    /**
     */
    public String getArgs2() {
        return args2;
    }

    /**
     */
    public void setArgs2(String args2) {
        this.args2 = args2 == null ? null : args2.trim();
    }

    /**
     */
    public String getArgs3() {
        return args3;
    }

    /**
     */
    public void setArgs3(String args3) {
        this.args3 = args3 == null ? null : args3.trim();
    }

    /**
     */
    public String getArgs4() {
        return args4;
    }

    /**
     */
    public void setArgs4(String args4) {
        this.args4 = args4 == null ? null : args4.trim();
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
		builder.append("Item [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", brandId=");
		builder.append(brandId);
		builder.append(", categoryId=");
		builder.append(categoryId);
		builder.append(", price=");
		builder.append(price);
		builder.append(", createdDate=");
		builder.append(createdDate);
		builder.append(", itemType=");
		builder.append(itemType);
		builder.append(", args0=");
		builder.append(args0);
		builder.append(", args1=");
		builder.append(args1);
		builder.append(", args2=");
		builder.append(args2);
		builder.append(", args3=");
		builder.append(args3);
		builder.append(", args4=");
		builder.append(args4);
		builder.append(", isShow=");
		builder.append(isShow);
		builder.append("]");
		return builder.toString();
	}
    
}