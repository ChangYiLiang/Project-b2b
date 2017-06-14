package com.i9he.m2b.manage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.manage.biz.IInvoiceService;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.search.InvoiceQualifedSearchModel;
import com.i9he.m2b.model.search.InvoiceSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

@Controller
@RequestMapping("/controller/invoice")
public class InvoiceController extends AbstractController{
	
	@Autowired
	private IInvoiceService invoiceService;
	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@RequestMapping("/list")
	public String list() {
		return "invoice/list.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST ,produces = MIME_JSON)
	public String list(InvoiceQualifedSearchModel searchModel) throws I9heException {
		List<InvoiceQualifed> list = invoiceService.getInvoiceQualifed(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, searchModel), "yyyy-MM-dd HH:mm");
	}
	
	@ResponseBody
	@RequestMapping(value = "getinvoice", method = RequestMethod.POST,produces = MIME_JSON)
	public String getInvoice(Integer id, ModelMap map) throws I9heException {
		InvoiceQualifed invoiceQualifed = invoiceService.getInvoiceByid(id);
		map.put("invoiceQua", invoiceQualifed);
		return JSON.toJSONString(map);
	}
	@ResponseBody
	@RequestMapping(value = "review", method = RequestMethod.POST,produces = MIME_JSON)
	public String reviews(InvoiceQualifed invoiceQualifed) throws I9heException {
		Integer res = invoiceService.updateInvoiceQua(invoiceQualifed);
		return JSON.toJSONString(res>0);
	}
	
	@RequestMapping("/listinvo")
	public String listInvo() {
		return "invoice/listInvo.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/listinvo", method = RequestMethod.POST ,produces = MIME_JSON)
	public String listInvo(InvoiceSearchModel searchModel) throws I9heException {
		List<Invoices> list = invoiceService.getInvoice(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, searchModel), "yyyy-MM-dd HH:mm");
	}
	
	@RequestMapping(value="/detailinvo" ,method =RequestMethod.GET)
	public String detailInvoice(Integer invoiceId,ModelMap map) throws I9heException{
		Invoices invoices = invoiceService.getInvoiceByInvoId(invoiceId);
		if(null != invoices){
			//获取财务信息
			Invoice invoice = financialBaseApiService.getInvoiceByOrderId(invoices.getOrderId());
			User user = privilegeBaseApiService.getUserById(invoices.getUserId());
			map.put("invoice", invoice);
			map.put("user", user);
		}
		map.put("invoices", invoices);
		
		return "invoice/detailInvo.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/confirminvoice", method =RequestMethod.POST)
	public String confirmInvoice(Integer invoiceId){
		Integer result = invoiceService.confirmInvoice(invoiceId);
		
		return JSON.toJSONString(result>0);
	}
}
