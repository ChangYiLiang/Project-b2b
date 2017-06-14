package com.i9he.m2b.server.biz.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.mapper.WebsiteMapper;
import com.i9he.m2b.model.Website;
import com.i9he.m2b.model.WebsiteExample;
import com.i9he.m2b.server.biz.IWebsiteService;

@Service
public class WebsiteServiceImpl implements IWebsiteService {

	@Autowired
	private WebsiteMapper websiteMapper;

	@Override
	public String getWeisteContent(String areaCode) {
		WebsiteExample example = new WebsiteExample();
		example.createCriteria().andAreaCodeEqualTo(areaCode);
		List<Website> websites = websiteMapper.selectByExampleWithBLOBs(example);
		String content = null;
		if (websites.size() > 0) {
			content = websites.get(0).getContent();
		}
		return StringUtils.defaultString(content);
	}

}
