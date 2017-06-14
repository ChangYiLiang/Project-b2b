package com.i9he.m2b.manage.biz;



import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsAllRank;
import com.i9he.m2b.model.GoodsRank;
import com.i9he.m2b.model.GoodsSellViewModel;
import com.i9he.m2b.model.OrderSalesVolume;
import com.i9he.m2b.model.search.GoodsSearchModel;


public interface IGoodsService {
	/**
	 * 服务器租用
	 */
	public static final Integer SERVERZUYONG = 2;
	
//	/**
//	 * 根据用户ID获取商品
//	 * @param userId
//	 * @return
//	 * @throws I9heException
//	 */
//	public Goods getGoodsByid(Integer Id )throws I9heException;
	
	/**
	 * 根据类型获取对应商品
	 * @param id
	 * @return
	 */
	
	public List<Goods> getGoodsByParentId(Integer categoryId)throws I9heException;
	
	/**
	 * 获取所有商品
	 * @return
	 */
	
	public List<Goods> getAllGoods();
	
	/**
	 * 逻辑删除某个商品
	 * @return
	 */
	
	public Goods deleteGoods(Goods record);
	
	/**
	 * 插入商品
	 * @return
	 */
	
	int insert(Goods record);
	
	/**
	 * @return
	 * 查询某个商品
	 * */
	
	public Goods selectByPrimaryKey(Integer id);
	
	/**
	 * @return
	 * 更新某个商品
	 * */
	
	public int updateByPrimaryKey(Goods record);
	
	public int updateByPrimaryKeySelective(Goods record);
	
	public List<Goods> getGoodsByCategoryId(Integer id);
	
	public List<Goods> getGoodsByType(Integer id);
	
	/**
	 * @return
	 * 查询商品
	 * */
	public List<Goods> getGoods(GoodsSearchModel model) throws I9heException;
	
	/**
	 * 根据商品ID获取商品
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Goods getGoodsByid(Integer id)throws I9heException;
	
	
    public List<GoodsRank> getGoodsRankByM();
	
	public List<GoodsRank> getGoodsRankByQ();
	
	public List<GoodsRank> getGoodsRankByY();
	
	public List<GoodsSellViewModel> getListGoodsSell();
	
	public List<GoodsAllRank> getGoodsAllRank();
	
	public List<OrderSalesVolume> getOrderSalesVolume();

	/***
	 * 检测是否绑定运费模板
	 * @param goods
	 */
	public void checkIfBindExpressfee(List<Goods> goods);
}
