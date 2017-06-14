package com.i9he.m2b.model.search;

public class ExpressfeeTemplateSearchModel extends AbstractSearchModel{

	private static final long serialVersionUID = 1L;
	
	private Integer expressType;
	
	private String  expressName;
	
	private String keyword;
	

	public String getExpressName() {
		return expressName;
	}

	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}

	public String getKeyword() {
		return trim(keyword);
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getExpressType() {
		return expressType;
	}

	public void setExpressType(Integer expressType) {
		this.expressType = expressType;
	}
}
