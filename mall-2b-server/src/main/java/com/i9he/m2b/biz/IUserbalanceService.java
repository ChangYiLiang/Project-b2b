package com.i9he.m2b.biz;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.model.search.UserbalanceSearchModel;


/**
 * @author Administrator
 *
 */

public interface IUserbalanceService {
	/**
	 * 插入充值
	 * @return
	 * @throws I9heException
	 */
	public int insert(userBalance record)throws I9heException;
	
	public List<userBalance> getallbyuser(Integer id)throws I9heException;
	
	public List<userBalance> getUserbalance(UserbalanceSearchModel model) throws I9heException;
	
}