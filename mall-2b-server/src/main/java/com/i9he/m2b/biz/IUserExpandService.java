package com.i9he.m2b.biz;

import com.i9he.m2b.model.UserExpand;

public interface IUserExpandService {
	
	public UserExpand findById();
	
	public int update(UserExpand userExpand);
	
	public int insert(UserExpand userExpand);

}
