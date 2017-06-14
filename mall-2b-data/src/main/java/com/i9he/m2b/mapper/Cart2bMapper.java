package com.i9he.m2b.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Cart;


public interface Cart2bMapper {
    /**
     */
    int deleteByPrimaryKey(Integer id);

    /**
     */
    int insert(Cart record);

    /**
     */
    int insertSelective(Cart record);

    /**
     */
    Cart selectByPrimaryKey(Integer id);

    /**
     */
    int updateByPrimaryKeySelective(Cart record);

    /**
     */
    int updateByPrimaryKey(Cart record);
    /**
     * 根据用户ID获取该用户ID下所有购物车
     * @param userId
     * @return
     */
    public List<Cart> selectCartByUserId(@Param("userId")Integer userId);
    /**
     * 根据用户ID获取该用户ID下购物车可用数量
     * @param userId
     * @return
     */
    public Integer getCartCount(@Param("userId")Integer userId);
    
    /**
     * 获取购物车的总价
     * @param userId
     * @return
     */
    public BigDecimal getAllPrice(@Param("userId")Integer userId);
    
    /**
     * 获取该订单下的Cart
     * @param orderId
     * @return
     */
    public List<Cart> selectListCartByOrderId(@Param("orderId")Integer orderId);
    
    /**
     * 获取该用户下的Cartlist
     * @param userId
     * @return
     */
    public List<Cart> ListCartByUserId(@Param("userId")Integer userId);
    
    public BigDecimal getAllPrice1(@Param("userId")Integer userId);
    
    int updateSubmit(Integer userId); 
}