package com.i9he.m2b.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ItemcategorySearchModel;


public interface Itemcategory2bMapper {
   
    int insert(Itemcategory record);

    int insertSelective(Itemcategory record);

    Itemcategory selectByPrimaryKey(Integer id);
    
    Itemcategory selectByPrimaryKey2(Integer id);

    int updateByPrimaryKeySelective(Itemcategory record);

    int updateByPrimaryKey(Itemcategory record);
    
    /**
     * 获取所有当前配件类型
     * @return
     * */
    public List<Itemcategory> getallitemtype();
    
    public List<Itemcategory> getItemcategory2(ItemcategorySearchModel model);
    public int getItemcategoryCount(ItemcategorySearchModel model);
       
}