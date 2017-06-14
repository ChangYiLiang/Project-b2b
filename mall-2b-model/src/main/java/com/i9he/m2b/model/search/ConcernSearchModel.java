package com.i9he.m2b.model.search;

public class ConcernSearchModel extends AbstractSearchModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	
	private Byte status;
	
	private Byte remind;
	
	
	

	public Byte getRemind() {
		return remind;
	}

	public void setRemind(Byte remind) {
		this.remind = remind;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}
	
	
	

}
