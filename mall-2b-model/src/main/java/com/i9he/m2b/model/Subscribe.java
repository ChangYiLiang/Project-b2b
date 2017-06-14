package com.i9he.m2b.model;

import java.io.Serializable;
import java.util.Date;

public class Subscribe implements Serializable {
	
    private Integer id;

    private Integer userId;
    
    private Integer tagId;

    private Date createdDate;
    
    private String tagName;

    private static final long serialVersionUID = 1L;

    
    public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

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

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}