package com.i9he.sy.web;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IHistoryOrderService;
import com.i9he.m2b.biz.ILoanService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.Loan;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.nr.comm.util.DateUtil;
@Controller
@RequestMapping("/toMoney")
public class SyToMoneyController {
	@Autowired
	private SyConfigUtil SyConfigUtil;
	@Autowired
	private ILoanService loanService;
	@Autowired
	private IHistoryOrderService historyOrderService;
	@Autowired
	private ISyUserService syUserService;
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	private static Logger logger = LoggerFactory.getLogger(SyToMoneyController.class);
	@ResponseBody
	@RequestMapping("/to")
	public String to(HttpServletRequest request) throws ParseException{
		
		String orderid = request.getParameter("orderid");
		String orderamount = request.getParameter("orderamount");
		String ordertime = request.getParameter("ordertime");
		String buserid = request.getParameter("buserid");
		String loanid = request.getParameter("loanid");
		String state = request.getParameter("state");
		String sign = request.getParameter("sign");
		logger.info("参数信息 ["+orderid+" "+orderamount+" "+ordertime+" "+ buserid+" "+loanid+" "+state+" ]");
		
		//orderid=**&orderamount=**&ordertime=**&buserid=**&loanid=**
		String sStr = "orderid="+orderid+"&orderamount="+orderamount+
				"&ordertime="+ordertime+"&buserid="+buserid+"&loanid="+loanid;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		if(!sign.equals(nowSign)){
			return JSON.toJSONString("validata_error");
		}
		Loan loan = new Loan();
		loan.setCreateTime(new Date());
		loan.setOrderid(Integer.parseInt(orderid));
		loan.setOrderamount(new BigDecimal(orderamount));
		loan.setOrdertime(DateUtil.parseDate(ordertime));
		loan.setUserId(buserid);
		loan.setLoanid(loanid);
		loan.setState(Byte.valueOf(state));
		
		HistoryOrder historyOrder = new HistoryOrder();
		historyOrder.setOrderid(Integer.parseInt(orderid));
		//放款中
		historyOrder.setStatus(2);
		historyOrderService.update(historyOrder);
		
		int result1 = loanService.insert(loan);
		if(result1>0){
			System.out.println("插入放款记录成功");
			return JSON.toJSONString("success");
		}
		System.out.println("插入放款记录异常");
		return JSON.toJSONString("success");
	}
	
	@ResponseBody
	@RequestMapping("/success")
	public String success(HttpServletRequest request) throws I9heException{
		
		String orderid = request.getParameter("orderid");
		String orderamount = request.getParameter("orderamount");
		String ordertime = request.getParameter("ordertime");
		String buserid = request.getParameter("buserid");
		String loanid = request.getParameter("loanid");
		String state = request.getParameter("state");
		String sign = request.getParameter("sign");
		System.out.println("参数信息 ["+orderid+" "+orderamount+" "+ordertime+" "+ buserid+" "+loanid+" "+state+" ]");
		
		String sStr = "orderid="+orderid+"&orderamount="+orderamount+
				"&ordertime="+ordertime+"&buserid="+buserid+"&loanid="+loanid;
		
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		if(!sign.equals(nowSign)){
			System.out.println("签名验证异常");
			return JSON.toJSONString("validata_error");
		}
		HistoryOrder historyOrder1 = historyOrderService.findByOrderId(Integer.parseInt(orderid));
		if(historyOrder1==null){
			System.out.println("请求订单错误");
			return JSON.toJSONString("error");
		}else{
			HistoryOrder historyOrder = new HistoryOrder();
			historyOrder.setOrderid(Integer.parseInt(orderid));
			historyOrder.setGetmoneytime(new Date());
			historyOrder.setStatus(3);
			int count =  historyOrderService.update(historyOrder);
			if(count>0){
				System.out.println("修改放款状态成功");
				Order order = new Order();
				order.setId(Integer.parseInt(orderid));
				order.setState(6);
				orderBaseApiServcie.updateOrder(order);
				return JSON.toJSONString("success");
			}
		}
		System.out.println("修改放款状态失败");
		return JSON.toJSONString("error");
		
		
	}
	@ResponseBody
	@RequestMapping("/repay")
	public String repay(HttpServletRequest request) throws NumberFormatException, I9heException{
		String id = request.getParameter("id");
		String amount = request.getParameter("amount");
		String time = request.getParameter("time");
		String balance = request.getParameter("balance");
		String sign = request.getParameter("sign");
		String sStr = "id="+id+"&amount="+amount+"&time="+time+"&balance="+balance;
		String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
		
		if(!nowSign.equals(sign)){
			return JSON.toJSONString("validata_error");
		}
		HistoryOrder historyOrder = historyOrderService.findByOrderId(Integer.parseInt(id));
		historyOrder.setTomoney(new Date());
		historyOrder.setStatus(4);
		int result1 = historyOrderService.update(historyOrder);
		if(result1>0){
			System.out.println("信赊宝还款成功");
		}
		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(id));
		SyUser syUser =syUserService.findByUser(order.getUserId().toString());
		syUser.setBalance(new BigDecimal(balance));
		int result = syUserService.update(syUser);
		if(result>0){
			System.out.println("修改用户额度成功");
		}
		return JSON.toJSONString("success");
		
	}

}
