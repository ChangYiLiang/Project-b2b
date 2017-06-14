package com.i9he.m2b.biz;

import java.util.List;



import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ItemcategorySearchModel;


/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public interface IItemcategoryService {
	
	/**
	 * 获取所有的配件类型
	 * @return
	 * @throws I9heException
	 */
	public List<Itemcategory> getallitemtype()throws I9heException;
	
	/**
	 * 插入配件分类
	 * @return
	 * @throws I9heException
	 */
	public int insert(Itemcategory record)throws I9heException;
	
	/**
	 * 插入配件分类2
	 * @return
	 * @throws I9heException
	 */
	public int insertSelective(Itemcategory record)throws I9heException;
	
	public int updateByPrimaryKeySelective(Itemcategory record)throws I9heException;
	
	public Itemcategory selectByPrimaryKey(Integer id)throws I9heException;
	
	public Itemcategory selectByPrimaryKey2(Integer id)throws I9heException;
	
	public List<Itemcategory> getItemcategory2(ItemcategorySearchModel model)throws I9heException;
	
}
