package com.i9he.m2b.manage.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.i9he.m2b.model.search.AbstractSearchModel;

public abstract class AbstractController {
	
	public static final String MIME_JSON = "application/json;charset=utf-8";

	protected Map<String, Object> wrapDataTable(Collection<?> items, Integer total) {
		Map<String, Object> dataTable = new HashMap<String, Object>();
		dataTable.put("aaData", items);
		dataTable.put("iTotalRecords", total);
		dataTable.put("iTotalDisplayRecords", total);
		return dataTable;
	}
	
	protected Map<String, Object> wrapDataTable(Collection<?> items, AbstractSearchModel searchModel) {
		Map<String, Object> dataTable = new HashMap<String, Object>();
		dataTable.put("aaData", items);
		dataTable.put("iTotalRecords", searchModel.getTotal());
		dataTable.put("iTotalDisplayRecords", searchModel.getTotal());
		return dataTable;
	}

}
