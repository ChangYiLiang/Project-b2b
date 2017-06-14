package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Bonus;


public interface IBonusService {

	public List<Bonus> getallbonus() throws I9heException;
	
	public int insertSelective(Bonus record) throws I9heException;
	
	public Bonus selectByPrimaryKey(Integer typeId) throws I9heException;
	
	public int updateByPrimaryKeySelective(Bonus record) throws I9heException;

}