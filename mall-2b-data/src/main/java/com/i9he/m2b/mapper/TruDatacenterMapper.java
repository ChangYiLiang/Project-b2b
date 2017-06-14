package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.TruDatacenter;

public interface TruDatacenterMapper {
    
    int insert(TruDatacenter record);

    int insertSelective(TruDatacenter record);

    TruDatacenter selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TruDatacenter record);

    int updateByPrimaryKey(TruDatacenter record);
    
    List<TruDatacenter> getjointru();
    
    List<TruDatacenter> gettrucity(Integer id);
    
}