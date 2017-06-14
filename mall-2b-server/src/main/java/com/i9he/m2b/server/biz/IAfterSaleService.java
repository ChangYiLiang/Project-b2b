package com.i9he.m2b.server.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleExample;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.AfterSaleShipping;
import com.i9he.m2b.model.search.SimpleSearchModel;

public interface IAfterSaleService {
	
	public void apply(AfterSale afterSale, AfterSaleRefund refund, AfterSaleShipping shipping) throws I9heException;
	
	public AfterSale getAfterSale(Integer id) throws I9heException;
	
	public List<AfterSale> getAfterSales(AfterSaleExample example, SimpleSearchModel searchModel) throws I9heException;
	
	public List<AfterSaleRecord> getAfterSaleRecord(Integer afsId) throws I9heException;
	
	public void cancel(Integer id) throws I9heException;
	
}
