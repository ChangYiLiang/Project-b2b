package com.i9he.m2b.model;

import java.io.Serializable;


public class UserBonus implements Serializable {
    
    private Integer id;
    private Integer userId;
    private Integer bonusId;
    private String useTime;
    private Integer orderId;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getUserId() {
    	return userId;
    }
    public void setUserId(Integer userId) {
    	this.userId = userId;
    }
    
    public Integer getBonusId(){
    	return bonusId;
    }
    public void setBonusId(Integer bonusId){
    	this.bonusId = bonusId;
    }
    
    public String getUseTime(){
    	return useTime;
    }
    public void setUseTime(String useTime){
    	this.useTime = useTime==null ? null : useTime.trim();
    }
    
    public Integer getOrderId(){
    	return orderId;
    }
    public void setOrderId(Integer orderId){
    	this.orderId = orderId;
    }
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserBonus [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", bonusId=");
		builder.append(bonusId);
		builder.append(", useTime=");
		builder.append(useTime);
		builder.append(", orderId=");
		builder.append(orderId);
		builder.append("]");
		return builder.toString();
	}
   
}