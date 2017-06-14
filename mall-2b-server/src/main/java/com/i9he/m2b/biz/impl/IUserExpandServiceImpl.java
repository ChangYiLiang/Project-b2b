package com.i9he.m2b.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IUserExpandService;
import com.i9he.m2b.mapper.UserExpandMapper;
import com.i9he.m2b.model.UserExpand;
import com.i9he.m2b.util.SessionUtil;
@Service("userExpandService")
public class IUserExpandServiceImpl implements IUserExpandService{
	@Autowired
	private UserExpandMapper userExpandMapper;
	
	@Override
	public UserExpand findById() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return userExpandMapper.selectByPrimaryKey(userId);
	}

	@Override
	public int update(UserExpand userExpand) {
		return userExpandMapper.updateByPrimaryKeySelective(userExpand);
	}

	@Override
	public int insert(UserExpand userExpand) {
		return userExpandMapper.insertSelective(userExpand);
	}

}
