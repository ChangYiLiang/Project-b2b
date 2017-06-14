package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.Bonus;

public interface BonusMapper {

    int insertSelective(Bonus record);

    Bonus selectByPrimaryKey(Integer bonusId);

    int updateByPrimaryKeySelective(Bonus record);

    public List<Bonus> getallbouns();
    
    /**
     * 获取未使用的节操券
     * */
    public List<Bonus> getBonusOne(Integer userId);
    
    /**
     * 获取已使用的节操券
     * */
    public List<Bonus> getBonusTwo(Integer userId);
    
    /**
     * 获取过期的节操券
     * */
    public List<Bonus> getBonusThree(Integer userId);
    
    /**
     * 可以领取的节操券
     * */
    public List<Bonus> cangetbonus();
    
    /**
     * 领取券的同时更新已领取数
     * */
    public int upgetnum(Integer typeId);
    
    /**
     * 判断已领取数量是否和发送数量相等
     * */
    public Bonus checknum(Integer typeId);
    
}