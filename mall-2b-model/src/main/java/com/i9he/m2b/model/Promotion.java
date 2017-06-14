package com.i9he.m2b.model;

import java.io.Serializable;


public class Promotion implements Serializable {
    
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
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Promotion [id=");
		builder.append(id);
		builder.append(", categoryId=");
		builder.append(categoryId);
		builder.append(", promotionUrl=");
		builder.append(promotionUrl);
		builder.append(", title=");
		builder.append(title);
		builder.append("]");
		return builder.toString();
	}
    
	
}