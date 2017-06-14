package com.i9he.m2b.mapper;

import java.util.List;
import com.i9he.m2b.model.Suggest;

public interface SuggestMapper {
	
    int insertSelective(Suggest record);
    
    public List<Suggest> getalldata();
    
    int upsubmit(Integer id);
    
    Suggest selectByPrimaryKey(Integer id);
    
}