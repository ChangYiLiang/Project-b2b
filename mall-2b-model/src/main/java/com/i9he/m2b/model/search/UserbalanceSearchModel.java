package com.i9he.m2b.model.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class UserbalanceSearchModel implements Serializable{
	
	private static final long serialVersionUID = 4041030617870550816L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;
    private String keyword;
    private Integer id;
    private Integer userId;
    private BigDecimal money;
    private Date chargeSj;
    private Integer chargeType;
    private String chargeOrder;
    private String chargeLog;
    
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
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
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
    public BigDecimal getMoney() {
        return money;
    }
    public void setMoney(BigDecimal money) {
        this.money = money;
    }
    public Date getChargeSj() {
        return chargeSj;
    }
    public void setChargeSj(Date chargeSj) {
        this.chargeSj = chargeSj;
    }
    public Integer getChargeType() {
        return chargeType;
    }
    public void setChargeType(Integer chargeType) {
        this.chargeType = chargeType;
    }
    public String getChargeOrder() {
        return chargeOrder;
    }
    public void setChargeOrder(String chargeOrder) {
        this.chargeOrder = chargeOrder == null ? null : chargeOrder.trim();
    }
    public String getChargeLog() {
        return chargeLog;
    }
    public void setChargeLog(String chargeLog) {
        this.chargeLog = chargeLog == null ? null : chargeLog.trim();
    }
	
}