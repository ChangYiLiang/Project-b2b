package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.IUserCensusService;
import com.i9he.m2b.mapper.UserCensusMapper;
import com.i9he.m2b.model.UserNumber;
import com.i9he.m2b.model.UserRegisterNumber;
import com.i9he.m2b.model.UserToGrAndQy;
@Service("userCensusService")
public class UserCensusServiceImpl  implements IUserCensusService{
	@Autowired
	private UserCensusMapper userCensusMapper;
	@Override
	public List<UserNumber> getUserNumber() {
		return userCensusMapper.getUserNumber();
	}

	@Override
	public UserRegisterNumber getUserRegisterNumber() {
		return userCensusMapper.getUserRegisterNumber();
	}

	@Override
	public UserToGrAndQy getUserToGrAndQy() {
		return userCensusMapper.getUserToGrAndQy();
	}

}
