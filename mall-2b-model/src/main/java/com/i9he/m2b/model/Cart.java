package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Cart implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 3163300612592626336L;

	/**
     * 
     */
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 商品id
     */
    private Integer goodsId;

    /**
     * 商品数量
     */
    private Integer goodsNum;

    /**
     * 添加时间
     */
    private Date cretedDate;

    /**
     * 更新时间
     */
    private Date updatedDate;

    /**
     * 配件ID列表
     */
    private String itemIdList;

    /**
     * 购买详情
     */
    private String config;

    /**
     * 商品单价
     */
    private BigDecimal price;

    /**
     * 是否删除 0 否 1是
     */
    private Integer isDelete;
    
    private Integer isSubmit;

    private Integer cycle;
    
    private BigDecimal allprice;
    
    private Integer serviceId;
    
    /**
     * 是否IDC 1是IDC
     */
    private Integer isIdc;
    
    private Integer orderId;
    
    private String goodsImg;
    
    private Integer trustarea;
    
    private Integer ipnum;
    
    public Integer getIpnum(){
    	return ipnum;
    }
    public void setIpnum(Integer ipnum){
    	this.ipnum = ipnum;
    }
    
    public Integer getTrustarea(){
    	return trustarea;
    }
    
    public void setTrustarea(Integer trustarea){
    	this.trustarea = trustarea;
    }
    
    
    public Integer getIsSubmit() {
		return isSubmit;
	}

	public void setIsSubmit(Integer isSubmit) {
		this.isSubmit = isSubmit;
	}

	public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg == null ? null : goodsImg.trim();
    }
    
    private String goodsName;
    
    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }
    
    public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getIsIdc() {
		return isIdc;
	}

	public void setIsIdc(Integer isidc) {
		this.isIdc = isidc;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public BigDecimal getAllprice() {
		return allprice;
	}

	public void setAllprice(BigDecimal allprice) {
		this.allprice = allprice;
	}

	public Integer getCycle() {
		return cycle;
	}

	public void setCycle(Integer cycle) {
		this.cycle = cycle;
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
    public Integer getUserId() {
        return userId;
    }

    /**
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
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
    public Integer getGoodsNum() {
        return goodsNum;
    }

    /**
     */
    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    /**
     */
    public Date getCretedDate() {
        return cretedDate;
    }

    /**
     */
    public void setCretedDate(Date cretedDate) {
        this.cretedDate = cretedDate;
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

    /**
     */
    public String getItemIdList() {
        return itemIdList;
    }

    /**
     */
    public void setItemIdList(String itemIdList) {
        this.itemIdList = itemIdList == null ? null : itemIdList.trim();
    }

    /**
     */
    public String getConfig() {
        return config;
    }

    /**
     */
    public void setConfig(String config) {
        this.config = config == null ? null : config.trim();
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

   

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Cart [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", goodsNum=");
		builder.append(goodsNum);
		builder.append(", cretedDate=");
		builder.append(cretedDate);
		builder.append(", updatedDate=");
		builder.append(updatedDate);
		builder.append(", itemIdList=");
		builder.append(itemIdList);
		builder.append(", config=");
		builder.append(config);
		builder.append(", price=");
		builder.append(price);
		builder.append(", isDelete=");
		builder.append(isDelete);
		builder.append(", allprice=");
		builder.append(allprice);
		builder.append(", goodsImg=");
		builder.append(goodsName);
		builder.append(", goodsName=");
		builder.append(goodsImg);
		builder.append("]");
		return builder.toString();
	}
    
}