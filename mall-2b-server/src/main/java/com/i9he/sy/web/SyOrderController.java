package com.i9he.sy.web;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IHistoryOrderService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;
@Controller
@RequestMapping("/order")
public class SyOrderController {
	
	@Autowired
	private SyConfigUtil SyConfigUtil;
	@Autowired
	private IHistoryOrderService IHistoryOrderService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private ISyUserService syUserService;
	 	/**
	 	 * 接收下单通知
	 	 * @param request
	 	 * @return
	 	 * @throws I9heException 
	 	 * @throws NumberFormatException 
	 	 */
	    @ResponseBody
		@RequestMapping("/result")
		public String result(HttpServletRequest request) throws NumberFormatException, I9heException{
			String return1 = request.getParameter("return");
			String id = request.getParameter("id");
			String amount = request.getParameter("amount");
			String balance = request.getParameter("balance");
			String sign = request.getParameter("sign");
			String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),"id="+id);
			if(sign.equals(nowSign)){
				//添加信赊宝下单记录
				HistoryOrder historyOrder = new HistoryOrder();
				historyOrder.setOrderid(Integer.parseInt(id));
				Order order1 = orderBaseApiServcie.getOrderById(historyOrder.getOrderid());
				historyOrder.setUserId(order1.getUserId());
				historyOrder.setOrderTime(new Date());
				historyOrder.setReturnMoney(transferLongToDate(Long.parseLong(return1)));
				historyOrder.setAmount(new BigDecimal(amount));
				historyOrder.setStatus(1);
				int result1 = IHistoryOrderService.insert(historyOrder);
				if(result1>0){
					System.out.println("插入信赊宝订单成功");
				}
				
				//修改用户额度
				Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(id));
				SyUser syUser = syUserService.findByUser(order.getUserId().toString());
				syUser.setBalance(new BigDecimal(balance));
				int result2 = syUserService.update(syUser);
				if(result2>0){
					System.out.println("修改用户额度成功");
				}
				return JSON.toJSONString("success");
			}
			return JSON.toJSONString("validata_error");
		}
	    @ResponseBody
	    @RequestMapping("/sendOrderInfo")
	    public String sendOrderData(HttpServletRequest request){
	    	
	    	String order_info = request.getParameter("order_info");
	    	String phone = request.getParameter("phone");
	    	String sign = request.getParameter("sign");
	    	
	    	String sStr = "order_info="+order_info+"&phone="+phone;
	    	String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
	    	System.out.println("订单参数["+order_info+"]");
	    	System.out.println("加密参数["+sign+"]");
	    	System.out.println("加密信息["+nowSign+"]");
	    	
	    	if(!sign.equals(nowSign)){
	    		return JSON.toJSONString("validata_error");
	    	}
	    	return JSON.toJSONString("success");
	    	
	    }
	    @ResponseBody
	    @RequestMapping("/logistics")
	    public String logisticsInfo(HttpServletRequest request){
	    	
	    	String logisticsno = request.getParameter("logisticsno");
	    	String logisticsname = request.getParameter("logisticsname");
	    	String logisticsstate = request.getParameter("logisticsstate");
	    	String orderno = request.getParameter("orderno");
	    	String goodsno = request.getParameter("goodsno");
	    	String image = request.getParameter("image");
	    	String phone = request.getParameter("phone");
	    	String sign = request.getParameter("sign");
	    	
	    	String sStr = "logisticsno="+logisticsno+"&logisticsname="+logisticsname+"&logisticsname="+logisticsname+"&logisticsstate="+logisticsstate+"&orderno="+orderno+"&image="+image+"&phone="+phone;
	    	String nowSign = SyAESUtil.encrypt(SyConfigUtil.getsKey(),sStr);
	    	System.out.println("商品编号["+goodsno+"]");
	    	System.out.println("加密参数["+sign+"]");
	    	System.out.println("加密信息["+nowSign+"]");
	    	
	    	if(!sign.equals(nowSign)){
	    		return JSON.toJSONString("validata_error");
	    	}
	    	return JSON.toJSONString("success");
	    }
	    
	    public  String transferLongToDate(Long millSec){
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date= new Date(millSec);
	               return sdf.format(date);
	       }

}
