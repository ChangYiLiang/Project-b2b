package com.i9he.m2b.manage.controller;

import java.io.IOException;
import java.util.List;

import org.apache.commons.httpclient.HttpException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.i9he.common.config.B2BConstants;
import com.i9he.common.config.MapUtils;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAfterSaleService;
import com.i9he.m2b.manage.biz.IGsService;
import com.i9he.m2b.manage.utils.SysConstant;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.search.AfterSaleSearchModel;

@Controller
@RequestMapping("/controller/afs")
public class AfterSaleController extends AbstractController {
	
	@Autowired
	private IAfterSaleService afterSaleService;
	@Autowired
	private IGsService gsService;
	
	private static Logger logger = LoggerFactory.getLogger(AfterSaleController.class);
	@InitBinder("ConfirmRefundMoney")
	public void initConfirmRefundMoneyBinder(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("refund.");
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView view = new ModelAndView("afs/list.ftl");
		view.addObject("states", MapUtils.wrap(SysConstant.AFS_STATE_MAP));
		view.addObject("types", MapUtils.wrap(SysConstant.AFS_TYPE_MAP));
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = MIME_JSON)
	public String list(AfterSaleSearchModel searchModel) throws I9heException {
		List<AfterSale> list = afterSaleService.searchAfterSale(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, searchModel), "yyyy-MM-dd HH:mm");
	}
	
	@RequestMapping("/details")
	public String details(Integer id, ModelMap map) throws I9heException {
		AfterSale aftersale = afterSaleService.getAfterSale(id);
		List<AfterSaleRecord> records = afterSaleService.getAfterSaleRecords(id);
		map.put("aftersale", aftersale);
		map.put("records", records);
		map.put("states", MapUtils.wrap(SysConstant.AFS_STATE_MAP));
		map.put("types", MapUtils.wrap(SysConstant.AFS_TYPE_MAP));
		return "afs/details.ftl";
	}
	
	@RequestMapping(value = "/details", method = RequestMethod.POST)
	public String details(Integer id) throws I9heException {
		return "redirect:details.do?id=" + id;
	}
	
	@ResponseBody
	@RequestMapping(value = "/process", method = RequestMethod.POST, produces = MIME_JSON)
	public String process(Integer id) throws I9heException {
		AfterSale aftersale = new AfterSale();
		aftersale.setId(id);
		aftersale.setState(B2BConstants.AFS_STATE_PROCESSED);
		afterSaleService.saveAfterSale(aftersale);
		String message = "卖家【同意】本次售后申请";
		afterSaleService.insertAfterSaleRecord(id, message);
		return JSON.toJSONString(true);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/refuse", method = RequestMethod.POST, produces = MIME_JSON)
	public String refuse(Integer id) throws I9heException {
		AfterSale aftersale = new AfterSale();
		aftersale.setId(id);
		aftersale.setState(B2BConstants.AFS_STATE_REFUSED);
		afterSaleService.saveAfterSale(aftersale);
		String message = "卖家【拒绝】本次售后申请";
		afterSaleService.insertAfterSaleRecord(id, message);
		
		AfterSale af = afterSaleService.getAfterSale(id);
		HistoryOrder historyOrder = gsService.findById(af.getOrderId());
		if(historyOrder!=null){
			historyOrder.setStatus(8);
		}
		gsService.update(historyOrder);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancel", method = RequestMethod.POST, produces = MIME_JSON)
	public String cancel(Integer id) throws I9heException {
		AfterSale aftersale = new AfterSale();
		aftersale.setId(id);
		aftersale.setState(B2BConstants.AFS_STATE_CANCEL);
		afterSaleService.saveAfterSale(aftersale);
		String message = "卖家【取消】本次售后申请";
		afterSaleService.insertAfterSaleRecord(id, message);
		return JSON.toJSONString(true);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/confirmMoney", method = RequestMethod.POST, produces = MIME_JSON)
	public String confirmMoney(@ModelAttribute("ConfirmRefundMoney") AfterSaleRefund refund) throws I9heException, HttpException, IOException {
		afterSaleService.saveAfterSaleRefundMoney(refund);
		String message = "卖家【退款】卖家 " + refund.getConfirmRefundMoney() + "元";
		afterSaleService.insertAfterSaleRecord(refund.getAfterSaleId(), message);
		
		AfterSale  afterSale = afterSaleService.getAfterSale(refund.getAfterSaleId());
		
		String result = gsService.returnGoods(afterSale.getOrderId(), refund.getConfirmRefundMoney().toString());
		net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(result);
		logger.info("返回信息[" + json.getString("msg") + "]");
		if (json.getString("msg").equals("success")) {
			HistoryOrder historyOrder = gsService.findById(afterSale.getOrderId());
			if(historyOrder!=null){
				historyOrder.setStatus(6);
			}
			gsService.update(historyOrder);
		}
		return JSON.toJSONString(true);
	}

}
