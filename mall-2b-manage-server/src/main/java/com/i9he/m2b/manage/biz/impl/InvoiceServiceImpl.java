package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IInvoiceService;
import com.i9he.m2b.mapper.InvoiceQualifedMapper;
import com.i9he.m2b.mapper.InvoicesMapper;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.search.InvoiceQualifedSearchModel;
import com.i9he.m2b.model.search.InvoiceSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

@Service
public class InvoiceServiceImpl implements IInvoiceService{

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private InvoiceQualifedMapper invoiceQualifedMapper;
	@Autowired
	private InvoicesMapper invoicesMapper;
	
	@Override
	public List<InvoiceQualifed> getInvoiceQualifed(InvoiceQualifedSearchModel searchModel) throws I9heException {
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		if (StringUtils.isNotBlank(searchModel.getKeyword())) {
			List<Integer> userList = privilegeBaseApiService.getIdByUsername(searchModel.getKeyword());
			searchModel.setUserList(userList);
		}
		int total = invoiceQualifedMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		List<InvoiceQualifed> list = invoiceQualifedMapper.selectBySearchModel(searchModel, rowBounds);
		return list;
	}

	@Override
	public InvoiceQualifed getInvoiceByid(Integer id) {
		return invoiceQualifedMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer updateInvoiceQua(InvoiceQualifed invoiceQualifed) {
		invoiceQualifed.setIsReview((byte)1);
		invoiceQualifed.setReviewTime(new Date());
		return invoiceQualifedMapper.updateByPrimaryKeySelective(invoiceQualifed);
	}

	@Override
	public List<Invoices> getInvoice(InvoiceSearchModel searchModel) throws I9heException {
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		if (StringUtils.isNotBlank(searchModel.getKeyword())) {
			List<Integer> userList = privilegeBaseApiService.getIdByUsername(searchModel.getKeyword());
			searchModel.setUserList(userList);
		}
		int total = invoicesMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		List<Invoices> list = invoicesMapper.selectBySearchModel(searchModel, rowBounds);
		return list;
	}

	@Override
	public Invoices getInvoiceByInvoId(Integer invoiceId) {
		return invoicesMapper.selectByPrimaryKey(invoiceId);
	}

	@Override
	public Integer confirmInvoice(Integer invoiceId) {
		Invoices invoices = new Invoices();
		invoices.setId(invoiceId);
		invoices.setState(1);//1为'已开'
		return invoicesMapper.updateByPrimaryKeySelective(invoices);
	}

}
