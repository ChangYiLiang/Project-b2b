package com.i9he.m2b.biz.impl;

import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IMerchantService;
import com.i9he.privilege.model.Merchant;

@Service("merchantService")
public class MerchantServiceImpl implements IMerchantService {

	@Override
	public Merchant getMerchantByUserid(Integer merchantNo) throws I9heException {
		return null;
	}

	@Override
	public Merchant saveMerchantByuserId(Merchant merchant) throws I9heException {
		return null;
	}

}
