package com.i9he.m2b.manage.model;

import com.i9he.m2b.manage.utils.PageModel;

public class TemplatePageModel extends PageModel{
	private Integer type;
	
	private String url;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
