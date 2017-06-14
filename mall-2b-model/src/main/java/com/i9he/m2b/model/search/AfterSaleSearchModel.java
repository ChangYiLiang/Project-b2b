package com.i9he.m2b.model.search;

import java.util.List;

public class AfterSaleSearchModel extends AbstractSearchModel {

	private static final long serialVersionUID = 1L;
	
	private Byte state;
	
	private Byte type;
	
	private String keyword;
	
	private List<Byte> stateList;
	
	private List<Integer> userList;

	public String getKeyword() {
		return trim(keyword);
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

	public List<Byte> getStateList() {
		return stateList;
	}

	public void setStateList(List<Byte> stateList) {
		this.stateList = stateList;
	}

	public List<Integer> getUserList() {
		return userList;
	}

	public void setUserList(List<Integer> userList) {
		this.userList = userList;
	}
	
}
