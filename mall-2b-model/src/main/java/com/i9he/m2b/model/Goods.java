package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品ID
 */
public class Goods implements Serializable{
	private static final long serialVersionUID = 4041030617870550816L;

	/**
     * 商品id
     */
    private Integer id;

    /**
     * 品牌id
     */
    private Integer brandId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 主标题
     */
    private String mainTitle;

    /**
     * 副标题
     */
    private String secondTitle;

    /**
     * 商品价格
     */
    private BigDecimal goodsPrice;

    /**
     * 分类ID
     */
    private Integer categoryId;

    /**
     * 1-上架 0-下架
     */
    private Integer isBuy;

    /**
     * 上架时间
     */
    private Date upDate;

    /**
     * 下架时间
     */
    private Date offDate;

    /**
     * 用于统计
     */
    private Integer clickCount;

    /**
     * 0-否 1-是
     */
    private Boolean ifIdc;

    /**
     * 当前系统时间
     */
    private Integer addDate;

    /**
     * 安装费
     */
    private BigDecimal setupFee;

    /**
     * 商品描述
     */
    private String goodsDesc;
    
    private String goodsImg;
    private Integer goodsType;
    private String goodsTest;
    private Integer sort;
    private Integer iftrust;
    private Integer ifonly;
    private String jsfile;
    private Integer isBindExpressfee;
    
//    private Byte itemType;
//    private String itemname;
//    private BigDecimal itemprice;
//    
//    public Byte getItemType(){
//    	return itemType;
//    }
//    public void setItemType(Byte itemType){
//    	this.itemType = itemType;
//    }
//    public String getItemname() {
//        return itemname;
//    }
//    public void setItemname(String itemname) {
//        this.itemname = itemname == null ? null : itemname.trim();
//    }
//    public BigDecimal getItemprice(){
//    	return itemprice;
//    }
//    public void setItemprice(BigDecimal itemprice){
//    	this.itemprice = itemprice;
//    }
    
    
    public Integer getSort(){
    	return sort;
    }
    public Integer getIsBindExpressfee() {
		return isBindExpressfee;
	}
	public void setIsBindExpressfee(Integer isBindExpressfee) {
		this.isBindExpressfee = isBindExpressfee;
	}
	public void setSort(Integer sort){
    	this.sort = sort;
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
    public String getGoodsName() {
        return goodsName;
    }

    /**
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    /**
     */
    public String getMainTitle() {
        return mainTitle;
    }

    /**
     */
    public void setMainTitle(String mainTitle) {
        this.mainTitle = mainTitle == null ? null : mainTitle.trim();
    }

    /**
     */
    public String getSecondTitle() {
        return secondTitle;
    }

    /**
     */
    public void setSecondTitle(String secondTitle) {
        this.secondTitle = secondTitle == null ? null : secondTitle.trim();
    }

    /**
     */
    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    /**
     */
    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
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
    public Integer getIsBuy() {
        return isBuy;
    }

    /**
     */
    public void setIsBuy(Integer isBuy) {
        this.isBuy = isBuy;
    }

    /**
     */
    public Date getUpDate() {
        return upDate;
    }

    /**
     */
    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

    /**
     */
    public Date getOffDate() {
        return offDate;
    }

    /**
     */
    public void setOffDate(Date offDate) {
        this.offDate = offDate;
    }

    /**
     */
    public Integer getClickCount() {
        return clickCount;
    }

    /**
     */
    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    /**
     */
    public Boolean getIfIdc() {
        return ifIdc;
    }

    /**
     */
    public void setIfIdc(Boolean ifIdc) {
        this.ifIdc = ifIdc;
    }

    /**
     */
    public Integer getAddDate() {
        return addDate;
    }

    /**
     */
    public void setAddDate(Integer addDate) {
        this.addDate = addDate;
    }

    /**
     */
    public BigDecimal getSetupFee() {
        return setupFee;
    }

    /**
     */
    public void setSetupFee(BigDecimal setupFee) {
        this.setupFee = setupFee;
    }

    /**
     */
    public String getGoodsDesc() {
        return goodsDesc;
    }

    /**
     */
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Goods [id=");
		builder.append(id);
		builder.append(", brandId=");
		builder.append(brandId);
		builder.append(", goodsName=");
		builder.append(goodsName);
		builder.append(", mainTitle=");
		builder.append(mainTitle);
		builder.append(", secondTitle=");
		builder.append(secondTitle);
		builder.append(", goodsPrice=");
		builder.append(goodsPrice);
		builder.append(", categoryId=");
		builder.append(categoryId);
		builder.append(", isBuy=");
		builder.append(isBuy);
		builder.append(", upDate=");
		builder.append(upDate);
		builder.append(", offDate=");
		builder.append(offDate);
		builder.append(", clickCount=");
		builder.append(clickCount);
		builder.append(", ifIdc=");
		builder.append(ifIdc);
		builder.append(", addDate=");
		builder.append(addDate);
		builder.append(", setupFee=");
		builder.append(setupFee);
		builder.append(", goodsDesc=");
		builder.append(goodsDesc);
		builder.append(", goodsImg=");
		builder.append(goodsImg);
		builder.append(", goodsType=");
		builder.append(goodsType);
		builder.append(", goodsTest=");
		builder.append(goodsTest);
		builder.append("]");
		return builder.toString();
	}

    
}