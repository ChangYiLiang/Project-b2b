package com.i9he.m2b.biz.model;

import java.util.List;

public class PayViewModel {
	
	private List<CartViewModel> cartViewModel;
	
	private Integer financialId;
	
	private Integer addressId;
	
	private Integer orderId;
	
	private String sum;
	
	private String address;
	
	private List<Integer> orderIdList;
	
	public List<Integer> getOrderIdList() {
		return orderIdList;
	}

	public void setOrderIdList(List<Integer> orderIdList) {
		this.orderIdList = orderIdList;
	}

	public Integer getFinancialId() {
		return financialId;
	}

	public void setFinancialId(Integer financialId) {
		this.financialId = financialId;
	}

	public List<CartViewModel> getCartViewModel() {
		return cartViewModel;
	}

	public void setCartViewModel(List<CartViewModel> cartViewModel) {
		this.cartViewModel = cartViewModel;
	}

	

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
}
