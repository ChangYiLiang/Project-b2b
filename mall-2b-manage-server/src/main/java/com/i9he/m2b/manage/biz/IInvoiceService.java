package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.search.InvoiceQualifedSearchModel;
import com.i9he.m2b.model.search.InvoiceSearchModel;



public interface IInvoiceService {

	/***
	 * 获取增票资质申请列表
	 * @return
	 * @throws I9heException
	 */
	public List<InvoiceQualifed> getInvoiceQualifed(InvoiceQualifedSearchModel searchModel) throws I9heException;

	/***
	 * 根据id查增票资质
	 * @param id
	 * @return
	 */
	public InvoiceQualifed getInvoiceByid(Integer id);

	/***
	 * 审核资质
	 * @param invoiceQualifed
	 * @return
	 */
	public Integer updateInvoiceQua(InvoiceQualifed invoiceQualifed);

	/***
	 * 获取发票记录
	 * @param searchModel
	 * @return
	 * @throws I9heException 
	 */
	public List<Invoices> getInvoice(InvoiceSearchModel searchModel) throws I9heException;

	/***
	 * 根据id获取发票记录
	 * @param invoiceId
	 * @return
	 */
	public Invoices getInvoiceByInvoId(Integer invoiceId);

	/***
	 * 确定开具发票
	 * @param invoiceId
	 * @return
	 */
	public Integer confirmInvoice(Integer invoiceId);

}