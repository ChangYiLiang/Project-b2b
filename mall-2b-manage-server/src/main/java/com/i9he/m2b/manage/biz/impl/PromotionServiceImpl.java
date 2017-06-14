package com.i9he.m2b.manage.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IPromotionService;
import com.i9he.m2b.manage.biz.ITrusteeshipService;
import com.i9he.m2b.mapper.PromotionMapper;
import com.i9he.m2b.mapper.TrusteeshipMapper;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Promotion;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.PromotionSearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

@Service
public class PromotionServiceImpl implements IPromotionService {
	
	@Autowired
	private PromotionMapper PromotionMapper;
	
	@Override
	public List<Promotion> GetPromotion(PromotionSearchModel model) throws I9heException {
		int count = PromotionMapper.GetPromotionCount(model);
		List<Promotion> list = PromotionMapper.GetPromotion(model);
		model.setTotal(count);
		return list;
	}
	
}