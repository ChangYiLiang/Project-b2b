package com.i9he.m2b.model;

import java.io.Serializable;


public class GoodsGallery implements Serializable {
    
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
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GoodsGallery [id=");
		builder.append(id);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", imgurl=");
		builder.append(imgurl);
		builder.append(", sort=");
		builder.append(sort);
		builder.append("]");
		return builder.toString();
	}
     
}