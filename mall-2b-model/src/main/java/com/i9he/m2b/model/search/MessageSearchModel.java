package com.i9he.m2b.model.search;

import java.util.List;

public class MessageSearchModel extends AbstractSearchModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	
	private Byte isRead;
	
	private Byte isReceive;
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Byte getIsRead() {
		return isRead;
	}

	public void setIsRead(Byte isRead) {
		this.isRead = isRead;
	}

	public Byte getIsReceive() {
		return isReceive;
	}

	public void setIsReceive(Byte isReceive) {
		this.isReceive = isReceive;
	}

}
