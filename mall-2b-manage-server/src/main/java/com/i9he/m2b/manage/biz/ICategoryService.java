package com.i9he.m2b.manage.biz;


import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Category;

public interface ICategoryService {
	
	
//	public List<Integer> getCategoryIdByParentId(Integer parentId);
	/**
	 * 根据ID获取商品分类
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Category getById(Integer id) throws I9heException;
	
	/**
	 * 获取全部分类
	 * */
	public List<Category> getallcategory();
	
	/**
	 * 录入分类
	 * */
	public int insertSelective(Category record);
	
	/**
	 * 查看某个分类
	 * */
	public Category selectByPrimaryKey(Integer id);
	
	/**
	 * 获取最大值
	 * */
	public int getmax();
	
	/**
	 * 修改分类
	 * */
	public int updateByPrimaryKeySelective(Category record);
	
	public List<Category> getmaxcat();
	
	public List<Category> getsecondcat(Integer id);
}
