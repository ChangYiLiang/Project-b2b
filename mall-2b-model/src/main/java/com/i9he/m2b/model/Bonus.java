package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Bonus implements Serializable {
    
    private Integer typeId;
    private String typeName;
    private BigDecimal typeMoney;
    private BigDecimal minAmount;
    private String startDate;
    private String endDate;
    private Integer sendNum;
    private Integer getNum;
    private Integer useNum;
    private Integer cangetNum;
    
    public Integer getTypeId() {
        return typeId;
    }
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    
    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }
    
    public BigDecimal getMinAmount() {
        return minAmount;
    }
    public void setMinAmount(BigDecimal minAmount) {
        this.minAmount = minAmount;
    }
    
    public BigDecimal getTypeMoney() {
        return typeMoney;
    }
    public void setTypeMoney(BigDecimal typeMoney) {
        this.typeMoney = typeMoney;
    }
    
    public String getStartDate(){
    	return startDate;
    }
    public void setStartDate(String startDate){
    	this.startDate = startDate == null ? null : startDate.trim();;
    }
    
    public String getEndDate(){
    	return endDate;
    }
    public void setEndDate(String endDate){
    	this.endDate = endDate == null ? null : endDate.trim();;
    }
    
    public Integer getSendNum(){
    	return sendNum;
    }
    public void setSendNum(Integer sendNum){
    	this.sendNum = sendNum;
    }
    
    public Integer getGetNum(){
    	return getNum;
    }
    public void setGetNum(Integer getNum){
    	this.getNum = getNum;
    }
    
    public Integer getUseNum(){
    	return useNum;
    }
    public void setUseNum(Integer useNum){
    	this.useNum = useNum;
    }
    
    public Integer getCangetNum(){
    	return cangetNum;
    }
    public void setCangetNum(Integer cangetNum){
    	this.cangetNum = cangetNum;
    }
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Bonus [typeId=");
		builder.append(typeId);
		builder.append(", typeName=");
		builder.append(typeName);
		builder.append(", typeMoney=");
		builder.append(typeMoney);
		builder.append(", minAmount=");
		builder.append(minAmount);
		builder.append(", startDate=");
		builder.append(startDate);
		builder.append(", sendNum=");
		builder.append(sendNum);
		builder.append(", getNum=");
		builder.append(getNum);
		builder.append(", useNum=");
		builder.append(useNum);
		builder.append(", cangetNum=");
		builder.append(cangetNum);
		builder.append("]");
		return builder.toString();
	}
     
}