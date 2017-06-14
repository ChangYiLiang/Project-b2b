package com.i9he.m2b.manage.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.ITrusteeshipService;
import com.i9he.m2b.mapper.TrusteeshipMapper;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

@Service
public class TrusteeshipServiceImpl implements ITrusteeshipService {
	
	@Autowired
	private TrusteeshipMapper trusteeshipMapper;
	
	@Override
	public int insertSelective(Trusteeship record) throws I9heException {
		return trusteeshipMapper.insertSelective(record);
	}
	
	@Override
	public List<Trusteeship> getjointruord(TrusteeshipSearchModel searchModel) throws I9heException {
		int count = trusteeshipMapper.getjointruordCount(searchModel);
		List<Trusteeship> list = trusteeshipMapper.getjointruord(searchModel);
		searchModel.setTotal(count);
		return list;
	}
	
	@Override
	public Trusteeship getlogid(Integer id) throws I9heException{
		return trusteeshipMapper.getlogid(id);
	}
	
	@Override
	public int updateByPrimaryKeySelective(Trusteeship record) throws I9heException{
		return trusteeshipMapper.updateByPrimaryKeySelective(record);
	}

}