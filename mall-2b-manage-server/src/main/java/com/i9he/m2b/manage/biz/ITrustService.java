package com.i9he.m2b.manage.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.TruDatacenter;


public interface ITrustService {
	
	public int insertSelective(TruDatacenter record) throws I9heException;
	
	public List<TruDatacenter> getjointru() throws I9heException;

	public TruDatacenter selectByPrimaryKey(Integer id) throws I9heException;
	
	public int updateByPrimaryKeySelective(TruDatacenter record) throws I9heException;
	
	public List<TruDatacenter> gettrucity(Integer id) throws I9heException;
	
}