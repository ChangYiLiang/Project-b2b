package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.Area;

public interface AreaMapper {

	int insert(Area record);

	int insertSelective(Area record);

	Area selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Area record);

	int updateByPrimaryKey(Area record);
	
	List<Area> getallArea();
	
}