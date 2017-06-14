package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.ZqUser;
import com.i9he.m2b.model.search.ZqSearchModel;
import com.i9he.m2b.model.search.ZqUserSearchModel;

public interface IZqService {
	
	public List<Contract> getAll(ZqSearchModel zsm);
	
	public List<ZqUser> getAllUser(ZqUserSearchModel zus);
	
	public int update(Contract contract);

}
