package com.i9he.m2b.biz;

import com.i9he.common.exception.I9heException;
import com.i9he.privilege.model.Merchant;

public interface IMerchantService {

	/**
	 * 获取企业用户信息
	 * 
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Merchant getMerchantByUserid(Integer merchantNo) throws I9heException;

	/**
	 * 修改企业用户信息
	 * 
	 * @param balances
	 * @return
	 * @throws I9heException
	 */
	public Merchant saveMerchantByuserId(Merchant merchant) throws I9heException;
}
