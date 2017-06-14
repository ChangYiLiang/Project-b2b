package com.i9he.m2b.model.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public class ItemSearchModel implements Serializable{
	
	private static final long serialVersionUID = 4364605604626846449L;

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	private Integer pageNo = 1;
	private Integer pageSize = 20;
	private Integer total = 0;
	
    private Integer id;
    private String title;
    private Integer brandId;
    private Integer categoryId;
    private BigDecimal price;
    private Date createdDate;
    private Byte itemType;
    private String args0;
    private String args1;
    private String args2;
    private String args3;
    private String args4;
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
	
	
	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }
    public Integer getBrandId() {
        return brandId;
    }
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }
    public Integer getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public Date getCreatedDate() {
        return createdDate;
    }
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    public Byte getItemType() {
        return itemType;
    }
    public void setItemType(Byte itemType) {
        this.itemType = itemType;
    }
    public String getArgs0() {
        return args0;
    }
    public void setArgs0(String args0) {
        this.args0 = args0 == null ? null : args0.trim();
    }
    public String getArgs1() {
        return args1;
    }
    public void setArgs1(String args1) {
        this.args1 = args1 == null ? null : args1.trim();
    }
    public String getArgs2() {
        return args2;
    }
    public void setArgs2(String args2) {
        this.args2 = args2 == null ? null : args2.trim();
    }
    public String getArgs3() {
        return args3;
    }
    public void setArgs3(String args3) {
        this.args3 = args3 == null ? null : args3.trim();
    }
    public String getArgs4() {
        return args4;
    }
    public void setArgs4(String args4) {
        this.args4 = args4 == null ? null : args4.trim();
    }
	
}