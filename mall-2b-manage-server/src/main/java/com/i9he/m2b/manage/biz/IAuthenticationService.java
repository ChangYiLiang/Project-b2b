package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.search.AuthenticationSearchModel;

public interface IAuthenticationService {
	
	public List<Authentication> getList(AuthenticationSearchModel asm);
	
	public Authentication findById(String id);
	
	public int updateStatus(Authentication authentication);
	
	public int addMerchant(IMerchant iMerchant);

}
