package com.i9he.m2b.model.search;

import java.util.List;

public class InvoiceSearchModel extends AbstractSearchModel {
	
	private static final long serialVersionUID = 1L;

	private Integer userId;
	
	private Integer orderId;
	
	private String keyword;
	
	private List<Integer> userList;
	
	private Byte type;
	
	private Integer state;
	
	
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<Integer> getUserList() {
		return userList;
	}

	public void setUserList(List<Integer> userList) {
		this.userList = userList;
	}

	public String getKeyword() {
		return trim(this.keyword);
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
