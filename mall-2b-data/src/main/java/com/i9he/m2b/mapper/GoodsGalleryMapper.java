package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.Bespoke;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

public interface GoodsGalleryMapper {

    int insertSelective(GoodsGallery record);
    
    int updateByPrimaryKeySelective(GoodsGallery record);
    
    int DeleteGallery(Integer id);
    
    List<GoodsGallery> GetGoodsGallery(Integer goodsId);
    
    List<GoodsGallery> GetSearchDate(GoodsGallerySearchModel searchModel);
    
	public int GetSearchDateCount(GoodsGallerySearchModel searchModel);
    
}