package com.i9he.m2b.biz.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IAuthenticationService;
import com.i9he.m2b.mapper.AuthenticationMapper;
import com.i9he.m2b.mapper.IMerchantMapper;
import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.search.AuthenticationSearchModel;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.mapper.MerchantMapper;
import com.i9he.privilege.model.Merchant;
@Service("authenticationService")
public class AuthenticationServiceImpl implements IAuthenticationService {
	
	@Autowired
	private AuthenticationMapper authenticationMapper;
	@Autowired
	private IMerchantMapper iMerchantMapper;

	@Override
	public int addAuthentication(Authentication authentication) {
		Integer userId = SessionUtil.getSessionUser().getId();
		authentication.setUserId(userId);
		authentication.setStatus((byte)0);
		authentication.setCreateTime(new Date());
		return authenticationMapper.insertSelective(authentication);
	}

	@Override
	public int updateAuthentication(Authentication authentication) {
		Integer userId = SessionUtil.getSessionUser().getId();
		authentication.setUserId(userId);
		authentication.setStatus((byte)0);
		authentication.setCreateTime(new Date());
		return authenticationMapper.updateByPrimaryKeySelective(authentication);
	}

	@Override
	public List<Authentication> getAuthentication(AuthenticationSearchModel asm) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Authentication findByUserId() {
		Integer userId = SessionUtil.getSessionUser().getId();
		Authentication authentication = new Authentication();
		authentication.setUserId(userId);
		return authenticationMapper.findByUserId(authentication);
	}

	@Override
	public int addMerchant(IMerchant iMerchant) {
		// TODO Auto-generated method stub
		return iMerchantMapper.insertSelective(iMerchant);
	}

	

}
