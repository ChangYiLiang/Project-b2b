package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.search.AfterSaleSearchModel;

public interface IAfterSaleService {
	
	public List<AfterSale> searchAfterSale(AfterSaleSearchModel searchModel);
	
	public AfterSale getAfterSale(Integer id) throws I9heException;
	
	public void saveAfterSale(AfterSale afterSale) throws I9heException;
	
	public void insertAfterSaleRecord(Integer afsId, String details) throws I9heException;
	
	public void saveAfterSaleRefundMoney(AfterSaleRefund refund) throws I9heException;
	
	public List<AfterSaleRecord> getAfterSaleRecords(Integer afsId) throws I9heException;
	
}
