package com.i9he.m2b.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.captcha.CaptchaServiceSingleton;
import com.i9he.common.config.FinanCanstants;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.RequestUtils;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.IGoodsDetailService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.mapper.Cart2bMapper;
import com.i9he.m2b.model.Cart;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.server.biz.ITrusteeshipService;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.DateUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
import com.i9he.m2b.util.SysConstant;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderDefense;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderServerHire;
import com.i9he.ord.model.OrderTrusteeship;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.Region;
import com.i9he.privilege.model.User;
import com.nr.comm.util.Calculations;

/**
 * 主界面及登录验证相关的控制器
 */
@Security
@Controller
@RequestMapping("/controller/product")
public class OrderProuductAction {

	private static Logger logger = LoggerFactory.getLogger(OrderProuductAction.class);
	private static final String VlidatCodeKey = "pay";	
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private IOrderService orderService;
	@Resource
	private IItemService itemService;
	@Resource
	private ICategoryService categoryService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IGoodsDetailService goodsdetailService;
	@Autowired
	private IWalletService walletService;
	@Autowired
	private ITrusteeshipService trusteeshipService;
	@Autowired
	private IInvoicesService InvoicesService;
	@Autowired
	private SyUrlService syUrlService;
	@Autowired
	private ICartService cartService;
	@Autowired
	private SyConfigUtil syConfigUtil;
	@Autowired
	private Cart2bMapper cartMapper;


	@RequestMapping(value = "/addHardware", method = { RequestMethod.GET, RequestMethod.POST })
	public String getHardwarePay(HttpServletRequest request,String config, String pay, String goodsId, Integer orderCycle,String idlink, String number,Integer trustarea,ModelMap map,String gssy,HttpServletResponse respo) throws I9heException {
		Integer goodsid = Integer.valueOf(goodsId);
		Integer count = Integer.valueOf(number);
		User user = SessionUtil.getSessionUser();
		
		//清空购物车
		cartMapper.updateSubmit(user.getId());
		
		try {
			Goods goods = goodsService.getGoodsByid(goodsid);
			if (goods == null) {
				throw new I9heException("", "商品不存在.");
			}
			// 商品是否是IDC业务
			if (goods.getIfIdc()&&gssy.equals("1")) { // 购买硬件服务+赊账
				// 数据库拿得订单价格来计算
				String id = request.getParameter("idlink");
				double itemPrice = itemService.getTotalPrice(id);
				BigDecimal goodsPrice = BigDecimal.valueOf(itemPrice);
				BigDecimal amount = goods.getGoodsPrice().add(goodsPrice);
				BigDecimal amount1 = new BigDecimal(Calculations.mul(amount.doubleValue(), count.doubleValue()));
				//获取运费(运费占时先设为0)
			    BigDecimal shippingPrice = new BigDecimal(0);
				int orderid = orderService.insertHardware(user, amount1.add(shippingPrice), config, goodsid, count,shippingPrice);
				orderService.insertGoodsItem(id, orderid, count);
				Order order = orderBaseApiServcie.getOrderById(orderid);
				orderService.insertFinancial(user, order, FinanCanstants.TYPE_ORDER);
				//插入机器托管记录
				if(trustarea==0){
					System.out.println("");
				} else {
					Trusteeship Tt = new Trusteeship();
					Tt.setGoodsId(Integer.valueOf(goodsId));
					Tt.setUserId(user.getId());
					Tt.setArea(Integer.valueOf(trustarea));
					Tt.setOrderId(orderid);
					trusteeshipService.insertSelective(Tt);
				}
				//如果gssy=1就是赊账的执行以下操作
//				String url =  syUrlService.downOrderUrl(goods, order);
				String order_info = syUrlService.orderInfo(goods,order);
				String sKey = syConfigUtil.getsKey();
				String content = "order_info="+order_info;
				String sign = SyAESUtil.encrypt(sKey, content);
				String downOrderUrl = syConfigUtil.getDownOrderUrl();
				String return_url = syConfigUtil.getReturnUrl();
				
				map.put("order_info",order_info );
				map.put("sign", sign);
				map.put("return_url", return_url);
				map.put("downOrderUrl", downOrderUrl);
				return "order/downOrder.ftl";
				
				//map.put("orderid", orderid);
				//return "redirect:/controller/product/confirm.do";
				
			} else {//如果硬件订购
				
				Cart cart = new Cart();
				
				cart.setUserId(user.getId());
				cart.setItemIdList(idlink);
				cart.setConfig(config);
				cart.setCycle(orderCycle);
				cart.setGoodsId(goodsid);
				cart.setGoodsNum(count);
				cart.setTrustarea(trustarea);
				cart.setIsSubmit(1);
				cart.setIsDelete(0);
				cart.setCretedDate(DateUtil.getSysDate());
				
				if(goods.getIfIdc()){
					cart.setIsIdc(2);
					double totalPrice = itemService.getTotalPrice(cart.getItemIdList());
					Goods good = goodsService.getGoodsByid(cart.getGoodsId());
					BigDecimal price = good.getGoodsPrice().add(BigDecimal.valueOf(totalPrice));
					BigDecimal amount = new BigDecimal(Calculations.mul(price.doubleValue(), count.doubleValue()));
					cart.setPrice(price);
					cart.setAllprice(amount);
				}else{
					cart.setIsIdc(1);
					//代理托管订单所需要的特定参数
					String id = request.getParameter("idlink");
					int ipflag= Integer.valueOf(request.getParameter("ipflag"));
					int ipnum = Integer.valueOf(request.getParameter("ipnum"));
					//ip个数
					cart.setIpnum(ipnum);
					//配件价格
					BigDecimal itemipPrice= BigDecimal.valueOf(itemService.selectItemByItemId(ipflag).getPrice().longValue()).multiply(new BigDecimal(ipnum-2));//IP的价格 
					BigDecimal itemAllPrice = BigDecimal.valueOf(itemService.getTotalPrice(id)).add(itemipPrice);
					//单价
					BigDecimal goodsPrice = BigDecimal.valueOf(goods.getGoodsPrice().longValue()).add(itemAllPrice).multiply(new BigDecimal(orderCycle));
					cart.setPrice(goodsPrice);
					//总价
					BigDecimal AllPrice = goodsPrice.multiply(new BigDecimal(count));
					cart.setAllprice(AllPrice);
				}
				cartMapper.insertSelective(cart);
				return "redirect:/cart/paycart.do";
			}
		} catch (I9heException e) {
			logger.error("订购商品出现异常");
			throw new I9heException(MallErroCode.MALL_HARDWARE_INSERT_ERRO, "订购商品出现异常", e);
		}
	}

	@RequestMapping(value="confirm")
	public String confirm(Integer orderid,ModelMap map) throws I9heException{
		try{
		User user = SessionUtil.getSessionUser();
		Order order = orderBaseApiServcie.getOrderById(orderid);
		if (user.getId().equals(order.getUserId())) {
			List<Address> list = privilegeBaseApiService.getAddressByUserId(user.getId());
		    Address address = new Address();
		    for(Address a: list){
		    	if(a.getIsMain()){
		    		address = a;
		    	}
		    }
		    OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderid);
		    Goods goods = goodsService.getGoodsByid(orderGoods.getGoodsId());
		    //计算总价和所支付的金额(单价*数量-优惠)
		    BigDecimal allPrice = (orderGoods.getOrigAmount().subtract(orderGoods.getDiscount()));
		    //获取运费(运费占时先设为0)
		    BigDecimal shippingPrice = new BigDecimal(0);
		    BigDecimal payMoney = allPrice.add(shippingPrice);
		    if(shippingPrice != null){
		    	 map.put("shippingPrice", shippingPrice.toString());
		    }
		    if(allPrice !=null){
		    	map.put("allPrice", allPrice.toString());
		    }
		    if(payMoney !=null){
		    	map.put("payMoney", payMoney.toString());
		    }
		    map.put("order", order);
		    map.put("address", address);
		    map.put("goods", goods);
		    map.put("orderGoods", orderGoods);
		    return "order/toconfirm.ftl";
		}else{
			return "404.ftl";
		}
		}catch(Exception e){
			logger.error("确认支付跳转异常");
			throw new I9heException("", "确认支付跳转异常", e);
		}
	}
	
	/***验证码*/
	@RequestMapping("/validcode")
	public String validcodeImages(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CaptchaServiceSingleton.getInstance().writeCaptchaImage(request, response, VlidatCodeKey);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="/check",method=RequestMethod.POST)
	public String validata(HttpServletRequest request,String validcode,HttpServletResponse resposne){
		HttpSession session = request.getSession();
		final CaptchaServiceSingleton captachService = CaptchaServiceSingleton.getInstance();
		if (!captachService.validateCaptchaResponse(validcode, session, VlidatCodeKey)) {
			return JSON.toJSONString(false);
		}
		return JSON.toJSONString(true);
	}
	
	@RequestMapping(value = "/topay")
	public String topay(Integer orderId, Integer type,ModelMap map, HttpServletRequest request,String zzfpId,String who,String mx1,String remark) throws I9heException, UnsupportedEncodingException {
		User user = SessionUtil.getSessionUser();
		Order order = orderBaseApiServcie.getOrderById(orderId);
		// 支付过的订单
		if (order.getState() != 0) {
			return "error.ftl";
		}
		if (user.getId().equals(order.getUserId())) {
			List<Address> list = privilegeBaseApiService.getAddressByUserId(user.getId());
			Address address = new Address();
			for (Address a : list) {
				if (a.getIsMain()) {
					address = a;
				}
			}
			
			//不是代理托管订单的就插入收货地址
			if(type!=IOrderBaseApiServcie.TYPE2_AGENT){
				Order neworder = new Order();
				neworder.setId(order.getId());
				neworder.setAddressId(address.getId());
				orderBaseApiServcie.updateOrder(neworder);
			}

//			OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(id);
//			Goods goods = goodsService.getGoodsByid(orderGoods.getGoodsId());
//			BigDecimal allPrice = order.getAmount();
			// 获取运费(运费占时先设为20)
//			Wallet wallet = walletService.findByUserId();
//			if (null != wallet) {
//				money = wallet.getMoney().toString();
//			}
//			BigDecimal shippingPrice = new BigDecimal(0);
//			BigDecimal payMoney = allPrice;
//			String money = null;
//			if(payMoney != null){
//				map.put("payMoney", payMoney.toString());
//			}
//			map.put("money", money);
//			map.put("order", order);
//			map.put("address", address);
//			map.put("goods", goods);
//			map.put("orderGoods", orderGoods);
			if(remark==null){
				remark="";
			}
			
			remark=new String (remark.getBytes("iso8859-1"),"utf-8");
			Invoices invoices = new Invoices();
			if(zzfpId==null || zzfpId.equals("")){
				who=new String (who.getBytes("iso8859-1"),"utf-8");
				mx1=new String (mx1.getBytes("iso8859-1"),"utf-8");
				invoices.setContent(mx1);
				invoices.setUserId(user.getId());
				invoices.setCreatedTime(new Date());
				invoices.setHeader(who);
				invoices.setRemark(remark);
				invoices.setOrderId(orderId);
				invoices.setType(0);
				InvoicesService.insert(invoices);
				
			}else{
				InvoiceQualifed invoiceQualifed =InvoicesService.findById(zzfpId);
				invoices.setBank(invoiceQualifed.getBank());
				invoices.setBankAccount(invoiceQualifed.getBankAccount());
				invoices.setCreatedTime(new Date());
				invoices.setOrderId(orderId);
				invoices.setOrganization(invoiceQualifed.getOrganization());
				invoices.setRegistAddress(invoiceQualifed.getRegistAddress());
				invoices.setRemark(remark);
				invoices.setRegistPhone(invoiceQualifed.getRegistPhone());
				invoices.setType(1);
				invoices.setUserId(invoiceQualifed.getUserId());
				invoices.setUserIdcode(invoiceQualifed.getUserIdcode());
				InvoicesService.insert(invoices);
			}
			return "redirect:/cart/topay.do?orderId=" + orderId;
			//return "order/topay.ftl";
		} else {
			return "404.ftl";
		}

	}
	
	@RequestMapping("/success")
	public String success() {
		return "order/success.ftl";
	}
	
	
//	@RequestMapping(value = "{orderid}/payMethod", produces = "text/plain;charset=UTF-8")
//	public ModelAndView toPayMethod(HttpServletRequest request, Model model, @PathVariable String orderid) throws I9heException {
//		try {
//			if (Calculations.isNumber(orderid)) {
//				User user = SessionUtil.getSessionUser(request);
//				Integer orderId = Integer.parseInt(orderid);
//				Order order = orderBaseApiServcie.getOrderById(orderId);
//				if (user.getId().equals(order.getUserId())) {
//					if (!orderId.equals(0) && !orderId.equals("")) {
//						model.addAttribute("order", order);
//						model.addAttribute("address", privilegeBaseApiService.getAddressByUserId(user.getId()));
//						OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
//						model.addAttribute("orderGoods", orderGoods);
//						model.addAttribute("goods", goodsService.getGoodsByid(orderGoods.getGoodsId()));
//						model.addAttribute("ORDER_STATUS_MAP", SysConstant.ORDER_STATUS_MAP);
//						model.addAttribute("ORDER_TYPE2_MAP", SysConstant.ORDER_TYPE2_MAP);
//						model.addAttribute("ORDER_ORDERCYCLE_MAP", SysConstant.ORDER_ORDERCYCLE_MAP);
//						List<Region> regions = privilegeBaseApiService.getprovince();
//						model.addAttribute("regions", regions);
//						switch (order.getType2()) {
//						case IOrderBaseApiServcie.TYPE2_HARDWARE:
//							model.addAttribute("items", orderService.getOrderItem(orderId));
//							break;
//						case IOrderBaseApiServcie.TYPE2_HIRE:
//							model.addAttribute("orderdetail", orderBaseApiServcie.getOrderServerHireById(orderId));
//							break;
//						case IOrderBaseApiServcie.TYPE2_TRUSTEESHIP:
//							model.addAttribute("orderdetail", orderBaseApiServcie.getOrderTrusteeshipById(orderId));
//							break;
//						case IOrderBaseApiServcie.TYPE2_DEFENSE:
//							model.addAttribute("orderdetail", orderBaseApiServcie.getOrderDefense(orderId));
//							break;
//						case IOrderBaseApiServcie.TYPE2_DUBBO_DEFENSE:
//							break;
//						default:
//							throw new I9heException("", "IDC商品类别不存在");
//						}
//						return new ModelAndView("product/payMethod.ftl");
//					}
//				}
//			}
//		} catch (Exception e) {
//			logger.error("支付方式跳转异常");
//			throw new I9heException(MallErroCode.MALL_TO_PAY_ERRO, "支付方式跳转异常", e);
//		}
//		// 这里是异常页面
//		return new ModelAndView("404.ftl");
//	}

//	/**
//	 * 到支付宝支付
//	 * 
//	 * @param request
//	 * @param orderId
//	 * @param att
//	 * @return
//	 * @throws I9heException
//	 */
//	@RequestMapping(value = "alipay", produces = "text/plain;charset=UTF-8")
//	public ModelAndView toAlipay(HttpServletRequest request, @RequestParam String orderId, RedirectAttributes att, HttpServletResponse response) throws I9heException {
//		try {
//			if (Calculations.isNumber(orderId)) {
//				User user = SessionUtil.getSessionUser(request);
//				int orderid = Integer.parseInt(orderId);
//				Order order = orderBaseApiServcie.getOrderById(orderid);
//				if (user.getId().equals(order.getUserId())) {
//					if (order.getType1().equals(IOrderBaseApiServcie.TYPE1_HARDWARE)) {
//						String addressId = request.getParameter("addressId");
//						if (StringUtil.isExist(addressId)) {
//							Address ad = privilegeBaseApiService.getAddrressById(Integer.parseInt(addressId));
//							OrderAddress oa = new OrderAddress();
//							oa.setConsigneeName(ad.getConsigneeName());
//							oa.setMobile(ad.getMobile());
//							oa.setPhone(ad.getPhone());
//							oa.setPostcode(ad.getPostcode());
//							oa.setOrderId(orderid);
//							oa.setType(0);
//							oa.setRegionStructure(ad.getRegionStructure());
//							oa.setStreetAddress(ad.getStreetAddress());
//							orderBaseApiServcie.insertOrderAddress(oa);
//							order.setUpdatedDate(DateUtil.getSysDate());
//							// 提醒发货
//							orderBaseApiServcie.updateOrder(order);
//						}
//					}
//					Invoice invoice = financialBaseApiService.getInvoiceByOrderId(orderid);
//					att.addFlashAttribute("credit", 0.0);
//					att.addFlashAttribute("invoiceId", invoice.getId());
//					return new ModelAndView("redirect:/controller/alipay/pay.do");
//				}
//				return new ModelAndView("404.ftl");// 错误页面
//			}
//			return new ModelAndView("404.ftl");// 错误页面
//		} catch (Exception e) {
//			logger.error("订单id" + orderId + "跳转支付宝异常");
//			throw new I9heException(MallErroCode.MALL_TO_APILYPAY_ERRO, "订单id" + orderId + "跳转支付宝异常", e);
//		}
//	}

//	@ResponseBody
//	@RequestMapping(value = "linepay", produces = "text/plain;charset=UTF-8")
//	public String linePay(HttpServletRequest request, String orderId, Invoice invoice) throws I9heException {
//		try {
//			if (Calculations.isNumber(orderId)) {
//				User user = SessionUtil.getSessionUser(request);
//				int orderid = Integer.parseInt(orderId);
//				Order order = orderBaseApiServcie.getOrderById(orderid);
//				if (user.getId().equals(order.getUserId())) {
//					if (order.getType1().equals(IOrderBaseApiServcie.TYPE1_HARDWARE)) {
//						String addressId = request.getParameter("address");
//						if (StringUtil.isExist(addressId)) {
//							Address ad = privilegeBaseApiService.getAddrressById(Integer.parseInt(addressId));
//							OrderAddress oa = new OrderAddress();
//							oa.setConsigneeName(ad.getConsigneeName());
//							oa.setMobile(ad.getMobile());
//							oa.setPhone(ad.getPhone());
//							oa.setPostcode(ad.getPostcode());
//							oa.setOrderId(orderid);
//							oa.setType(0);
//							oa.setRegionStructure(ad.getRegionStructure());
//							oa.setStreetAddress(ad.getStreetAddress());
//							orderBaseApiServcie.insertOrderAddress(oa);
//						}
//					}
//					order.setUpdatedDate(DateUtil.getSysDate());
//					order.setState(IOrderBaseApiServcie.PAYING);
//					// 提醒发货
//					orderBaseApiServcie.updateOrder(order);
//					Invoice invoice1 = financialBaseApiService.getInvoiceByOrderId(orderid);
//					invoice1.setUpdateDate(DateUtil.getSysDate());
//					invoice1.setBankMoney(invoice.getBankMoney());
//					invoice1.setBankNumber(invoice.getBankNumber());
//					invoice1.setReceiptTime(invoice.getReceiptTime());
//					invoice1.setInvoiceNum(invoice.getInvoiceNum());
//					invoice1.setPayBank(invoice.getPayBank());
//					invoice1.setPayment(invoice.getPayment());
//					invoice1.setPayName(invoice.getPayName());
//					invoice1.setClientRemark(invoice.getClientRemark());
//					financialBaseApiService.updateInvoice(invoice1);
//					return ConstantUtil.Success;
//				}
//				return ConstantUtil.Fail;// 错误页面
//			}
//			return ConstantUtil.Fail;// 错误页面
//		} catch (Exception e) {
//			logger.error("订单id" + orderId + "线下支付出现异常");
//			throw new I9heException(MallErroCode.MALL_TO_LINEPAY_ERRO, "订单id" + orderId + "线下支付出现异常", e);
//		}
//	}

//	/**
//	 * 线下支付完成 去用户中心页面
//	 * 
//	 * @return
//	 */
//	@RequestMapping(value = "goCenter")
//	public ModelAndView toCenteruser() {
//		return new ModelAndView("main.ftl");
//	}

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	// 获得所有省级单位
	@RequestMapping(value = "/getprovince")
	public @ResponseBody
	List<Region> threelinkage() throws I9heException {
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return regions;
	}

	// 根据父级查找下级城市
	@RequestMapping(value = "/city")
	public @ResponseBody
	Map<Integer, String> getCity(String address1) throws I9heException {
		// List<Region> citys=privilegeBaseApiService.getCity(parentId);
		// return JsonUtil.convertObj2json(citys).toString();
		List<Region> regions = privilegeBaseApiService.getCity(address1);
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return map;
	}

	// 根据父级查找下级城市
	@RequestMapping(value = "/city1")
	public @ResponseBody
	Map<Integer, String> getCity1(String address2) throws I9heException {
		// List<Region> citys=privilegeBaseApiService.getCity(parentId);
		// return JsonUtil.convertObj2json(citys).toString();
		List<Region> regions = privilegeBaseApiService.getCity(address2);
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return map;
	}

	@RequestMapping(value = "addaddress", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String creatAddress(HttpServletRequest request, String address1, String address2, String address3, Address address) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		Long atotal = privilegeBaseApiService.getTotalAddressByUserid(user.getId());
		if (atotal >= ParaConstants.MAXADDRESSNUMBER) {
			return ConstantUtil.AJAX_FALSE;
		}
		if (privilegeBaseApiService.creatAddress(address1, address2, address3, address, user.getId(), atotal)) {
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}

	@ResponseBody
	@RequestMapping(value = "deleteaddress", produces = "text/plain;charset=UTF-8")
	public String deleteAddress(HttpServletRequest request, String deaddress) throws I9heException {
		try {

			privilegeBaseApiService.deleteAddress(Integer.parseInt(deaddress));
			return ConstantUtil.Success;
		} catch (I9heException e) {
			logger.error("删除地址Id" + deaddress + "出现异常");
			throw new I9heException(MallErroCode.MALL_ADDRESS_DELECT_ERRO, "删除地址Id" + deaddress + "出现异常", e);
		}
	}

	// @ResponseBody
	// @RequestMapping(value="/addRenew"
	// ,method={RequestMethod.GET,RequestMethod.POST})
	// public ModelAndView addRenew(HttpServletRequest
	// request,HttpServletResponse respon,String id)
	// throws I9heException{
	// if(Calculations.isNumber(id)){
	//
	// User user = SessionUtil.getSessionUser(request);
	//
	// int newOrderRenewId =
	// orderService.addOrdeRenew(Integer.parseInt(id),user);
	// return new
	// ModelAndView("redirect:"+configUtil.getBasePath()+"/controller/product/"+newOrderRenewId+"/payMethod.do");
	// }else{
	// return new ModelAndView("product/pay.ftl");//错误页面
	// }
	// }

	// @ResponseBody
	// @RequestMapping(value="/addUpServer"
	// ,method={RequestMethod.GET,RequestMethod.POST})
	// public ModelAndView addUpServer(HttpServletRequest
	// request,HttpServletResponse respon,String id,String
	// itemId,RedirectAttributes att)
	// throws I9heException{
	// if(Calculations.isNumber(id)){
	// User user = SessionUtil.getSessionUser(request);
	// int invoiceId =
	// orderService.addUpServer(Integer.parseInt(id),user,itemId);
	// att.addFlashAttribute("credit", 0.0);
	// att.addFlashAttribute("invoiceId", invoiceId);
	// return new
	// ModelAndView("redirect:"+configUtil.getBasePath()+"/controller/alipay/pay.do");
	// }else{
	// return new ModelAndView("product/pay.ftl");//错误页面
	// }
	// }
	
	@ResponseBody
	@RequestMapping("/f5")
	public String state(String orderId,HttpServletRequest request) throws NumberFormatException, I9heException {
		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
		return JSON.toJSONString(order.getState().toString());

	}
	@ResponseBody
	@RequestMapping("/isMain")
	public String isMain() throws I9heException{
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Address> list = privilegeBaseApiService.getAddressByUserId(userId);
		for (Address a : list) {
			if (a.getIsMain()) {
				return JSON.toJSONString(true);
			}
		}
		return JSON.toJSONString(false);
	}
	
	@ResponseBody
	@RequestMapping("/ispw")
	public String isPassword(){
		
	    Wallet wallet = walletService.findByUserId();
	    if(wallet!=null){
	    	if(wallet.getPassword()!=null){
	    		return JSON.toJSONString(true);
	    	}
	    }
		return  JSON.toJSONString(false);
	}

}