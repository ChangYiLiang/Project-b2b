package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.Promotion;
import com.i9he.m2b.model.search.ItemcategorySearchModel;
import com.i9he.m2b.model.search.PromotionSearchModel;



public interface PromotionMapper {
  
    int insertSelective(Promotion record);
    
    List<Promotion> getallpromotion();
    
    List<Promotion> GetTitle(Integer categoryId);
    
    int DeletePromotion(Integer id);
    
    public List<Promotion> GetPromotion(PromotionSearchModel model);
    
    public int GetPromotionCount(PromotionSearchModel model);

}