package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.search.BusinessTrusteeshipSearchModel;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;



public interface BusinessTrusteeshipMapper {
    /**
     */
    int deleteByPrimaryKey(Integer serviceId);

    /**
     */
    int insert(BusinessTrusteeship record);

    /**
     */
    int insertSelective(BusinessTrusteeship record);

    /**
     */
    BusinessTrusteeship selectByPrimaryKey(Integer serviceId);
    
    /**
     */
    List<BusinessTrusteeship> selectAll();
    
    /**
     */
    Integer updateByPrimaryKeySelective(BusinessTrusteeship server);

    /**
     */
    int updateByPrimaryKey(BusinessTrusteeship record);

    
    List<BusinessTrusteeship> GetSearchDate(BusinessTrusteeshipSearchModel searchModel);
    
	public int GetSearchDateCount(BusinessTrusteeshipSearchModel searchModel);
    
  
}