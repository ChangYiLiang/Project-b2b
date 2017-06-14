package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.biz.model.InvoiceViewModel;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.search.InvoiceSearchModel;
import com.i9he.m2b.util.PageModel;

public interface IInvoicesService {
	
	public InvoiceQualifed findByUserId();
	
	public int insert(Invoices invoices); 
	
	public InvoiceQualifed findById(String  id);
	
	/***
	 * 根据用户id获取发票记录
	 * @param invoiceSearchModel
	 * @return
	 */
	public List<Invoices> selectByUserId(InvoiceSearchModel invoiceSearchModel);

	public PageModel getPageModel(InvoiceSearchModel invoiceSearchModel);

	/***
	 * 根据订单查发票 
	 * @param orderId
	 * @return
	 */
	public Invoices selectInvoiceByOrderId(Integer orderId);

}
