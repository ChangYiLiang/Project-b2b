package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.model.Loan;
import com.i9he.m2b.model.SyUser;

public interface ISyUserService {
	
	public boolean isExists();
	
	public int insert(SyUser syUser);
	
	public int update(SyUser syUser);
	
	public SyUser findByUser(String userId);
	
	public List<Loan> getLoan();

}
