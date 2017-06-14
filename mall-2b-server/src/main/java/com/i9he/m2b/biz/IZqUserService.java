package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.ZqUser;

public interface IZqUserService {
	
	public int insert(ZqUser zqUser);
	
	public ZqUser findById(String userCode);
	
	public int insertContract(Contract contract);
	
	public List<Contract> getListByUserId();

}
