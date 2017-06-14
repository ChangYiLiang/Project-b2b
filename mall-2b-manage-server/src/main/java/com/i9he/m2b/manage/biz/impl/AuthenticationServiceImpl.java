package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.IAuthenticationService;
import com.i9he.m2b.mapper.AuthenticationMapper;
import com.i9he.m2b.mapper.IMerchantMapper;
import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.search.AuthenticationSearchModel;
@Service("authenticationService")
public class AuthenticationServiceImpl implements IAuthenticationService {
    @Autowired
	private AuthenticationMapper authenticationMapper;
    
    @Autowired
	private IMerchantMapper iMerchantMapper;
	@Override
	public List<Authentication> getList(AuthenticationSearchModel asm) {
		RowBounds rs = new RowBounds(asm.getOffset(),asm.getLimit());
		List<Authentication> list = authenticationMapper.getList(asm, rs);
		int total = authenticationMapper.getTotal(asm);
		asm.setTotal(total);
		return list;
	}
	@Override
	public Authentication findById(String id) {
		// TODO Auto-generated method stub
		return authenticationMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	@Override
	public int updateStatus(Authentication authentication) {
		// TODO Auto-generated method stub
		return authenticationMapper.updateByPrimaryKeySelective(authentication);
	}
	@Override
	public int addMerchant(IMerchant iMerchant) {
		// TODO Auto-generated method stub
		return iMerchantMapper.insertSelective(iMerchant);
	}

}
