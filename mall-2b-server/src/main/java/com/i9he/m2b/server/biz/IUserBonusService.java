package com.i9he.m2b.server.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.UserBonus;


public interface IUserBonusService {

	public int insertSelective(UserBonus record) throws I9heException;
	
	public int getsum(Integer userId,Integer bonusId) throws I9heException;
	
}