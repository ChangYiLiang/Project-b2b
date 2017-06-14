package com.i9he.m2b.biz.impl;


import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IUserbalanceService;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.model.search.UserbalanceSearchModel;
import com.i9he.m2b.util.MallErroCode;

import com.nr.comm.util.Calculations;

@Service("userbalanceService")
public class UserbalanceServiceImpl implements IUserbalanceService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private userBalance2bMapper userbalanceMapper;
	
	@Override
	public int insert(userBalance record)throws I9heException{
		int itemcategory;
		try {
			itemcategory = userbalanceMapper.insert(record);
			return itemcategory;
		} catch (Exception e) {
			logger.error("充值订单异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "充值订单异常", e);
		}
	}
	
	@Override
	public List<userBalance> getallbyuser(Integer id)throws I9heException{
		List<userBalance> userbalance;
		try {
			userbalance = userbalanceMapper.getallbyuser(id);
			return userbalance;
		} catch (Exception e) {
			logger.error("查数异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "查数异常", e);
		}
	}
	
	@Override
	public List<userBalance> getUserbalance(UserbalanceSearchModel model) throws I9heException{
		try{
			int count = userbalanceMapper.getUserbalanceCount(model);
			List<userBalance> list = userbalanceMapper.getUserbalance(model);
			model.setTotal(count);
			return list;
		}catch(Exception e){
			logger.error("获取充值列表异常", e);
			throw new I9heException("获取充值列表异常", e);
		}
	}
	
}