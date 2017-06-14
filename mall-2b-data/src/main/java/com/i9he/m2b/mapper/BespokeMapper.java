package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.Bespoke;

public interface BespokeMapper {

    int insertSelective(Bespoke record);
    
    List<Bespoke> getalllog();
    
    Bespoke selectByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(Bespoke record);
    
    List<Bespoke> getlogbyuser(Integer userid);

}