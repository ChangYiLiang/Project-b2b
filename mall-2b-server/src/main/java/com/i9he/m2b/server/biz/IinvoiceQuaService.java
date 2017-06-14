package com.i9he.m2b.server.biz;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.InvoiceQualifed;




public interface IinvoiceQuaService {

	/**
	 * 插入增值发票申请
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Integer insertInvoiceQualifed(InvoiceQualifed invoiceQualifed)throws I9heException;
}
