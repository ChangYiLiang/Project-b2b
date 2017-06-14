package com.i9he.m2b.manage.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IBusinessTrusteeshipService;
import com.i9he.m2b.manage.biz.IGoodsGalleryService;
import com.i9he.m2b.manage.biz.ITrusteeshipService;
import com.i9he.m2b.mapper.BusinessTrusteeshipMapper;
import com.i9he.m2b.mapper.GoodsGalleryMapper;
import com.i9he.m2b.mapper.TrusteeshipMapper;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.BusinessTrusteeshipSearchModel;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

@Service
public class BusinessTrusteeshipServiceImpl implements IBusinessTrusteeshipService {
	
	@Autowired
	private BusinessTrusteeshipMapper BusinessTrusteeshipMapper;

	@Override
	public List<BusinessTrusteeship> GetSearchDate(BusinessTrusteeshipSearchModel searchModel) throws I9heException {
		int count = BusinessTrusteeshipMapper.GetSearchDateCount(searchModel);
		List<BusinessTrusteeship> list = BusinessTrusteeshipMapper.GetSearchDate(searchModel);
		searchModel.setTotal(count);
		return list;
	}
	
}