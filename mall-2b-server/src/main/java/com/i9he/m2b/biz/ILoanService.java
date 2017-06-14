package com.i9he.m2b.biz;

import com.i9he.m2b.model.Loan;

public interface ILoanService {
	
	public int insert(Loan loan);
	
	public int update(Loan loan);
	
	public Loan findByOrderId(Integer orderId);

}
