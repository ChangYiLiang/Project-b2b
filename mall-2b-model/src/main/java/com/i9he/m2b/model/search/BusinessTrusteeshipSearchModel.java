package com.i9he.m2b.model.search;

import java.util.Date;
import java.util.List;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class BusinessTrusteeshipSearchModel implements Serializable {

	private static final long serialVersionUID = 4364605604626846449L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;

    public int getStartPage() {
		return pageSize * (pageNo-1);
	}
	public SimpleDateFormat getFormatter() {
		return formatter;
	}
	public void setFormatter(SimpleDateFormat formatter) {
		this.formatter = formatter;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	

	private Integer serviceId;
	private String trustSize;
	private String power;
	private String line;
	private String serverId;
	private String bandwidth;
	private String osId;
	private String licenseId;
	private Integer ipCount;
	private Date createdDate;
	private Date updatedDate;
	private Integer updatedBy;
	private Integer orderId;
	private Integer state;
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId){
		this.orderId = orderId;
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state){
		this.state = state;
	}
	
	public Integer getServiceId() {
		return serviceId;
	}
	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public String getTrustSize() {
		return trustSize;
	}
	public void setTrustSize(String trustSize) {
		this.trustSize = trustSize== null ? null : trustSize.trim();
	}

	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power == null ? null : power.trim();
	}

	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line == null ? null : line.trim();
	}

	public String getServerId() {
		return serverId;
	}
	public void setServerId(String serverId) {
		this.serverId = serverId == null ? null : serverId.trim();
	}

	public String getBandwidth() {
		return bandwidth;
	}
	public void setBandwidth(String bandwidth) {
		this.bandwidth = bandwidth == null?null:bandwidth.trim();
	}

	public String getOsId() {
		return osId;
	}
	public void setOsId(String osId) {
		this.osId = osId == null ? null : osId.trim();
	}

	public String getLicenseId() {
		return licenseId;
	}

	public void setLicenseId(String licenseId) {
		this.licenseId = licenseId == null ? null : licenseId.trim();
	}

	public Integer getIpCount() {
		return ipCount;
	}

	public void setIpCount(Integer ipCount) {
		this.ipCount = ipCount;
	}
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Integer getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	
}