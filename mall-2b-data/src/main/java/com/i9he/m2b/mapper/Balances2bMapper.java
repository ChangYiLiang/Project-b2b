package com.i9he.m2b.mapper;

import com.i9he.m2b.model.Balances;


public interface Balances2bMapper {
    /**
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     */
    int insert(Balances record);

    /**
     */
    int insertSelective(Balances record);

    /**
     */
    Balances selectByPrimaryKey(Integer userId);

    /**
     */
    int updateByPrimaryKeySelective(Balances record);

    /**
     */
    int updateByPrimaryKey(Balances record);
}