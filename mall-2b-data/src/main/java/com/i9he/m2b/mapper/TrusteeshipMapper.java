package com.i9he.m2b.mapper;

import java.util.List;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;

public interface TrusteeshipMapper {

	int insert(Trusteeship record);

	int insertSelective(Trusteeship record);

	Trusteeship selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Trusteeship record);

	int updateByPrimaryKey(Trusteeship record);
	
	List<Trusteeship> getjointruord(TrusteeshipSearchModel searchModel);
	public int getjointruordCount(TrusteeshipSearchModel searchModel);
	Trusteeship getlogid(Integer id);
	
	
}