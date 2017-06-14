package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class FestLog implements Serializable{

	private static final long serialVersionUID = 4364605604626846449L;

    private Integer id;
    private Integer userId;
    private Date logTime;
    private Integer logNum;
    private String logDesc;
    private Integer logFlag;
    
    public Integer getLogFlag(){
    	return logFlag;
    }
    public void setLogFlag(Integer logFlag){
    	this.logFlag = logFlag;
    }
    public Integer getId(){
    	return id;
    }
    public void setId(Integer id){
    	this.id = id;
    }
    public Integer getUserId(){
    	return userId;
    }
    public void setUserId(Integer userId){
    	this.userId = userId;
    }
    public Date getLogTime(){
    	return logTime;
    }
    public void setLogTime(Date logTime){
    	this.logTime = logTime;
    }
    public Integer getLogNum(){
    	return logNum;
    }
    public void setLogNum(Integer logNum){
    	this.logNum=logNum;
    }
    public String getLogDesc() {
        return logDesc;
    }
    public void setLogDesc(String logDesc) {
        this.logDesc = logDesc == null ? null : logDesc.trim();
    }
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FestLog [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", logTime=");
		builder.append(logTime);
		builder.append(", logNum=");
		builder.append(logNum);
		builder.append(", logDesc=");
		builder.append(logDesc);
		builder.append(", logFlag=");
		builder.append(logFlag);
		builder.append("]");
		return builder.toString();
	}
    
}