package com.i9he.m2b.model;

import java.math.BigDecimal;
import java.util.List;

public class ExpressfeeTemplateEX extends ExpressfeeTemplate{

	private static final long serialVersionUID = 1L;
	
	private List<ExpressfeeType> expressfeeTypes;
	
	private List<String> provinceName;
	
	private List<Integer> firstCount;
	
	private List<BigDecimal> firstFee;
	
	private List<Integer> addCount;
	
	private List<BigDecimal> addFee;


	public List<String> getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(List<String> provinceName) {
		this.provinceName = provinceName;
	}

	public List<Integer> getFirstCount() {
		return firstCount;
	}

	public void setFirstCount(List<Integer> firstCount) {
		this.firstCount = firstCount;
	}

	public List<BigDecimal> getFirstFee() {
		return firstFee;
	}

	public void setFirstFee(List<BigDecimal> firstFee) {
		this.firstFee = firstFee;
	}

	public List<Integer> getAddCount() {
		return addCount;
	}

	public void setAddCount(List<Integer> addCount) {
		this.addCount = addCount;
	}

	public List<BigDecimal> getAddFee() {
		return addFee;
	}

	public void setAddFee(List<BigDecimal> addFee) {
		this.addFee = addFee;
	}

	public List<ExpressfeeType> getExpressfeeTypes() {
		return expressfeeTypes;
	}

	public void setExpressfeeTypes(List<ExpressfeeType> expressfeeTypes) {
		this.expressfeeTypes = expressfeeTypes;
	}
	
	
}
