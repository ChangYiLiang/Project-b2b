package com.i9he.m2b.manage.biz.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IExpressfeeService;
import com.i9he.m2b.manage.model.TemplatePageModel;
import com.i9he.m2b.mapper.ExpressAddressMapper;
import com.i9he.m2b.mapper.ExpressfeeGoodsMapper;
import com.i9he.m2b.mapper.ExpressfeeTemplateMapper;
import com.i9he.m2b.mapper.ExpressfeeTypeMapper;
import com.i9he.m2b.model.ExpressAddress;
import com.i9he.m2b.model.ExpressfeeGoods;
import com.i9he.m2b.model.ExpressfeeTemplate;
import com.i9he.m2b.model.ExpressfeeTemplateEX;
import com.i9he.m2b.model.ExpressfeeType;
import com.i9he.m2b.model.search.ExpressfeeTemplateSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Region;

@Service("expressfeeService")
public class ExpressfeeServiceImpl implements IExpressfeeService{
	
	private static final Logger logger = Logger.getLogger(ExpressfeeServiceImpl.class);
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private ExpressfeeTemplateMapper expressfeeTemplateMapper;
	@Autowired
	private ExpressAddressMapper expressAddressMapper;
	@Autowired
	private ExpressfeeTypeMapper expressfeeTypeMapper;
	@Autowired
	private ExpressfeeGoodsMapper expressfeeGoodsMapper;

	@Override
	public ExpressfeeTemplateEX formatTemplate(ExpressfeeTemplateEX template) throws I9heException {
		List<ExpressfeeType> expressfeeTypes = new ArrayList<ExpressfeeType>();
		for(int i=0;i<template.getFirstCount().size();i++){
			ExpressfeeType expressfeeType = new ExpressfeeType();
			expressfeeType.setFirstCount(template.getFirstCount().get(i));
			expressfeeType.setFirstFee(template.getFirstFee().get(i));
			expressfeeType.setAddCount(template.getAddCount().get(i));
			expressfeeType.setAddFee(template.getAddFee().get(i));
			ExpressAddress expressAddress = new ExpressAddress();
			expressAddress.setProvinceName(template.getProvinceName().get(i));
			expressfeeType.setExpressAddress(expressAddress);
			expressfeeTypes.add(expressfeeType);
		}
		template.setExpressfeeTypes(expressfeeTypes);
		//将发货地址的id转为名字
		Integer provinceId = Integer.parseInt(template.getSenderProvince());
		Integer cityId = Integer.parseInt(template.getSenderCity());
		Region Region1 = privilegeBaseApiService.selectRegionById(provinceId);
		template.setSenderProvince(Region1.getRegionName());
		Region Region2 = privilegeBaseApiService.selectRegionById(cityId);
		template.setSenderCity(Region2.getRegionName());
		return template;
	}

	@Override
	public int addTemplate(ExpressfeeTemplateEX newTemplate) throws I9heException {
		try{
			//保存运费模板信息
			ExpressfeeTemplate expressfeeTemplate = new ExpressfeeTemplate();
			expressfeeTemplate.setName(newTemplate.getName());
			expressfeeTemplate.setExpressName(newTemplate.getExpressName());
			expressfeeTemplate.setSenderProvince(newTemplate.getSenderProvince());
			expressfeeTemplate.setSenderCity(newTemplate.getSenderCity());
			expressfeeTemplate.setExpressType(newTemplate.getExpressType());
			expressfeeTemplate.setRemark(newTemplate.getRemark());
			expressfeeTemplate.setCreateTime(new Date());
			int res1 = expressfeeTemplateMapper.insertSelective(expressfeeTemplate);
			Integer expressfeeTemplateId = expressfeeTemplate.getId();
			//保存运费方式
			List<ExpressfeeType> expressfeeTypes = newTemplate.getExpressfeeTypes();
			int res2 = 0;
			int res3 = 0;
			for(ExpressfeeType exType:expressfeeTypes){
				ExpressfeeType expressfeeType = new ExpressfeeType();
				expressfeeType.setFirstCount(exType.getFirstCount());
				expressfeeType.setFirstFee(exType.getFirstFee());
				expressfeeType.setAddCount(exType.getAddCount());
				expressfeeType.setAddFee(exType.getAddFee());
				expressfeeType.setExpressfeeTemplateId(expressfeeTemplateId);
				res2 = expressfeeTypeMapper.insertSelective(expressfeeType);
				Integer expressfeeTypeId = expressfeeType.getId();
				//保存地址信息
				ExpressAddress expressAddress = new ExpressAddress();
				expressAddress.setProvinceName(exType.getExpressAddress().getProvinceName());
				expressAddress.setCityId(exType.getExpressAddress().getCityId());
				expressAddress.setExpressfeeTypeId(expressfeeTypeId);
				res3 = expressAddressMapper.insertSelective(expressAddress);
			}
			if(res1>0 && res2>0 && res3>0){
				return 1;
			}else{
				return 0;
			}
		}catch(Exception e){
			logger.error("添加运费模板异常");
			throw new I9heException("添加运费模板异常",e);
		}
	}

	@Override
	public List<ExpressfeeTemplateEX> getTemplateList(ExpressfeeTemplateSearchModel searchModel) {
		List<ExpressfeeTemplateEX> templates = expressfeeTemplateMapper.selectTemplateListBySearchModel(searchModel);
		for(ExpressfeeTemplateEX template:templates){
			List<ExpressfeeType>  expressfeeTypes = expressfeeTypeMapper.selectTypeListByTemplateId(template.getId());
			for(ExpressfeeType expressfeeType:expressfeeTypes){
				ExpressAddress expressAddress = expressAddressMapper.selectAddressListByTypeId(expressfeeType.getId());
				expressfeeType.setExpressAddress(expressAddress);
			}
			template.setExpressfeeTypes(expressfeeTypes);
		}
		return templates;
	}

	@Override
	public TemplatePageModel getPageModel(ExpressfeeTemplateSearchModel searchModel) {
		TemplatePageModel templatePageModel = new TemplatePageModel();
		int pageSize = searchModel.getPageSize();
		int counts =  expressfeeTemplateMapper.selectTemplateCountBySearchModel(searchModel);
		int count = counts/pageSize;
		if(counts%pageSize > 0){
			count =count+1; 
		}
		if(count == 0){
			count = 1;
		}
		templatePageModel.setPageCount(count);
		templatePageModel.setPageNo(searchModel.getPageNo());
		if(searchModel.getExpressType() != null){
			templatePageModel.setUrl("&expressType="+searchModel.getExpressType());
		}
		return templatePageModel;
	}

	@Override
	public ExpressfeeTemplateEX getTemplateById(Integer templateId) {
		ExpressfeeTemplateEX template = expressfeeTemplateMapper.selectTemplateById(templateId);
		List<ExpressfeeType>  expressfeeTypes = expressfeeTypeMapper.selectTypeListByTemplateId(template.getId());
		for(ExpressfeeType expressfeeType:expressfeeTypes ){
			ExpressAddress expressAddress = expressAddressMapper.selectAddressListByTypeId(expressfeeType.getId());
			expressfeeType.setExpressAddress(expressAddress);
		}
		template.setExpressfeeTypes(expressfeeTypes);
		return template;
	}

	@Override
	public int modifyTemplate(ExpressfeeTemplateEX newTemplate) {
		//保存运费模板信息
		ExpressfeeTemplate expressfeeTemplate = new ExpressfeeTemplate();
		expressfeeTemplate.setId(newTemplate.getId());
		expressfeeTemplate.setName(newTemplate.getName());
		expressfeeTemplate.setExpressName(newTemplate.getExpressName());
		expressfeeTemplate.setSenderProvince(newTemplate.getSenderProvince());
		expressfeeTemplate.setSenderCity(newTemplate.getSenderCity());
		expressfeeTemplate.setExpressType(newTemplate.getExpressType());
		expressfeeTemplate.setRemark(newTemplate.getRemark());
		expressfeeTemplate.setUpdateTime(new Date());
		int res1 = expressfeeTemplateMapper.updateByPrimaryKeySelective(expressfeeTemplate);
		//保存计费方式前先删除之前的计费方式，在插入新的计费方式
		this.deleteExpressfeeType(newTemplate.getId());
		List<ExpressfeeType> expressfeeTypes = newTemplate.getExpressfeeTypes();
		int res2 = 0;
		int res3 = 0;
		for(ExpressfeeType exType:expressfeeTypes){
			//保存运费方式
			ExpressfeeType expressfeeType = new ExpressfeeType();
			expressfeeType.setFirstCount(exType.getFirstCount());
			expressfeeType.setFirstFee(exType.getFirstFee());
			expressfeeType.setAddCount(exType.getAddCount());
			expressfeeType.setAddFee(exType.getAddFee());
			expressfeeType.setExpressfeeTemplateId(newTemplate.getId());
			res2 = expressfeeTypeMapper.insertSelective(expressfeeType);
			Integer expressfeeTypeId = expressfeeType.getId();
			//保存地址信息
			ExpressAddress expressAddress = new ExpressAddress();
			expressAddress.setProvinceName(exType.getExpressAddress().getProvinceName());
			expressAddress.setCityId(exType.getExpressAddress().getCityId());
			expressAddress.setExpressfeeTypeId(expressfeeTypeId);
			res3 = expressAddressMapper.insertSelective(expressAddress);
		}
		if(res1>0 && res2>0 && res3>0){
			return 1;
		}else{
			return 0;
		}
	}
	
	/***删除运费模板中的计费方式*/
	public void deleteExpressfeeType(Integer templateId){
		List<ExpressfeeType> expressfeeTypes =  expressfeeTypeMapper.selectTypeListByTemplateId(templateId);
		if(expressfeeTypes != null){
			for(ExpressfeeType expressfeeType:expressfeeTypes){
				expressfeeTypeMapper.deleteById(expressfeeType.getId());
			}
		}
	}

	@Override
	public int deleteTemplate(Integer templateId) {
		return expressfeeTemplateMapper.deleteById(templateId);
	}

	@Override
	public int disableTemplate(Integer templateId) {
		return expressfeeTemplateMapper.disableTemplate(templateId);
	}

	@Override
	public int enableTemplate(Integer templateId) {
		return expressfeeTemplateMapper.enableTemplate(templateId);
	}

	@Override
	public List<ExpressfeeTemplate> getTemplate(ExpressfeeTemplateSearchModel searchModel) {
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		int total = expressfeeTemplateMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		List<ExpressfeeTemplate> templates = expressfeeTemplateMapper.selectTemplateBySearchModel(searchModel,rowBounds);
		return templates;
	}

	@Override
	public List<String> getAllExpressName() {
		return expressfeeTemplateMapper.selectAllExpressName();
	}

	@Override
	public int bindExpressfee(Integer goodsId, Integer templateId) {
		int res = expressfeeGoodsMapper.selectExistByGoodsId(goodsId);
		//判断该商品是否已经绑定模板,如果绑定则先删除之前的绑定
		if(res != 0){
			expressfeeGoodsMapper.deleteByGoodsId(goodsId);
		}
		ExpressfeeGoods expressfeeGoods = new ExpressfeeGoods();
		expressfeeGoods.setGoodsId(goodsId);
		expressfeeGoods.setExpressfeeTemplateId(templateId);
		return expressfeeGoodsMapper.insertSelective(expressfeeGoods);
	}

	@Override
	public ExpressfeeTemplateEX getTemplateBygoodsId(Integer goodsId) {
		ExpressfeeGoods expressfeeGoods = expressfeeGoodsMapper.selectByGoodsId(goodsId);
		if(expressfeeGoods != null){
			ExpressfeeTemplateEX template = expressfeeTemplateMapper.selectTemplateById(expressfeeGoods.getExpressfeeTemplateId());
			List<ExpressfeeType>  expressfeeTypes = expressfeeTypeMapper.selectTypeListByTemplateId(template.getId());
			for(ExpressfeeType expressfeeType:expressfeeTypes ){
				ExpressAddress expressAddress = expressAddressMapper.selectAddressListByTypeId(expressfeeType.getId());
				expressfeeType.setExpressAddress(expressAddress);
			}
			template.setExpressfeeTypes(expressfeeTypes);
			return template;
		}
		return null;
	}

	@Override
	public int removeBind(Integer goodsId) {
		return expressfeeGoodsMapper.deleteByGoodsId(goodsId);
	} 
}
