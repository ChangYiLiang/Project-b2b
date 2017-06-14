package com.i9he.m2b.mapper;

import java.util.List;
import com.i9he.m2b.model.FestLog;

public interface FestLogMapper {
	
    int insertSelective(FestLog record);
    
    List<FestLog> getFestLogList(Integer userId);
    
    List<FestLog> getFestLogAdd(Integer userId);
    
    List<FestLog> getFestLogCut(Integer userId);
  
}