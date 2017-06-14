package com.i9he.m2b.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.ILoanService;
import com.i9he.m2b.mapper.LoanMapper;
import com.i9he.m2b.model.Loan;
@Service("loanService")
public class LoanServiceImpl implements ILoanService {

	@Autowired
	private LoanMapper loanMapper;
	@Override
	public int insert(Loan loan) {
		
		return loanMapper.insertSelective(loan);
	}
	@Override
	public int update(Loan loan) {
		return loanMapper.updateByPrimaryKeySelective(loan);
	}
	@Override
	public Loan findByOrderId(Integer orderId) {
		return loanMapper.findByOrderId(orderId);
	}
	
}
