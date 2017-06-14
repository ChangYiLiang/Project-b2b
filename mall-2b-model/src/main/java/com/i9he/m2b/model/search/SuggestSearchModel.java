package com.i9he.m2b.model.search;

import java.util.List;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

public class SuggestSearchModel implements Serializable {

	private static final long serialVersionUID = 4364605604626846449L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;

	private Integer id;
    private Integer userId;
    private String content;
    private Integer type;
    private Integer issubmit;
    private String keyword;
    
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
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public Integer getIssubmit() {
        return issubmit;
    }
    public void setIssubmit(Integer issubmit) {
        this.issubmit = issubmit;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
    public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	} 
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
}