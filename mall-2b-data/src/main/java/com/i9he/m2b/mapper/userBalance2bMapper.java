package com.i9he.m2b.mapper;

import java.math.BigDecimal;
import java.util.List;

import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.model.search.UserbalanceSearchModel;

public interface userBalance2bMapper {
   
    int insert(userBalance record);

    int insertSelective(userBalance record);

    userBalance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(userBalance record);

    int updateByPrimaryKey(userBalance record);
    
    public List<userBalance> getallbyuser(Integer id);
    
    int getUserbalanceId(Integer userId);
    
    public List<userBalance> getUserbalance(UserbalanceSearchModel model);
    
    public int getUserbalanceCount(UserbalanceSearchModel model);
    
    public List<userBalance> getAfterlog(Integer userId);
    
    public List<userBalance> getBeforelog(Integer userId);
    
    int GetMaxID(Integer userId);
    
}