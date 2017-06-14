package com.i9he.m2b.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IZqUserService;
import com.i9he.m2b.mapper.ContractMapper;
import com.i9he.m2b.mapper.ZqUserMapper;
import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.ZqUser;
import com.i9he.m2b.util.SessionUtil;
@Service("zqUserService")
public class ZqUserServiceImpl implements IZqUserService{

	@Autowired
	private ZqUserMapper zqUserMapper;
	@Autowired
	private ContractMapper contractMapper;
	@Override
	public int insert(ZqUser zqUser) {
		return zqUserMapper.insertSelective(zqUser);
	}

	@Override
	public ZqUser findById(String userCode) {
		return zqUserMapper.selectByPrimaryKey(userCode);
	}

	@Override
	public int insertContract(Contract contract) {
		return contractMapper.insertSelective(contract);
	}

	@Override
	public List<Contract> getListByUserId() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return contractMapper.getListByUserId(userId);
	}

}
