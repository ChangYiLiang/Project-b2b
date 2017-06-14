package com.i9he.m2b.mapper;

import java.math.BigDecimal;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.GoodsDetail;


public interface GoodsDetail2bMapper {
    /**
     */
    int deleteByPrimaryKey(Integer goodsId);

    /**
     */
    int insert(GoodsDetail record);

    /**
     */
    int insertSelective(GoodsDetail record);

    /**
     */
    GoodsDetail selectByPrimaryKey(Integer goodsId);

    /**
     */
    int updateByPrimaryKeySelective(GoodsDetail record);

    /**
     */
    int updateByPrimaryKey(GoodsDetail record);
    
    /**
     * 根据订单周期和配件Id 获取订购价格 （IDC专用）
     * @param oc
     * @param itId
     * @return
     */
    public BigDecimal getpriceByItemId(@Param("orderCycle")Integer oc,@Param("itemId")Integer itId,@Param("goodsId")Integer goodsid);
    
    /**
     * 根据订单周期和商品Id 获取价格（IDC专用）
     * @param oc
     * @param itId
     * @return
     */
    public BigDecimal getpriceByGoodsId(@Param("orderCycle")Integer oc,@Param("goodsId")Integer itId);
    
    
    /**
     * 根据订单产品ID和配件Id 获取价格（IDC专用）
     * @param oc
     * @param itId
     * @return
     */
    GoodsDetail selectPrice(@Param("goodsId")Integer goodsId,@Param("itemId")Integer itemId);
    
    /**
     * 根据订单产品ID和配件Id 修改价格（IDC专用）
     * @param oc
     * @param itId
     * @return
     */
    public int updatePrice(GoodsDetail record);
    
}