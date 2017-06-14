package com.i9he.m2b.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.ISeoService;
import com.i9he.m2b.mapper.SeoMapper;
import com.i9he.m2b.model.Seo;

@Service
public class SeoServiceImpl implements ISeoService {

	@Autowired
	private SeoMapper seoMapper;
	
	@Override
	public Seo getSeo(String url) {
		return seoMapper.selectByUrl(url);
	}

}
