package com.i9he.m2b.biz;

import java.math.BigDecimal;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.GoodsDetail;

public interface IGoodsDetailService {
	
	/**
	 * 根据订购周期和配件ID获取订购价格
	 * @param orderCycle
	 * @param ItemId
	 * @return
	 * @throws I9heException
	 */
	public BigDecimal getAmountByItemIdandOrder(Integer orderCycle ,Integer ItemId,Integer goodsId)throws I9heException;
	
	
	/**
	 * 根据订购周期和商品ID获取订购价格
	 * @param orderCycle
	 * @param ItemId
	 * @return
	 * @throws I9heException
	 */
	public BigDecimal getAmountByGoodsId(Integer orderCycle,Integer goodsId)throws I9heException;
	
	/**
	 * 根据配件id 获取所有配件总价
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public double getAllItemAmount(String id,Integer oc,Integer goodsId)throws I9heException;
	
	/**
	 * 根据配件id 获取所有配件价格信息
	 * @param goodsId
	 * @return
	 * @throws I9heException
	 */
	
	public GoodsDetail selectByPrimaryKey(Integer goodsId)throws I9heException;
	
	/**
	 * 根据配件id 修改配件价格信息
	 * @param goodsId
	 * @return 
	 * @throws I9heException
	 */
	
	public int updateByPrimaryKeySelective(GoodsDetail record)throws I9heException;
	
	
	/**
	 * 插入配件价格信息
	 * @param goodsId
	 * @return 
	 * @throws I9heException
	 */
	
	public int insert(GoodsDetail record)throws I9heException;
	
	
	/**
	 * 查询价格信息
	 * @param goodsId itemID
	 * @return 
	 * @throws I9heException
	 */
	
	GoodsDetail selectPrice(Integer goodsId,Integer itemId)throws I9heException;
	
	/**
	 * 修改价格信息
	 * @param goodsId itemID
	 * @return 
	 * @throws I9heException
	 */
	
	public int updatePrice(GoodsDetail record)throws I9heException;

	
}
