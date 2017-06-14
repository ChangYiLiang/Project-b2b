package com.i9he.m2b.model.search;

import java.util.Collection;

public class TagMappingSearchModel extends AbstractSearchModel {

	private static final long serialVersionUID = 1L;
	
	private String keyword;
	
	private Byte type;
	
	private Integer tagId;
	
	private Collection<String> targetList;

	public String getKeyword() {
		return keyword;
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

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public Collection<String> getTargetList() {
		return targetList;
	}

	public void setTargetList(Collection<String> targetList) {
		this.targetList = targetList;
	}

}
