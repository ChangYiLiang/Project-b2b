package com.i9he.m2b.model.search;

import java.util.List;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

public class PromotionSearchModel implements Serializable {

	private static final long serialVersionUID = 4364605604626846449L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;

	
	private String keyword;
    
    public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	} 
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
    private Integer categoryId;
    private String promotionUrl;
    private String title;
    private String name;
    
    public String getName(){
    	return name;
    }
    public void setName(String name){
    	this.name = name==null?null:name.trim();
    }
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getCategoryId() {
    	return categoryId;
    }
    public void setCategoryId(Integer categoryId) {
    	this.categoryId = categoryId;
    }
    
    public String getPromotionUrl(){
    	return promotionUrl;
    }
    public void setPromotionUrl(String promotionUrl){
    	this.promotionUrl = promotionUrl==null?null:promotionUrl.trim();
    }
    
    public String getTitle(){
    	return title;
    }
    public void setTitle(String title){
    	this.title = title==null?null:title.trim();
    }
	
}