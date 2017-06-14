package com.i9he.m2b.model;

import java.io.Serializable;

public class InterestedModel implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String dataStr;
	
	private Integer interestedNumber;

	public String getDataStr() {
		return dataStr;
	}

	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}

	public Integer getInterestedNumber() {
		return interestedNumber;
	}

	public void setInterestedNumber(Integer interestedNumber) {
		this.interestedNumber = interestedNumber;
	}

	
	
	

}
