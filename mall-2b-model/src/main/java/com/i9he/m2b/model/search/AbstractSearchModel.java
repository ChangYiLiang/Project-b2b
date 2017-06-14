package com.i9he.m2b.model.search;

import java.io.Serializable;

public abstract class AbstractSearchModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer pageSize;

	private Integer pageNo;

	private Integer total;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	protected String trim(String value) {
		return value != null ? value.trim() : null;
	}

	public int getOffset() {
		int pageSize = 0;
		int pageNo = 0;
		if (this.pageSize != null && this.pageSize > 0) {
			pageSize = this.pageSize;
		}
		if (this.pageNo != null && this.pageNo > 0) {
			pageNo = this.pageNo;
		}
		return pageSize * (pageNo - 1);
	}

	public int getLimit() {
		if (this.pageSize != null && this.pageSize > 0) {
			return this.pageSize;
		} else {
			return Integer.MAX_VALUE;
		}
	}
	
	public int getMaxPage() {
		int pageSize = this.pageSize != null ? this.pageSize : 1;
		int total = this.total != null ? this.total : 1;
		return (int) Math.ceil(total / (double) pageSize);
	}
}
