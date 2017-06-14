package com.i9he.m2b.model.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public class ItemcategorySearchModel implements Serializable{
	
	private static final long serialVersionUID = 5996576757393455247L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;
	
	private Integer id;
    private String typeName;
    private Integer ifIdc;
    private String typeAttr;
    private Integer sort;
    private String keyword;
    
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
	
	
	public Integer getSort() {
        return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getIfIdc() {
        return ifIdc;
    }
    public void setIfIdc(Integer ifIdc) {
        this.ifIdc = ifIdc;
    }

    public String getTypeAttr() {
        return typeAttr;
    }
    public void setTypeAttr(String typeAttr) {
        this.typeAttr = typeAttr == null ? null : typeAttr.trim();
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

}