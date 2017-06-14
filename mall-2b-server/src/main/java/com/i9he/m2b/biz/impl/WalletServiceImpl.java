package com.i9he.m2b.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.mapper.WalletMapper;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.util.SessionUtil;
@Service("walletService")
public class WalletServiceImpl implements IWalletService {
	@Autowired
	private WalletMapper walletMapper;
	@Override
	public Wallet findByUserId() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return this.findByUserId(userId);
	}
	

	@Override
	public Wallet findByUserId(Integer userId) {
		Wallet wallet = new Wallet();
		wallet.setUserId(userId);
		return walletMapper.findByUserId(wallet);
	}
	
	@Override
	public int updateByUserId(Wallet wallet) {
		return walletMapper.updateByUserId(wallet);
	}
	@Override
	public int insert(Wallet wallet) {
		return walletMapper.insertSelective(wallet);
	}
	@Override
	public int updateByUser(Wallet wallet) {
		return walletMapper.updateByUser(wallet);
	}
	@Override
	public int initPassword() {
		return walletMapper.initPasword();
	}

}
