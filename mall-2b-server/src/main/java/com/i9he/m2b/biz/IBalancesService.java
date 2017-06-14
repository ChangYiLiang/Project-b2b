package com.i9he.m2b.biz;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Balances;


public interface IBalancesService {

	/**
	 * 获取用户节操币信息
	 * 
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Balances getBalancesByUserid(Integer id) throws I9heException;

	/**
	 * 创建用户的余额表
	 * 
	 * @param balances
	 * @return
	 * @throws I9heException
	 */
	public Integer creatBalancesByuserId(Balances balances) throws I9heException;

}
