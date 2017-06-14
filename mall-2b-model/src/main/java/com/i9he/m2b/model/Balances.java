package com.i9he.m2b.model;

import java.io.Serializable;

public class Balances implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1847579925115889415L;

	/**
     * 用户id
     */
    private Integer userId;

    /**
     * 节操币余额
     */
    private Integer festBalance;

    /**
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     */
    public Integer getFestBalance() {
        return festBalance;
    }

    /**
     */
    public void setFestBalance(Integer festBalance) {
        this.festBalance = festBalance;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Balances [userId=");
		builder.append(userId);
		builder.append(", festBalance=");
		builder.append(festBalance);
		builder.append("]");
		return builder.toString();
	}
    
}