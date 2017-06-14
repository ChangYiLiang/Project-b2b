package com.i9he.m2b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.BusinessTrusteeship;



public interface BusinessMapper {

	int deleteByPrimaryKey(Integer id);

	int updateByPrimaryKey(Business record);
	
	Business selectByPrimaryKey(Integer id);
	
	int GetMaxId(Integer userId);
	
	int insertSelective(Business record);
	
	int updateByPrimaryKeySelective(Business record);


}