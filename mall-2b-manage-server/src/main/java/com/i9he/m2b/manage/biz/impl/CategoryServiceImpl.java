package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.ICategoryService;
import com.i9he.m2b.mapper.Category2bMapper;
import com.i9he.m2b.model.Category;


@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService{
	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private Category2bMapper categoryMapper;
	
	@Override
	public Category getById(Integer id) throws I9heException {
		Category categoty;
		try {
			categoty = categoryMapper.selectByPrimaryKey(id);
			return categoty;
		} catch (Exception e) {
			logger.error("商品类别查询错误");
			throw new I9heException("商品类别查询错误", e);
		}
	}
	
	@Override
	public List<Category> getallcategory(){
		List<Category> categoty = categoryMapper.getallcategory();
		return categoty;
	}
	
	@Override
	public int insertSelective(Category record){
		int categoty = categoryMapper.insertSelective(record);
		return categoty;
	}
	
	@Override
	public Category selectByPrimaryKey(Integer id){
		Category cat = categoryMapper.selectByPrimaryKey(id);
		return cat;
	}
	
	@Override
	public int getmax(){
		int cat = categoryMapper.getmax();
		return cat;
	}
	
	@Override
	public int updateByPrimaryKeySelective(Category record){
		int cat = categoryMapper.updateByPrimaryKeySelective(record);
		return cat;
	}
	
	@Override
	public List<Category> getmaxcat(){
		List cat = categoryMapper.getmaxcat();
		return cat;
	}
	
	@Override
	public List<Category> getsecondcat(Integer id){
		List cat = categoryMapper.getsecondcat(id);
		return cat;
	}
	
}
