package com.i9he.m2b.model.search;

import java.util.List;

public class InvoiceQualifedSearchModel extends AbstractSearchModel {
	
	private static final long serialVersionUID = 1L;

	private Integer userId;
	
	private List<Integer> userList;
	
	private Byte reviewResult;
	
	private Byte isReview;
	
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

	public Byte getReviewResult() {
		return reviewResult;
	}

	public void setReviewResult(Byte reviewResult) {
		this.reviewResult = reviewResult;
	}

	public Byte getIsReview() {
		return isReview;
	}

	public void setIsReview(Byte isReview) {
		this.isReview = isReview;
	}

	
}
