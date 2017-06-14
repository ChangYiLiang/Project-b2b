package com.i9he.m2b.mapper;

import com.i9he.m2b.model.Shipping;



public interface Shipping2bMapper {
    /**
     */
    int deleteByPrimaryKey(Integer id);

    /**
     */
    int insert(Shipping record);

    /**
     */
    int insertSelective(Shipping record);

    /**
     */
    Shipping selectByPrimaryKey(Integer id);

    /**
     */
    int updateByPrimaryKeySelective(Shipping record);

    /**
     */
    int updateByPrimaryKey(Shipping record);
    
    /**
     */
    Shipping selectShippingByOrderId(Integer orderId);
}