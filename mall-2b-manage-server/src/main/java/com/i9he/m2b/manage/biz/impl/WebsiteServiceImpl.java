package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.IWebsiteService;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.mapper.WebsiteMapper;
import com.i9he.m2b.model.Website;
import com.i9he.m2b.model.WebsiteExample;

@Service
public class WebsiteServiceImpl implements IWebsiteService {
	
	@Autowired
	private WebsiteMapper websiteMapper;

	@Override
	public List<Website> getWebsites() {
		return websiteMapper.selectMoreByExample(new WebsiteExample());
	}

	@Override
	public void addWebsite(Website website) {
		website.setCreateTime(new Date());
		website.setUpdateTime(new Date());
		website.setUpdateUserId(SessionUtil.getSessionUserId());
		websiteMapper.insertSelective(website);
	}

	@Override
	public void updateWebsite(Website website) {
		website.setUpdateTime(new Date());
		website.setUpdateUserId(SessionUtil.getSessionUserId());
		websiteMapper.updateByPrimaryKeySelective(website);
	}

	@Override
	public Website getWebsite(Integer id) {
		return websiteMapper.selectByPrimaryKey(id);
	}

}
