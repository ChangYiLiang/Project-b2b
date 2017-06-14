package com.i9he.m2b.util;

public class PageModel {
	
	private Integer pageNo;
	
	private Integer PageCount;
	
	private Integer state;
	
	private Integer isComment;
	
	private String url; 
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getIsComment() {
		return isComment;
	}

	public void setIsComment(Integer isComment) {
		this.isComment = isComment;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageCount() {
		return PageCount;
	}

	public void setPageCount(Integer pageCount) {
		PageCount = pageCount;
	}
	
	
}
