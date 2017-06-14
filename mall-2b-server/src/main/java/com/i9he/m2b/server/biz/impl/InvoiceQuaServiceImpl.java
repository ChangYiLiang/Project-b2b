package com.i9he.m2b.server.biz.impl;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.InvoiceQualifedMapper;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.server.biz.IinvoiceQuaService;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.model.User;

@Service("invoiceQuaService")
public class InvoiceQuaServiceImpl implements IinvoiceQuaService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private InvoiceQualifedMapper invoiceQualifedMapper;

	@Override
	public Integer insertInvoiceQualifed(InvoiceQualifed invoiceQualifed) throws I9heException {
		User user = SessionUtil.getSessionUser();
		invoiceQualifed.setUserId(user.getId());
		invoiceQualifed.setIsReview((byte)0);
		invoiceQualifed.setCreatedTime(new Date());
		return invoiceQualifedMapper.insertSelective(invoiceQualifed);
	}
	
}
