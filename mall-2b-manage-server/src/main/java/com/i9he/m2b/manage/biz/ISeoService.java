package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.Seo;
import com.i9he.m2b.model.SeoParams;

public interface ISeoService {
	
	public Integer addSeo(Seo seo);
	
	public Integer delSeo(Integer id);
	
	public Integer updateSeo(Seo seo);
	
	public List<Seo> getSeoList();
	
	public Seo getSeo(Integer id);
	
	public Integer addSeoParams(SeoParams params);
	
	public Integer delSeoParams(Integer id);
	
	public Integer updateSeoParams(SeoParams params);
	
	public List<SeoParams> getSeoParamsList(Integer seoId);
	
}
