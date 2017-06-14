package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.search.AuthenticationSearchModel;
import com.i9he.privilege.model.Merchant;

public interface IAuthenticationService {
	
	public int addAuthentication(Authentication authentication);
	
	public Authentication findByUserId();
	
	public int updateAuthentication(Authentication authentication);
	
	public List<Authentication> getAuthentication(AuthenticationSearchModel asm);
	
	public int addMerchant(IMerchant iMerchant);

}
