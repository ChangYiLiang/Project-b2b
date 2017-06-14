package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.GoodsItem;


public interface IGoodsItemService {
	
	/**
	 * 插入商品
	 * @return
	 */
	int insert(GoodsItem record);
	
	/**
	 * 查询商品
	 * @return
	 */
	GoodsItem selectByPrimaryKey(Integer goodsId);

	/**
	 * 查询商品
	 * @return
	 */
	List<GoodsItem> selectItemKey(Integer goodsId);
	
	/**
	 * 查询商品不加过滤条件
	 * @return
	 */
	List<GoodsItem> selectItemKey2(Integer goodsId);

	/**
	 * 检查配件绑定情况
	 * @return
	 * */
	GoodsItem CheckItemBind(Integer goodsId, Integer itemId);
	
	
	int updateByPrimaryKeySelective(GoodsItem record);
	
	/**
	 * 解除与绑定配件
	 * @return
	 * */
	int updatebind(Integer goodsId,Integer itemId,Integer isShow); 
	
	int updatesort(Integer goodsId,Integer itemId,Integer sort);
}
