package com.i9he.m2b.manage.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.BusinessTrusteeshipSearchModel;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;


public interface IBusinessTrusteeshipService {

	List<BusinessTrusteeship> GetSearchDate(BusinessTrusteeshipSearchModel searchModel) throws I9heException;
	
}