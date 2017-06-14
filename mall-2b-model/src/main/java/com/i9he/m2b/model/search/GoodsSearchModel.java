package com.i9he.m2b.model.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public class GoodsSearchModel implements Serializable{
	
	private static final long serialVersionUID = 4041030617870550816L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;
	
    private Integer id;
    private Integer brandId;
    private String goodsName;
    private String mainTitle;
    private String secondTitle;
    private BigDecimal goodsPrice;
    private Integer categoryId;
    private Integer isBuy;
    private Date upDate;
    private Date offDate;
    private Integer clickCount;
    private Boolean ifIdc;
    private Integer addDate;
    private BigDecimal setupFee;
    private String goodsDesc;
    private String keyword;
    private String goodsImg;
    private Integer goodsType;
    private String goodsTest;
    private Integer iftrust;
    private Integer ifonly;
    private String jsfile;
    
    public int getStartPage() {
		return pageSize * (pageNo-1);
	}
	public SimpleDateFormat getFormatter() {
		return formatter;
	}
	public void setFormatter(SimpleDateFormat formatter) {
		this.formatter = formatter;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBrandId() {
        return brandId;
    }
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getGoodsName() {
        return goodsName;
    }
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getMainTitle() {
        return mainTitle;
    }
    public void setMainTitle(String mainTitle) {
        this.mainTitle = mainTitle == null ? null : mainTitle.trim();
    }

    public String getSecondTitle() {
        return secondTitle;
    }
    public void setSecondTitle(String secondTitle) {
        this.secondTitle = secondTitle == null ? null : secondTitle.trim();
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }
    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }
    
    public Integer getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getIsBuy() {
        return isBuy;
    }
    public void setIsBuy(Integer isBuy) {
        this.isBuy = isBuy;
    }

    public Date getUpDate() {
        return upDate;
    }
    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

    public Date getOffDate() {
        return offDate;
    }
    public void setOffDate(Date offDate) {
        this.offDate = offDate;
    }

    public Integer getClickCount() {
        return clickCount;
    }
    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public Boolean getIfIdc() {
        return ifIdc;
    }
    public void setIfIdc(Boolean ifIdc) {
        this.ifIdc = ifIdc;
    }

    public Integer getAddDate() {
        return addDate;
    }
    public void setAddDate(Integer addDate) {
        this.addDate = addDate;
    }

    public BigDecimal getSetupFee() {
        return setupFee;
    }
    public void setSetupFee(BigDecimal setupFee) {
        this.setupFee = setupFee;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }
    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc == null ? null : goodsDesc.trim();
    }
    
    public String getGoodsImg(){
    	return goodsImg;
    }
    public void setGoodsImg(String goodsImg){
    	this.goodsImg = goodsImg == null ? null : goodsImg.trim();
    }
    
    public Integer getGoodsType(){
    	return goodsType;
    }
    public void setGoodsType(Integer goodsType){
    	this.goodsType=goodsType;
    }
    
    public String getGoodsTest(){
    	return goodsTest;
    }
    public void setGoodsTest(String goodsTest){
    	this.goodsTest = goodsTest == null ? null : goodsTest.trim();
    }
    
    public Integer getIftrust(){
    	return iftrust;
    }
    public void setIftrust(Integer iftrust){
    	this.iftrust = iftrust;
    }
    
    public Integer getIfonly(){
    	return ifonly;
    }
    public void setIfonly(Integer ifonly){
    	this.ifonly = ifonly;
    }
    
    public String getJsfile(){
    	return jsfile;
    }
    public void setJsfile(String jsfile){
    	this.jsfile = jsfile == null? null:jsfile.trim();
    }
	
}