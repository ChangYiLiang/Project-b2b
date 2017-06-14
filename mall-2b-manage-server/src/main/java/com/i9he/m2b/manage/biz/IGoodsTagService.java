package com.i9he.m2b.manage.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Goodstag;



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
public interface IGoodsTagService {
	
	/**
	 * 获取所有的配件类型
	 * @return
	 * @throws I9heException
	 */
	public List<Goodstag> getallitemtype()throws I9heException;
	
	/**
	 * 插入配件分类
	 * @return
	 * @throws I9heException
	 */
	public int insert(Goodstag record)throws I9heException;
	
	/**
	 * 插入配件分类2
	 * @return
	 * @throws I9heException
	 */
	public int insertSelective(Goodstag record)throws I9heException;
	
	public int updateByPrimaryKeySelective(Goodstag record)throws I9heException;
	
	public List<Goodstag> getalltagtype(Integer id)throws I9heException;
	
	public int updateshow(Integer id,Integer isShow)throws I9heException;
	
	public Goodstag selectByPrimaryKey2(Integer id)throws I9heException;
	
	public List<Goodstag> getIdtag(Integer id)throws I9heException;
	
}