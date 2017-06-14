package com.i9he.m2b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.UserBonus;

public interface UserBonusMapper {

    int insertSelective(UserBonus record);
    UserBonus selectByPrimaryKey(Short typeId);
    int updateByPrimaryKeySelective(UserBonus record);
    public List<UserBonus> getallbouns();
    
    /**
     * 获取用户领取某个券的数量
     * */
    int getsum(@Param("userId")Integer userId,@Param("bonusId")Integer bonusId);
    
}