package com.i9he.m2b.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.search.ItemSearchModel;

public interface Item2bMapper {
   
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);
    
    /**
     * 根据订单ID 获取对应的配件
     * @param orderId
     * @return
     */
    public List<Item> getItemListByOrderId(@Param("orderId")Integer orderId);
    /**
     * 根据商品ID 获取对应的配件
     * @param orderId
     * @return
     */
    public List<Item> getItemListBygoodId(@Param("goodId")Integer goodId);
    
    
    /**
     * 获取所有当前配件
     * @return
     * */
    public List<Item> getallitem();
    
    
    /**
     * 获取所有当前配件
     * @return
     * */
    public List<Item> getitemType(Integer id);
    
    /**
     * 获取某个配件名字的参数
     * @return
     * */
    public Item getitemName(String Name);
    
    /**
     * 联表查询配件列表
     * @return
     * */
    public List<Item> getjoinitem(@Param("goodsId")Integer goodsId,@Param("itemType")Integer itemType);
    
    /**
     * 联表查询配件列表绑定信息
     * @return
     * */
    public List<Item> getjoinitem2(@Param("goodsId")Integer goodsId,@Param("itemType")Integer itemType);
    
    public List<Item> getItem(ItemSearchModel model);
    public int getItemCount(ItemSearchModel model);
    
    public List<Item> getDesclog(Integer num);
    
}