package com.i9he.m2b.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.mapper.LoanMapper;
import com.i9he.m2b.mapper.SyUserMapper;
import com.i9he.m2b.model.Loan;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.SessionUtil;
@Service("syUserService")
public class SyUserServiceImpl implements ISyUserService{
	
	@Autowired
	private SyUserMapper syUserMapper;
	@Autowired
	private LoanMapper loanMapper;
	
	@Override
	public boolean isExists(){
		Integer userId = SessionUtil.getSessionUser().getId();
		SyUser syUser = syUserMapper.findByUserId(userId);
		if(syUser!=null){
			return true;
		}
		return false;
	}
	@Override
	public int insert(SyUser syUser) {
		return syUserMapper.insertSelective(syUser);
	}
	@Override
	public int update(SyUser syUser) {
		return syUserMapper.updateByPrimaryKeySelective(syUser);
	}
	@Override
	public SyUser findByUser(String userId) {
//		Integer userId = SessionUtil.getSessionUser().getId();
		return syUserMapper.findByUserId(Integer.parseInt(userId));
	}
	@Override
	public List<Loan> getLoan() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return loanMapper.getInfo(userId);
	}
}
