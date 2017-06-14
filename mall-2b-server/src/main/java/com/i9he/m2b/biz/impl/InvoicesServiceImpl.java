package com.i9he.m2b.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.model.InvoiceViewModel;
import com.i9he.m2b.mapper.InvoiceQualifedMapper;
import com.i9he.m2b.mapper.InvoicesMapper;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.search.InvoiceSearchModel;
import com.i9he.m2b.util.PageModel;
import com.i9he.m2b.util.SessionUtil;
@Service("InvoicesService")
public class InvoicesServiceImpl implements IInvoicesService {
	@Autowired
	private InvoiceQualifedMapper invoiceQualifedMapper;
	@Autowired
	private InvoicesMapper invoicesMapper;
	@Override
	public InvoiceQualifed findByUserId() {
		// TODO Auto-generated method stub
		Integer userId = SessionUtil.getSessionUser().getId();
		return invoiceQualifedMapper.findByUserId(userId);
	}
	@Override
	public int insert(Invoices invoices) {
		// TODO Auto-generated method stub
		return invoicesMapper.insertSelective(invoices);
	}
	@Override
	public InvoiceQualifed findById(String id) {
		// TODO Auto-generated method stub
		return invoiceQualifedMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	@Override
	public List<Invoices> selectByUserId(InvoiceSearchModel invoiceSearchModel) {
		
		return invoicesMapper.selectByUserId(invoiceSearchModel);
	}
	@Override
	public PageModel getPageModel(InvoiceSearchModel invoiceSearchModel) {
		int pageSize = invoiceSearchModel.getPageSize();
		PageModel pageModel = new PageModel();
		int counts =  invoicesMapper.selectCountBySearchModel(invoiceSearchModel);
		int count = counts/pageSize;
		if(counts%pageSize > 0){
			count =count+1; 
		}
		if(count == 0){
			count = 1;
		}
		pageModel.setPageCount(count);
		pageModel.setPageNo(invoiceSearchModel.getPageNo());
		return pageModel;
	}
	@Override
	public Invoices selectInvoiceByOrderId(Integer orderId) {
		return invoicesMapper.selectByOrderId(orderId);
	}
}
