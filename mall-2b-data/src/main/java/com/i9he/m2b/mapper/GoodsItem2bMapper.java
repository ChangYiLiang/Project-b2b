package com.i9he.m2b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.GoodsItem;


public interface GoodsItem2bMapper {
   
    int deleteByPrimaryKey(Integer goodsId);

    int insert(GoodsItem record);
    
    int insertSelective(GoodsItem record);

    GoodsItem selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(GoodsItem record);

    int updateByPrimaryKey(GoodsItem record);
    
    /**
     * 根据goodsId 获取对应的配件ID
     * @return
     * */
    public List<GoodsItem> selectItemKey(Integer goodsId);
    
    /**
     * 根据goodsId 获取对应的配件ID不加条件过滤
     * @return
     * */
    public List<GoodsItem> selectItemKey2(Integer goodsId);
    
    /**
     * 根据商品ID配件ID判断是否绑定
     * @return
     * */
    GoodsItem CheckItemBind(@Param("goodsId")Integer goodsId,@Param("itemId")Integer itemId);
    
    /**
     * 绑定与解除配件
     * @return
     * */
    int updatebind(@Param("goodsId")Integer goodsId,@Param("itemId")Integer itemId,@Param("isShow")Integer isShow);
    
    int updatesort(@Param("goodsId")Integer goodsId,@Param("itemId")Integer itemId,@Param("sort")Integer sort);
    
    /**
     * 批量绑定
     * @return
     * */
    int insertlist(List<GoodsItem> goodsitem);
}