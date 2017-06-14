package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsAllRank;
import com.i9he.m2b.model.GoodsRank;
import com.i9he.m2b.model.GoodsSellViewModel;
import com.i9he.m2b.model.OrderSalesVolume;
import com.i9he.m2b.model.search.GoodsSearchModel;

public interface Goods2bMapper {
 
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    int updateByPrimaryKey(Goods record);
    
    public List<Goods> getAllGoods();
    
    public Goods deleteGoods(Goods record);
    
    public List<Goods> getGoodsByCategoryId(Integer id);
    
    /**
     * 获取某个售卖类型的商品
     * @return
     */
    public List<Goods> getGoodsByType(Integer id);
    
    public List<Goods> getGoods(GoodsSearchModel model);
    
    public int getGoodsCount(GoodsSearchModel model);
    
    public List<Integer> selectGoodsIdByKeyword(GoodsSearchModel model);
    
    public int getmax();
    
    public List<Goods> getOnlyGoods();
    
    public List<GoodsRank> getGoodsRankByM();
    
    public List<GoodsRank> getGoodsRankByQ();
    
    public List<GoodsRank> getGoodsRankByY(); 
    
    public List<GoodsSellViewModel> getListGoodsSell();
    
    public List<GoodsAllRank> getGoodsAllRank();
    
    public  List<OrderSalesVolume> getOrderSalesVolume();
    
    public List<Goods> getIdcGoods();
    
}