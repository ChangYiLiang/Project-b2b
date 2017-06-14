package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.Website;

public interface IWebsiteService {
	
	public List<Website> getWebsites();
	
	public Website getWebsite(Integer id);
	
	public void addWebsite(Website website);
	
	public void updateWebsite(Website website);
}
