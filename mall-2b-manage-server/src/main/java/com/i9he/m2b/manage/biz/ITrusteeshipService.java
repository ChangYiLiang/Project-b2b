package com.i9he.m2b.manage.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;


public interface ITrusteeshipService {

	public int insertSelective(Trusteeship record) throws I9heException;
	
	public List<Trusteeship> getjointruord(TrusteeshipSearchModel searchModel) throws I9heException;
	
	public Trusteeship getlogid(Integer id) throws I9heException;
	
	public int updateByPrimaryKeySelective(Trusteeship record) throws I9heException;
	
}