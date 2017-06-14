package com.i9he.m2b.biz.impl;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IItemcategoryService;
import com.i9he.m2b.mapper.Itemcategory2bMapper;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ItemcategorySearchModel;
import com.i9he.m2b.util.MallErroCode;
import com.nr.comm.util.Calculations;

@Service("itemcategoryService")
public class ItemcategoryServiceImpl implements IItemcategoryService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private Itemcategory2bMapper itemcategoryMapper;
	
	@Override
	public List<Itemcategory> getallitemtype() throws I9heException {
		List<Itemcategory> itemcategory;
		try {
			itemcategory = itemcategoryMapper.getallitemtype();
			return itemcategory;
		} catch (Exception e) {
			logger.error("查询配件类型出现异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "查询配件类型出现异常", e);
		}
	}
	
	@Override
	public int insert(Itemcategory record)throws I9heException{
		int itemcategory;
		try {
			itemcategory = itemcategoryMapper.insert(record);
			return itemcategory;
		} catch (Exception e) {
			logger.error("插入配件分类异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "插入配件分类异常", e);
		}
	}
	
	@Override
	public int insertSelective(Itemcategory record)throws I9heException{
		int itemcategory;
		try {
			itemcategory = itemcategoryMapper.insertSelective(record);
			return itemcategory;
		} catch (Exception e) {
			logger.error("插入配件分类异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "插入配件分类异常", e);
		}
	}
	
	@Override
	public int updateByPrimaryKeySelective(Itemcategory record)throws I9heException{
		int itemcategory;
		try {
			itemcategory = itemcategoryMapper.updateByPrimaryKeySelective(record);
			return itemcategory;
		} catch (Exception e) {
			logger.error("修改配件分类异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "修改配件分类异常", e);
		}
	}
	
	@Override
	public Itemcategory selectByPrimaryKey(Integer id)throws I9heException{
		Itemcategory itemcategory;
		try {
			itemcategory = itemcategoryMapper.selectByPrimaryKey(id);
			return itemcategory;
		} catch (Exception e) {
			logger.error("查询配件分类异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "查询配件分类异常", e);
		}
	}
	
	@Override
	public Itemcategory selectByPrimaryKey2(Integer id)throws I9heException{
		Itemcategory itemcategory;
		try {
			itemcategory = itemcategoryMapper.selectByPrimaryKey2(id);
			return itemcategory;
		} catch (Exception e) {
			logger.error("查询配件分类异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "查询配件分类异常", e);
		}
	}
	
	@Override
	public List<Itemcategory> getItemcategory2(ItemcategorySearchModel model)throws I9heException{
		try{
			int count = itemcategoryMapper.getItemcategoryCount(model);
			List<Itemcategory> list = itemcategoryMapper.getItemcategory2(model);
			model.setTotal(count);
			return list;
		}catch(Exception e){
			logger.error("获取配件分类列表异常", e);
			throw new I9heException("获取配件分类列表异常", e);
		}
	}

}