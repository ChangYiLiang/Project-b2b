package com.i9he.m2b.mapper;


import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.search.GsSearchModel;

public interface SyUserMapper {
    /**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_sy_user
	 * @mbggenerated
	 */
	int insert(SyUser record);

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_sy_user
	 * @mbggenerated
	 */
	int insertSelective(SyUser record);

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_sy_user
	 * @mbggenerated
	 */
	SyUser selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_sy_user
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(SyUser record);

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_sy_user
	 * @mbggenerated
	 */
	int updateByPrimaryKey(SyUser record);

	SyUser findByUserId(Integer userId);
	
	List<SyUser> getAll(GsSearchModel asm,RowBounds rs);
	
	int  getCount(GsSearchModel asm);
	
	
}