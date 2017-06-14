package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.IZqService;
import com.i9he.m2b.mapper.ContractMapper;
import com.i9he.m2b.mapper.ZqUserMapper;
import com.i9he.m2b.model.Contract;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.ZqUser;
import com.i9he.m2b.model.search.ZqSearchModel;
import com.i9he.m2b.model.search.ZqUserSearchModel;
@Service("zqService")
public class ZqServiceImpl implements IZqService {
	@Autowired
	private ZqUserMapper zqUserMapper;
	@Autowired
	private ContractMapper contractMapper; 

	@Override
	public List<Contract> getAll(ZqSearchModel zsm) {
		RowBounds rs = new RowBounds(zsm.getOffset(),zsm.getLimit());
		List<Contract> list = contractMapper.getAll(rs,zsm);
		int total = contractMapper.getCount(zsm);
		zsm.setTotal(total);
		return list;
	}

	@Override
	public List<ZqUser> getAllUser(ZqUserSearchModel zus) {
		RowBounds rs = new RowBounds(zus.getOffset(),zus.getLimit());
		List<ZqUser> list = zqUserMapper.getAll(zus,rs);
		int total = zqUserMapper.getCount(zus);
		zus.setTotal(total);
		return list;
	}

	@Override
	public int update(Contract contract) {
		return contractMapper.updateByPrimaryKeySelective(contract);
	}
	
	
}
