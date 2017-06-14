package com.i9he.m2b.model.search;

public class AuthenticationSearchModel extends AbstractSearchModel{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Integer userId;
	
	public String name;
	
	public Byte status;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = "%"+name+"%";
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}
	
	
}
