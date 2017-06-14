package com.i9he.m2b.model.search;

import java.util.List;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

public class GoodsGallerySearchModel implements Serializable {

	private static final long serialVersionUID = 4364605604626846449L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;

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
	
	private Integer id;
    private Integer goodsId;
    private String imgurl;
    private Integer sort;
    private String goodsName;
    
    public String getGoodsName(){
    	return goodsName;
    }
    public void setGoodsName(String goodsName){
    	this.goodsName = goodsName==null ? null :goodsName.trim();
    }
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getGoodsId() {
    	return goodsId;
    }
    public void setGoodsId(Integer goodsId) {
    	this.goodsId = goodsId;
    }
    
    public String getImgurl(){
    	return imgurl;
    }
    public void setImgurl(String imgurl){
    	this.imgurl = imgurl==null ? null :imgurl.trim();
    }
    
    public Integer getSort(){
    	return sort;
    }
    public void setSort(Integer sort){
    	this.sort = sort;
    }
	
	
}