package com.i9he.m2b.model.search;

import java.util.List;

public class TagSearchModel extends AbstractSearchModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String keyword;

	private Byte type;
	
	private Integer categoryId;

	private List<Integer> userList;

	public String getKeyword() {
		return trim(keyword);
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public List<Integer> getUserList() {
		return userList;
	}

	public void setUserList(List<Integer> userList) {
		this.userList = userList;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
}
