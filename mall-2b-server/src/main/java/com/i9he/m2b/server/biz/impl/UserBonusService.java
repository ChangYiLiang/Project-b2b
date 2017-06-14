package com.i9he.m2b.server.biz.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.UserBonusMapper;
import com.i9he.m2b.model.UserBonus;
import com.i9he.m2b.server.biz.IUserBonusService;

@Service
public class UserBonusService implements IUserBonusService {

	@Autowired
	private UserBonusMapper userbonusMapper;

	@Override
	public int insertSelective(UserBonus record) throws I9heException{
		return userbonusMapper.insertSelective(record);
	}
	
	@Override
	public int getsum(Integer userId,Integer bonusId) throws I9heException{
		return userbonusMapper.getsum(userId, bonusId);
	}
}