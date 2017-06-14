package com.i9he.m2b.model.search;

import java.util.List;

public class PurchaseRequirementSearchModel extends AbstractSearchModel {

	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	
	private List<Integer> userList;
	
	private Byte state;
	
	private Byte type;
	
	private String keyword;

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

	public Byte getState() {
		return state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

}
