package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.GoodsItem;

public interface IGoodsItem {

	/**
	 * 插入商品
	 * 
	 * @return
	 */
	int insert(GoodsItem record);

	/**
	 * 查询配件
	 * 
	 * @return
	 */
	public List<GoodsItem> selectItemKey(Integer goodsId);

}
