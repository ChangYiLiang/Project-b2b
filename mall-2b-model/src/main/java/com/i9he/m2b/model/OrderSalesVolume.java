package com.i9he.m2b.model;

import java.io.Serializable;

public class OrderSalesVolume  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String time;
	
	private Integer number;
	
	private Integer money;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}
	
	
}
