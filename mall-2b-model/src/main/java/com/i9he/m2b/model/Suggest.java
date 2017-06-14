package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Suggest implements Serializable{
   
	private static final long serialVersionUID = 4364605604626846449L;
    private Integer id;
    private Integer userId;
    private String content;
    private Integer type;
    private Integer issubmit;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public Integer getIssubmit() {
        return issubmit;
    }
    public void setIssubmit(Integer issubmit) {
        this.issubmit = issubmit;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Suggest [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", content=");
		builder.append(content);
		builder.append(", type=");
		builder.append(type);
		builder.append(", issubmit=");
		builder.append(issubmit);
		builder.append("]");
		return builder.toString();
	}

}