package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Bespoke implements Serializable {
    
    private Integer id;
    private String title;
    private String pokedesc;
    private String person;
    private String mobile;
    private String bespokeDate;
    private Date submitDate;
    private Integer submitFlag;
    private String endDate;
    private String tecperson;
    private BigDecimal pay;
    private Integer userid;
    
    
    public Integer getUserid() {
        return userid;
    }
    public void setUserid(Integer userid) {
        this.userid = userid;
    }
    
    public BigDecimal getPay() {
        return pay;
    }
    public void setPay(BigDecimal pay) {
        this.pay = pay;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getSubmitFlag() {
        return submitFlag;
    }
    public void setSubmitFlag(Integer submitFlag) {
        this.submitFlag = submitFlag;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }
    public String getPokedesc() {
        return pokedesc;
    }
    public void setPokedesc(String pokedesc) {
        this.pokedesc = pokedesc == null ? null : pokedesc.trim();
    }
    public String getPerson() {
        return person;
    }
    public void setPerson(String person) {
        this.person = person == null ? null : person.trim();
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }
    
    public String getTecperson() {
        return tecperson;
    }
    public void setTecperson(String tecperson) {
        this.tecperson = tecperson == null ? null : tecperson.trim();
    }
    
    public String getBespokeDate() {
        return bespokeDate;
    }
    public void setBespokeDate(String bespokeDate) {
        this.bespokeDate = bespokeDate == null? null:bespokeDate.trim();
    }
    
    public String getEndDate() {
        return endDate;
    }
    public void setEndDate(String endDate) {
        this.endDate = endDate==null? null:endDate.trim();
    }
    public Date getSubmitDate() {
        return submitDate;
    }
    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }
    
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Bespoke [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", pokedesc=");
		builder.append(pokedesc);
		builder.append(", person=");
		builder.append(person);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", bespokeDate=");
		builder.append(bespokeDate);
		builder.append(", submitDate=");
		builder.append(submitDate);
		builder.append(", submitFlag=");
		builder.append(submitFlag);
		builder.append(", endDate=");
		builder.append(endDate);
		builder.append(", tecperson=");
		builder.append(tecperson);
		builder.append(", pay=");
		builder.append(pay);
		builder.append(", userid=");
		builder.append(userid);
		builder.append("]");
		return builder.toString();
	}
    
}