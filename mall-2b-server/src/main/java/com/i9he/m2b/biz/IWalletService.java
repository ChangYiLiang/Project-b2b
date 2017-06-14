package com.i9he.m2b.biz;

import com.i9he.m2b.model.Wallet;

public interface IWalletService {
	
	public Wallet findByUserId();
	
	public Wallet findByUserId(Integer userId);
	
	public int updateByUserId(Wallet wallet);
	
	public int insert(Wallet wallet);

	/***
	 * 通过用户id修改余额表
	 * @param wallet
	 * @return
	 */
	public int updateByUser(Wallet wallet);
	
	public int initPassword();

}
