package com.i9he.m2b.biz.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IBalancesService;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.util.MallErroCode;

@Service("balancesService")
public class BalancesServiceImpl implements IBalancesService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");

	@Autowired
	private Balances2bMapper balancesMapper;

	@Override
	public Balances getBalancesByUserid(Integer id) throws I9heException {
		Balances balances;
		try {
			balances = balancesMapper.selectByPrimaryKey(id);
			return balances;
		} catch (Exception e) {
			logger.error("查询用户id[" + id + "]余额表出现异常");
			throw new I9heException(MallErroCode.MALL_USER_SELECT_ERRO, "查询用户id[" + id + "]余额表出现异常", e);
		}
	}

	@Override
	public Integer creatBalancesByuserId(Balances balances) throws I9heException {
		try {
			return balancesMapper.insertSelective(balances);
		} catch (Exception e) {
			logger.error("插入用户余额表出现异常");
			throw new I9heException(MallErroCode.MALL_USER_INSERT_ERRO, "插入用户余额表出现异常", e);
		}
	}

}
