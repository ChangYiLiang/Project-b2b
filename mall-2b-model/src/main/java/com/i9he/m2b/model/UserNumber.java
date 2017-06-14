package com.i9he.m2b.model;

import java.io.Serializable;

public class UserNumber implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String createDateStr;
    
    private Integer userCount;
    
    private Integer userSum;

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public Integer getUserCount() {
		return userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public Integer getUserSum() {
		return userSum;
	}

	public void setUserSum(Integer userSum) {
		this.userSum = userSum;
	}
    
    
    
    
}
