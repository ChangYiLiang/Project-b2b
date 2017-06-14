package com.i9he.m2b.manage.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Promotion;
import com.i9he.m2b.model.search.PromotionSearchModel;

public interface IPromotionService {

	public List<Promotion> GetPromotion(PromotionSearchModel model)throws I9heException;
    
    //public int GetPromotionCount(PromotionSearchModel model)throws I9heException;
	
}