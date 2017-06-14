package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.ISeoService;
import com.i9he.m2b.mapper.SeoMapper;
import com.i9he.m2b.mapper.SeoParamsMapper;
import com.i9he.m2b.model.Seo;
import com.i9he.m2b.model.SeoParams;

@Service
public class SeoServiceImpl implements ISeoService {
	
	@Autowired
	private SeoMapper seoMapper;
	
	@Autowired
	private SeoParamsMapper seoParamsMapper;

	@Override
	public Integer addSeo(Seo seo) {
		seo.setModifyTime(new Date());
		return seoMapper.insertSelective(seo);
	}

	@Override
	public Integer delSeo(Integer id) {
		return seoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer updateSeo(Seo seo) {
		seo.setModifyTime(new Date());
		return seoMapper.updateByPrimaryKey(seo);
	}

	@Override
	public List<Seo> getSeoList() {
		return seoMapper.selectAll();
	}

	@Override
	public Seo getSeo(Integer id) {
		return seoMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer addSeoParams(SeoParams params) {
		return seoParamsMapper.insertSelective(params);
	}

	@Override
	public Integer delSeoParams(Integer id) {
		return seoParamsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer updateSeoParams(SeoParams params) {
		return seoParamsMapper.updateByPrimaryKeySelective(params);
	}

	@Override
	public List<SeoParams> getSeoParamsList(Integer seoId) {
		return seoParamsMapper.selectBySeoId(seoId);
	}

}
