package com.i9he.m2b.biz.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.ILoanService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.Loan;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.DateUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
import com.i9he.ord.model.Batch;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderAddress;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.User;

@Service("syUrlService")
public class SyUrlService {
	private static Logger logger = LoggerFactory.getLogger(SyUrlService.class);
	
	@Autowired
	private SyConfigUtil syConfigUtil;
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService; 
	
	@Autowired
	private ISyUserService syUserService;
	
	@Autowired
	private ILoanService loanService;
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	@Autowired
	private IGoodsService goodsService;
	
	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	//生成国商注册Url
	public String registerUrl(){
		User user = SessionUtil.getSessionUser();
		if(user!=null){
			Integer id = user.getId();
			String name = user.getUsername();
			String phone = syConfigUtil.getB2bTel();
			String sKey = syConfigUtil.getsKey();
			String content = "id=" + id + "&name=" + name + "&phone=" + phone;
			String sign = SyAESUtil.encrypt(sKey, content);
			String registerUrl = syConfigUtil.getRegisterUrl();
		    String url = registerUrl+"?"+content + "&sign=" + sign; 
		    logger.info("国商注册url["+url+"]");
		    return url;
		}
		return null;
	}
	//生成国商免登url
	public String loginUrl(){
		User user = SessionUtil.getSessionUser();
		if(user!=null){
			String client_id=user.getId().toString();
			SyUser syUser = syUserService.findByUser(client_id);
			   if(syUser!=null){
				   String client_secret=syUser.getUserId();
					String client_name=user.getUsername();
					String redirect_uri=syConfigUtil.getSyUrl();
					String phone=syConfigUtil.getB2bTel();
					String content = "client_id="+client_id+"&redirect_uri="+redirect_uri+"&phone="+phone;
					String sign = SyAESUtil.encrypt("FBW0FNOAoZtRcQr5",content);
					String loginUrl = syConfigUtil.getAcceptUrl(); 
					String url = loginUrl+"?"+content+"&client_secret="+client_secret+"&client_name="+client_name+"&sign="+sign;
					logger.info("国商免登url["+url+"]");
					return url;
			   }
		}
		return null;
		
	}
	
	//生成国商下单url
	public String downOrderUrl(Goods goods,Order order) throws I9heException{
		String order_info = this.orderInfo(goods,order);
		String sKey = syConfigUtil.getsKey();
		String content = "order_info="+order_info;
		String sign = SyAESUtil.encrypt(sKey, content);
		String downOrderUrl = syConfigUtil.getDownOrderUrl();
		String return_url = syConfigUtil.getReturnUrl();
    	String url = downOrderUrl+"?order_info="+order_info+"&return_url="+return_url+"&sign="+sign;
		logger.info("国商下单url["+url+"]");
    	return url;
	}
	//订单数据
	public String orderInfo(Goods goods,Order order) throws I9heException{
		
    	//电商电话
		String b2bTel = syConfigUtil.getB2bTel();
    	
    	//----商品信息
    	JSONObject goods_Info = new JSONObject();
    	//商品品牌-名称
    	goods_Info.put("goodbrand", goods.getGoodsName());
    	//商品数量
    	goods_Info.put("goodcount", 1);
    	//商品Id
    	goods_Info.put("goodid", goods.getId());
    	//商品名称
    	goods_Info.put("goodname", goods.getGoodsName());
    	//商品价格
    	goods_Info.put("goodprice", order.getAmount());
    	//商品类型
    	goods_Info.put("goodtype", "服务器");
    	//是否发生退货
    	goods_Info.put("ifreturn", "否");
    	//订单ID
    	goods_Info.put("orderid", order.getId());
    	//订单时间   
    	goods_Info.put("ordertime", DateUtil.formateDate(order.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
    	//收货数量
    	goods_Info.put("receivecount", 0);
    	//收货时间
    	goods_Info.put("receivetime",null);
    	//发货数量
    	goods_Info.put("sendcount", 0);
    	//发货时间
    	goods_Info.put("sendtime",null);
    	
    	//----订单信息
    	JSONObject order_info = new JSONObject();
    	//收货地址集合
    	OrderAddress orderAddress = this.getOrderAddress(order.getAddressId());
    	
    	//相关电商用户
    	User user = privilegeBaseApiService.getUserById(order.getUserId());
    	//相关信赊宝用户
    	SyUser syUser = syUserService.findByUser(String.valueOf(user.getId())); 
    	
    	//收货地址
    	if(orderAddress!=null){
    		order_info.put("address",orderAddress.getRegionStructure()+" "+orderAddress.getStreetAddress());
    		//收货人姓名
        	order_info.put("consignee", orderAddress.getConsigneeName());
        	//联系人电话
        	order_info.put("phone",orderAddress.getMobile());
    	}else{
    		order_info.put("address","");
    		//收货人姓名
        	order_info.put("consignee","");
        	//联系人电话
        	order_info.put("phone","");
    	}
    	
    	//订单金额
    	order_info.put("amount", order.getAmount());
    	//用户电商ID
    	order_info.put("buserid", order.getUserId());
    	
    	//信赊宝ID
    	order_info.put("euserid", syUser.getUserId());
    	//运费
    	order_info.put("freight", 0);
    	//定单ID
    	order_info.put("orderno", order.getId());
    	//订单时间
    	order_info.put("ordertime",DateUtil.formateDate(order.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
    	//支付方式
    	order_info.put("payway", "信赊宝支付");
    	
    	
    	//商品数组
    	JSONArray dataArr = new JSONArray();
    	dataArr.add(goods_Info);
    	
    	//订单信息
    	Map<String,Object> map = new HashMap<String,Object>();
    	map.put("goods", dataArr);
    	map.put("order_info", order_info);
    	
    	//法人电话
    	map.put("phonenumber",b2bTel);
    	
    	JSONObject orderInfo = new JSONObject();
    	orderInfo.putAll(map);
    	logger.info("订单数据["+orderInfo.toString()+"]");
		return orderInfo.toString();
	}
	//取消订单请求
	public String cancelOrder(Integer orderno){
		String phone=syConfigUtil.getB2bTel();
		String sStr = "orderno="+orderno+"&phone="+phone;
		String sign = SyAESUtil.encrypt(syConfigUtil.getsKey(),sStr);
		try{
        	HttpClient httpclient = new HttpClient();
    		PostMethod post = new PostMethod(syConfigUtil.getCancelorderUrl());
    		post.addRequestHeader("Content-Type",  
                    "application/x-www-form-urlencoded;charset=utf-8"); 
    		post.addParameter("orderno", orderno.toString());
    		post.addParameter("phone", phone);
    		post.addParameter("sign", sign);
    		httpclient.executeMethod(post);
    		String result =new String(post.getResponseBody(),"utf-8");
    		logger.info("取消订单返回信息["+result+"]");
    		return result;
    	}catch(Exception e){
    		logger.info("[ 取消订单时发生错误 ]");
    		return null;
    	}
	}
	//退货请求
	public String returnGoods(Integer orderId,String money) throws I9heException{
		
		Loan loan =  loanService.findByOrderId(orderId);
		SyUser syUser = syUserService.findByUser(loan.getUserId());
		
		String orderno=orderId.toString();
		String orderamount=loan.getOrderamount().toString();
		// 用户退款金额   暂定为订单金额
		String returnamount=money;
		String euserid=syUser.getUserId();
		String phone=syConfigUtil.getB2bTel();
		// 电商同意退货时间  
		String ordertime=DateUtil.formateDateToNum(new Date()).toString();
		//白条ID
		String loanid=loan.getLoanid();
	
		OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
		//退货商品列表
		JSONObject orderGoodsInfo = new JSONObject();
		orderGoodsInfo.put("goodid", orderGoods.getGoodsId());
		orderGoodsInfo.put("returncount", 1);
		JSONArray orderGoodsArr = new JSONArray();
		orderGoodsArr.add(orderGoodsInfo);
		
		
		String sStr = "orderno="+orderno+"&orderamount="+orderamount+"&returnamount="+returnamount+"&euserid="+euserid+"&phone="+phone+"&ordertime="+ordertime+"&loanid="+loanid+"&goods="+orderGoodsArr.toString();
		String sign = SyAESUtil.encrypt(syConfigUtil.getsKey(),sStr);
		try{
			HttpClient httpclient = new HttpClient();
    		PostMethod post = new PostMethod(syConfigUtil.getReturnGoodsUrl());
    		post.addRequestHeader("Content-Type",  
                    "application/x-www-form-urlencoded;charset=utf-8"); 
    		post.addParameter("orderno", orderno);
    		post.addParameter("orderamount",orderamount);
    		post.addParameter("returnamount",returnamount);
    		post.addParameter("euserid",euserid);
    		post.addParameter("phone",phone);
    		post.addParameter("ordertime",ordertime);
    		post.addParameter("loanid",loanid);
    		post.addParameter("goods",orderGoodsArr.toString());
    		post.addParameter("sign",sign);
    		httpclient.executeMethod(post);
    		String result = new String(post.getResponseBody(),"utf-8");
    		logger.info("退货返回信息["+result+"]");
			return result;
		}catch(Exception e){
			logger.error("[退货时发生错误]");
			return null;
			
		}
	}
	//给信赊宝推送订单信息
	public void sendOrderData(Order order,String payType) throws I9heException{
		
		Batch batch =  orderBaseApiServcie.getBatchByOrderId(order.getId());
		
		OrderAddress orderAddress = this.getOrderAddress(order.getAddressId());
		
		User user = privilegeBaseApiService.getUserById(order.getUserId());
		
		SyUser syUser = syUserService.findByUser(user.getId().toString());
		
		JSONObject sendData = new JSONObject();
		if(batch==null){
			OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(order.getId());
			Goods goods = goodsService.selectByPrimaryKey(orderGoods.getGoodsId());
			
			//----商品信息
			JSONObject goodsInfo = new JSONObject();
			goodsInfo.put("brand", goods.getGoodsName());
			// 发货时间    暂时为空
			goodsInfo.put("extm_time", null);
			goodsInfo.put("goods_id", goods.getId());
			goodsInfo.put("goods_name", goods.getGoodsName());
			goodsInfo.put("ok_time", null);
			//订单Id
			goodsInfo.put("order_id", order.getId());
			//下单时间
			goodsInfo.put("order_time", DateUtil.formateDate(order.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
			goodsInfo.put("price", order.getAmount());
			goodsInfo.put("quantity", 1);
			goodsInfo.put("rec_id", null);
			goodsInfo.put("s_quantity", 1);
			goodsInfo.put("tui", "否");
			goodsInfo.put("type", "服务器");
			
			//----用户收货信息
			JSONObject order_Info = new JSONObject();
			
			if(orderAddress!=null){
				order_Info.put("address",  orderAddress.getRegionStructure()+" "+orderAddress.getStreetAddress());
				order_Info.put("consignee",orderAddress.getConsigneeName());
			}else{
				order_Info.put("address", "");
				order_Info.put("consignee", "");
			}
			
			order_Info.put("emall", user.getEmail());
			//发货时间
			order_Info.put("extm_time", null);
			//订单支付时间
			order_Info.put("ok_time", DateUtil.formateDate(order.getPayTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
			//订单金额
			order_Info.put("order_amount", order.getAmount());
			order_Info.put("order_id", order.getId());
			//下单时间
			order_Info.put("order_time",DateUtil.formateDate(order.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
			order_Info.put("pay_name", payType);
			order_Info.put("pay_ok", "已支付");
			order_Info.put("phone_tel", user.getMobile());
			order_Info.put("shangyu_id", syUser.getUserId());
			//电商Id
			order_Info.put("user_id", user.getId());
			
			JSONArray goodsData = new JSONArray();
			JSONArray orderData = new JSONArray();
			
			goodsData.add(goodsInfo);
			orderData.add(order_Info);
			sendData.put("goods", goodsData);
			sendData.put("order", orderData);
			
		}else{
			//获取订单集合
			List<Order> orderlist = orderBaseApiServcie.getOrderListByBatch(batch.getBatchId());
			//保存商品数据集合
			JSONArray goodsData = new JSONArray();
			//保存订单数据集合
			JSONArray orderData = new JSONArray();
			for(Order o :orderlist){
				OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(o.getId());
				Goods goods = goodsService.selectByPrimaryKey(orderGoods.getGoodsId());
				
				//----商品信息
				JSONObject goodsInfo = new JSONObject();
				goodsInfo.put("brand", goods.getGoodsName());
				goodsInfo.put("extm_time", null);
				goodsInfo.put("goods_id", goods.getId());
				goodsInfo.put("goods_name", goods.getGoodsName());
				goodsInfo.put("ok_time", null);
				//订单Id
				goodsInfo.put("order_id", o.getId());
				//下单时间
				goodsInfo.put("order_time", DateUtil.formateDate(o.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
				goodsInfo.put("price", o.getAmount());
				goodsInfo.put("quantity", 1);
				goodsInfo.put("rec_id", null);
				goodsInfo.put("s_quantity", 1);
				goodsInfo.put("tui", "否");
				goodsInfo.put("type", "服务器");
				
				//----用户收货信息
				JSONObject order_Info = new JSONObject();
				
				
				if(orderAddress!=null){
					order_Info.put("address",  orderAddress.getRegionStructure()+" "+orderAddress.getStreetAddress());
					order_Info.put("consignee", orderAddress.getConsigneeName());
				}else{
					order_Info.put("address",  "");
					order_Info.put("consignee", "");
				}
				
				
				
				order_Info.put("emall", user.getEmail());
				//发货时间
				order_Info.put("extm_time", null);
				//订单支付时间
				order_Info.put("ok_time", DateUtil.formateDate(o.getPayTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
				//订单金额
				order_Info.put("order_amount", o.getAmount());
				order_Info.put("order_id", o.getId());
				//下单时间
				order_Info.put("order_time", DateUtil.formateDate(o.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
				order_Info.put("pay_name", payType);
				order_Info.put("pay_ok", "已支付");
				order_Info.put("phone_tel", user.getMobile());
				order_Info.put("shangyu_id", syUser.getUserId());
				//电商Id
				order_Info.put("user_id", user.getId());
				
				goodsData.add(goodsInfo);
				orderData.add(order_Info);
			}
			sendData.put("goods", goodsData);
			sendData.put("order", orderData);
		}
		
		String order_info =  sendData.toString();
		String phone = syConfigUtil.getB2bTel();
		logger.info("推送订单数据["+order_info+"]");
		String sStr = "order_info="+order_info+"&phone="+phone;
		String sign = SyAESUtil.encrypt(syConfigUtil.getsKey(),sStr);
		try{
			HttpClient httpclient = new HttpClient();
    		PostMethod post = new PostMethod(syConfigUtil.getOrderInfoUrl());
    		post.addRequestHeader("Content-Type",  
                    "application/x-www-form-urlencoded;charset=utf-8"); 
    		post.addParameter("order_info", order_info);
    		post.addParameter("phone", phone);
    		post.addParameter("sign", sign);
    		httpclient.executeMethod(post);
    		String result =new String(post.getResponseBody(),"utf-8");
    		logger.info("推送订单信息返回结果["+result+"]");
		}catch(Exception e){
			logger.error("[推送订单信息请求发生错误]");
		}
		
		
	}
	//用户历史数据
	public JSONObject getHistoryOrderData(Integer userId) throws I9heException {

		OrderSearchModel orderSearchModel = new OrderSearchModel();
		orderSearchModel.setUserId(userId);

		List<Order> orderList = orderBaseApiServcie.getB2BOrderBySearch(orderSearchModel);

		JSONObject sendData = new JSONObject();

		// 保存商品数据集合
		JSONArray goodsData = new JSONArray();
		// 保存订单数据集合
		JSONArray orderData = new JSONArray();
		// 保存退货数据记录
		JSONArray returnGoodsData = new JSONArray();
		// 用户数据
		JSONObject userInfo = new JSONObject();

		String name = null;
		
		for (Order o : orderList) {
			if(o.getPayTime()!=null){
				OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(o.getId());
				Goods goods = null;
				if(orderGoods!=null){
					 goods = goodsService.selectByPrimaryKey(orderGoods.getGoodsId());
				}
				OrderAddress orderAddress = this.getOrderAddress(o.getAddressId());

				User user = privilegeBaseApiService.getUserById(o.getUserId());

				SyUser syUser = syUserService.findByUser(user.getId().toString());

				// ----商品信息
				JSONObject goodsInfo = new JSONObject();
				if(orderGoods!=null){
					goodsInfo.put("brand", goods.getGoodsName());
					goodsInfo.put("extm_time", null);
					goodsInfo.put("goods_id", goods.getId());
					goodsInfo.put("goods_name", goods.getGoodsName());
				}else{
					goodsInfo.put("brand",null);
					goodsInfo.put("extm_time", null);
					goodsInfo.put("goods_id", null);
					goodsInfo.put("goods_name", null);
				}
				
				goodsInfo.put("ok_time", null);
				// 订单Id
				goodsInfo.put("order_id", o.getId());
				// 下单时间
				goodsInfo.put("order_time", DateUtil.formateDate(o.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
				goodsInfo.put("price", o.getAmount());
				goodsInfo.put("quantity", 1);
				goodsInfo.put("rec_id", null);
				goodsInfo.put("s_quantity", 1);
				goodsInfo.put("tui", "否");
				goodsInfo.put("type", 1);

				// ----用户收货信息
				JSONObject order_Info = new JSONObject();

				if(orderAddress!=null){
					order_Info.put("address", orderAddress.getRegionStructure() + " " + orderAddress.getStreetAddress());
					order_Info.put("consignee", orderAddress.getConsigneeName());
					name =  orderAddress.getConsigneeName();
				}else{
					order_Info.put("address", "");
					order_Info.put("consignee", "");
				}
				

				order_Info.put("emall", user.getEmail());
				// 发货时间
				order_Info.put("extm_time", null);
				// 订单支付时间
				order_Info.put("ok_time", DateUtil.formateDate(o.getPayTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
				// 订单金额
				order_Info.put("order_amount", o.getAmount());
				order_Info.put("order_id", o.getId());
				// 下单时间
				order_Info.put("order_time",  DateUtil.formateDate(o.getOrderTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));

				// 支付方式

				order_Info.put("pay_name", financialBaseApiService.getInvoiceByOrderId(o.getId()).getPayment());
				order_Info.put("pay_ok", "已支付");
				order_Info.put("phone_tel", user.getMobile());
				order_Info.put("shangyu_id", syUser.getUserId());
				// 电商Id
				order_Info.put("user_id", user.getId());

				goodsData.add(goodsInfo);
				orderData.add(order_Info);

				// 用户退货信息
				// 记录添加时间
				JSONObject return_Info = new JSONObject();
			
				return_Info.put("adddate", null);
				// 变化数量
				return_Info.put("changecount", 1);
		
				return_Info.put("changedate", null);

				return_Info.put("changestate", 1);
				if(orderGoods!=null){
					// 商品ID
					return_Info.put("goodid", goods.getId());
					// 商品名称
					return_Info.put("goodname", goods.getGoodsName());
				}else{
					// 商品ID
					return_Info.put("goodid",null);
					// 商品名称
					return_Info.put("goodname", null);
				}
				
				// 商品价格
				return_Info.put("goodprice", o.getAmount());
				// 申请凭证 TODO暂时为空
				return_Info.put("license", null);
				
				if(orderAddress!=null){
					// 退货人地址
					return_Info.put("returnaddress", orderAddress.getRegionStructure() + " " + orderAddress.getStreetAddress());
					// 退货人姓名
					return_Info.put("returnname", orderAddress.getConsigneeName());
					// 退货人手机
					return_Info.put("returnphone", orderAddress.getMobile());
				}else{
					// 退货人地址
					return_Info.put("returnaddress","");
					// 退货人姓名
					return_Info.put("returnname", "");
					// 退货人手机
					return_Info.put("returnphone", "");
				}
				
				// 子订单编号
				return_Info.put("suborderid", null);
				// 商品类型
				return_Info.put("type", 1);

				returnGoodsData.add(return_Info);
			}
		}

		User u = privilegeBaseApiService.getUserById(userId);
		// 会员电子邮箱
		userInfo.put("emall", u.getEmail());
		// 法人姓名   使用收货时的姓名
		userInfo.put("faren_name", name);
		
		// qq
		userInfo.put("im_qq", u.getQq());
		// 最后登录IP
		userInfo.put("last_ip", u.getLastLoginIp());
		// 最后登录日期
		if(u.getLastLoginTime()==null){
			userInfo.put("last_login", null);	
		}else{
			userInfo.put("last_login", DateUtil.formateDate(u.getLastLoginTime(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
		}
		// 手机号
		userInfo.put("phone", u.getMobile());
		// 注册日期
		userInfo.put("reg_time", DateUtil.formateDate(u.getCreatedDate(),DateUtil.DF_YYYY_MM_DD_HH_MM_SS));
		// 企业用户在电商的id
		userInfo.put("user_id", u.getId());
		// 会员名称
		userInfo.put("user_name", u.getUsername());

		sendData.put("goods", goodsData);
		sendData.put("order", orderData);
		sendData.put("returngoods", returnGoodsData);
		sendData.put("user", userInfo);
		logger.info("信赊宝获取用户历史数据["+sendData.toString()+"]");
		return sendData;

	}
	
	public OrderAddress getOrderAddress(Integer orderId) throws I9heException{
		if(orderId==null){
			return null;
		}else{
			OrderAddress orderAddress =  orderBaseApiServcie.selectOrderAddressById(orderId);	
			return orderAddress;
		}
	}
}
