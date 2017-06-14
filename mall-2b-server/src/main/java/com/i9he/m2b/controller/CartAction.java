package com.i9he.m2b.controller;

import static com.i9he.m2b.util.SysConstant.wrap;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.i9he.common.alipay.AlipayDirectModel;
import com.i9he.common.captcha.CaptchaServiceSingleton;
import com.i9he.common.config.B2BConstants;
import com.i9he.common.config.FinanCanstants;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.common.jdpay.JDPayModel;
import com.i9he.common.jdpay.JDPayQueryModel;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.biz.IGoodsItemService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.biz.IItemcategoryService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.biz.model.CartViewModel;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.mapper.BusinessMapper;
import com.i9he.m2b.mapper.BusinessTrusteeshipMapper;
import com.i9he.m2b.mapper.TruDatacenterMapper;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.Cart;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsItem;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.TruDatacenter;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.server.biz.ITrusteeshipService;
import com.i9he.m2b.server.controller.PayController;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.StringUtil;
import com.i9he.m2b.util.SyAESUtil;
import com.i9he.m2b.util.SyConfigUtil;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderAddress;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderTrusteeship;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.Region;
import com.i9he.privilege.model.User;
import com.nr.comm.util.Calculations;
import com.nr.comm.util.DateUtil;

/**
 * 主界面及登录验证相关的控制器
 */
@Security
@Controller
@RequestMapping("/cart")
public class CartAction {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");

	private static final String VlidatCodeKey = "payCart";
	@Autowired
	private ICartService cartService;
	@Resource
	private IGoodsService goodsService;
	// @Autowired
	// private IBusinessBaseApiService BusinessBaseApiService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IWalletService walletService;

	@Autowired
	private userBalance2bMapper userbalanceMapper;
	@Autowired
	private BusinessMapper businessmapper;
	@Autowired
	private BusinessTrusteeshipMapper businesstrusteeshipmapper;

	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	@Autowired
	private IInvoicesService InvoicesService;
	@Autowired
	private ISyUserService syUserService;
	@Autowired
	private SyUrlService syUrlService;
	@Autowired
	private IOrderService orderService;
	@Resource
	private IItemService itemService;
	@Autowired
	private SyConfigUtil syConfigUtil;
	@Autowired
	private ITrusteeshipService trusteeshipService;
	@Autowired
	private TruDatacenterMapper trustmapper;
	@Resource
	private IGoodsItemService goodsitemService;
	@Autowired
	private IItemcategoryService itemscategoryService;
	
	@ResponseBody
	@RequestMapping("/deletemycart")
	public String deletecart(Integer id, String ids) throws I9heException {
		User user = SessionUtil.getSessionUser();
		if (null != id) {
			Cart ca = cartService.selectCartById(id);
			if (ca.getUserId().equals(user.getId())) {
				ca.setIsDelete(1);
				cartService.updateCart(ca);
				return JSON.toJSONString(true);
			}
		} else if (null != ids) {
			String idarray[] = ids.split(",");
			for (String i : idarray) {
				Cart ca = cartService.selectCartById(Integer.parseInt(i));
				if (ca.getUserId().equals(user.getId())) {
					ca.setIsDelete(1);
					cartService.updateCart(ca);
				} else {
					return JSON.toJSONString(false);
				}
			}
			return JSON.toJSONString(true);
		}
		return JSON.toJSONString(false);
	}

	@ResponseBody
	@RequestMapping("/updatenum")
	public String updateNum(Cart cart) throws I9heException {
		User user = SessionUtil.getSessionUser();
		Cart ca = cartService.selectCartById(cart.getId());
		if (ca.getUserId().equals(user.getId())) {
			ca.setGoodsNum(cart.getGoodsNum());
			BigDecimal num = new BigDecimal(cart.getGoodsNum().toString());
			ca.setAllprice(num.multiply(ca.getPrice()));
			cartService.updateCart(ca);
			return JSON.toJSONString(true);
		}
		return JSON.toJSONString(false);
	}
	
	/**
	 * 进入购物车
	 * @param model
	 * @return
	 * @throws I9heException
	 */
	@RequestMapping("/mycart")
	public String goMyCart(ModelMap model) throws I9heException {
		User user = SessionUtil.getSessionUser();
		List<Cart> cart = cartService.getCartByUserid(user.getId());
		List<CartViewModel> ca = new ArrayList<CartViewModel>();
		if (cart != null && cart.size() > 0) {
			for (Cart c : cart) {
				// 设置商品为未提交
				c.setIsSubmit(0);
				cartService.updateCart(c);
				CartViewModel cart1 = new CartViewModel(c);
				Goods goods = goodsService.getGoodsByid(c.getGoodsId());
				cart1.setConfig(c.getConfig());
				if (goods != null) {
					cart1.setGoodsName(goods.getGoodsName());
					cart1.setImg(goods.getGoodsImg());
				}
				ca.add(cart1);
			}
		}
		model.put("cartList", ca);
		return "order/mycart.ftl";
	}

	/*** 提交跳转前更新购物车 */
	@ResponseBody
	@RequestMapping("/updatecart")
	public String updateCart(String ids) throws I9heException {
		User user = SessionUtil.getSessionUser();
		String[] idarray = ids.split(",");
		for (String id : idarray) {
			Cart ca = cartService.selectCartById(Integer.parseInt(id));
			if (ca.getUserId().equals(user.getId())) {
				ca.setIsSubmit(1);
				cartService.updateCart(ca);
			} else {
				return JSON.toJSONString(false);
			}
		}
		return JSON.toJSONString(true);
	}
	/**
	 * 确认提交订单页面
	 * @param model
	 * @return
	 * @throws I9heException
	 */
	@RequestMapping(value = "/paycart")
	public String goPayCart(ModelMap model) throws I9heException {
		User user = SessionUtil.getSessionUser();
		List<Cart> cart = cartService.getCartByUserid(user.getId());
		List<CartViewModel> ca = new ArrayList<CartViewModel>();
		// 用户默认收货地址
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Address> list = privilegeBaseApiService.getAddressByUserId(userId);
		Address address = new Address();
		for (Address a : list) {
			if (a.getIsMain()) {
				address = a; break;
			}
		}
		BigDecimal sum=new BigDecimal(0);
		int flag = 0 ;
		if (cart != null && cart.size() > 0) {
			for (Cart c : cart) {
				if (c.getIsSubmit() == 1) {
					sum = sum.add(c.getAllprice());
					CartViewModel cart1 = new CartViewModel(c);
					Goods goods = goodsService.getGoodsByid(c.getGoodsId());
					cart1.setConfig(c.getConfig());
					if(c.getIsIdc() == 2){
						int g = 1;
						flag += g;
					}
					if (goods != null) {
						cart1.setGoodsName(goods.getGoodsName());
						cart1.setImg(goods.getGoodsImg());
						BigDecimal expressfee = cartService.getExpressfee(c.getGoodsId(),c.getGoodsNum(),address);
						cart1.setExpressfee(expressfee);
						sum = sum.add(expressfee);
					}
					ca.add(cart1);
				}
			}
		}
		
		model.put("Allprice", String.valueOf(sum));
		model.put("address", address);
		model.put("list", list);
		model.put("cartList", ca);
		model.put("flag", flag);
		return "order/confirm.ftl";
	}

	// 获得所有省级单位
	@RequestMapping(value = "/getprovince", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String threelinkage() throws I9heException {
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}

	// 根据父级查找下级城市
	@RequestMapping(value = "/city", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getCity(String parentId) throws I9heException {
		List<Region> regions = privilegeBaseApiService.getCity(parentId);
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}
	
	@RequestMapping(value = "addaddress", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String creatAddress(HttpServletRequest request, String address1,
			String address2, String address3, Address address)
			throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		Long atotal = privilegeBaseApiService.getTotalAddressByUserid(user
				.getId());
		if (atotal >= ParaConstants.MAXADDRESSNUMBER) {
			return ConstantUtil.AJAX_FALSE;
		}
		if (privilegeBaseApiService.creatAddress(address1, address2, address3,
				address, user.getId(), atotal)) {
			return JSON.toJSONString("success");
		}
		return ConstantUtil.Fail;
	}

	@ResponseBody
	@RequestMapping(value = "deleteaddress", produces = "text/plain;charset=UTF-8")
	public String deleteAddress(HttpServletRequest request, String deaddress)
			throws I9heException {
		try {

			privilegeBaseApiService.deleteAddress(Integer.parseInt(deaddress));
			return ConstantUtil.Success;
		} catch (I9heException e) {
			logger.error("删除地址Id" + deaddress + "出现异常");
			throw new I9heException(MallErroCode.MALL_ADDRESS_DELECT_ERRO,
					"删除地址Id" + deaddress + "出现异常", e);
		}
	}
	
	/***设置默认地址*/
	@ResponseBody
	@RequestMapping(value = "setMainAddress", produces = "text/plain;charset=UTF-8")
	public String setMainAddress(Integer id) throws I9heException {
			Address address = privilegeBaseApiService.getAddrressById(id);
			if(null != address){
				if(address.getUserId().equals(SessionUtil.getSessionUser().getId())){
					Boolean result = privilegeBaseApiService.setAddressDef(id);
					
					return JSON.toJSONString(result);
				}else{
					return JSON.toJSONString(false);
				}
			}else{
				return JSON.toJSONString(false);
			}
	}

	@RequestMapping("/validcode")
	public String validcodeImages(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CaptchaServiceSingleton.getInstance().writeCaptchaImage(request,
				response, VlidatCodeKey);
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String validata(HttpServletRequest request, String validcode,
			HttpServletResponse resposne) {
		HttpSession session = request.getSession();
		final CaptchaServiceSingleton captachService = CaptchaServiceSingleton
				.getInstance();
		if (!captachService.validateCaptchaResponse(validcode, session,
				VlidatCodeKey)) {
			return JSON.toJSONString(false);
		}
		return JSON.toJSONString(true);
	}

	/*
	 * @RequestMapping("/pay") public String pay(ModelMap map){
	 * map.put("viewModel", payViewModel); return "order/pay.ftl"; }
	 */
	@RequestMapping("/goBack")
	public String goBack() {
		return "redirect:/cart/mycart.do";
	}

	@RequestMapping("/toAlipay")
	public String toAlipay(RedirectAttributes attrs, String orderId) throws Exception {

		// 总的订单
		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
		
		BigDecimal price = order.getAmount();
		//测试数据
//		BigDecimal price = new BigDecimal(0.01);
		//支付参数
		AlipayDirectModel model = new AlipayDirectModel("订单支付", price, orderId, B2BConstants.PAY_TYPE_ORDER);
		//回调
		model.setExtraCommonParam("payOrderCallback");
		attrs.addFlashAttribute(PayController.ALIPAY_DIRECT_MODEL, model);
		return "redirect:/pay/alipay.do";
	}

	@RequestMapping("/toAlipay1")
	public String toAlipay1(Boolean qrMode, RedirectAttributes attrs,String orderId)
			throws IOException, NumberFormatException, I9heException {

		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
		
		BigDecimal price = order.getAmount();
		//测试数据
//		BigDecimal price = new BigDecimal(0.01);
		
		AlipayDirectModel model = new AlipayDirectModel("订单支付", price, orderId, B2BConstants.PAY_TYPE_ORDER);
		model.setExtraCommonParam("payOrderCallback");
		attrs.addFlashAttribute(PayController.ALIPAY_DIRECT_MODEL, model);
		attrs.addFlashAttribute("QrMode", qrMode);
		return "redirect:/pay/alipay.do";
	}

	@ResponseBody
	@RequestMapping("/money")
	public String money() {
		Wallet wa = walletService.findByUserId();
		String money="0.00";
		if(wa!=null){
			if(wa.getMoney()!=null){
				money = wa.getMoney().toString();
			}
		}
		return JSON.toJSONString(money);
	}

	@ResponseBody
	@RequestMapping("/yuePay")
	public String money(String password, String orderId)
			throws I9heException {
		Integer userId = SessionUtil.getSessionUser().getId();
		
		// 订单集合
		List<Integer> orderIds = new ArrayList<Integer>();
		orderIds.add(Integer.parseInt(orderId));

		List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(Integer
				.parseInt(orderId));
		for (Order o : orderList) {
			orderIds.add(o.getId());
		}
		
		//商品总价
		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
		
		
		Wallet wa = walletService.findByUserId();
		if(wa.getErrorCount()<wa.getErrorAll()){
			if (StringUtil.makeMD5(password).equals(wa.getPassword())) {
				//BigDecimal allPrice = order.getAmount().add(order.getExpressfee());
				BigDecimal y = wa.getMoney();
				Double yue = y.subtract(order.getAmount()).doubleValue();
				if (yue >= 0) {
					// 更新用户余额
					Wallet wa1 = new Wallet();
					wa1.setMoney(BigDecimal.valueOf(yue));
					wa1.setUserId(userId);
					walletService.updateByUserId(wa1);

					// 插入消费记录
					userBalance ub = new userBalance();
					ub.setUserId(SessionUtil.getSessionUser().getId());
					ub.setMoney(order.getAmount());
					ub.setChargeType(-1);
					ub.setChargeOrder(System.currentTimeMillis() + "");
					ub.setChargeSj(new Date());
					ub.setChargeLog("会员" + SessionUtil.getSessionUser().getId()
							+ "于" + new Date() + "支出" + order.getAmount());
					userbalanceMapper.insert(ub);

					// 更新订单状态
					if (orderIds.size() > 0) {
						for (Integer id : orderIds) {
							Order flag = orderBaseApiServcie.getOrderById(id);
							Order orderSon = new Order();
							orderSon.setPayTime(new Date());
							
							if(flag.getType2()==IOrderBaseApiServcie.TYPE2_AGENT){
								//注：如果是代理托管订单插入业务数据
								//获取设置参数所需数据
								OrderGoods og = orderBaseApiServcie.getOrderGoodsByOrderId(id);
								OrderTrusteeship ot = orderBaseApiServcie.getOrderTrusteeshipById(id);
								Goods g = goodsService.selectByPrimaryKey(og.getGoodsId());
								//实例化设置所需对象
								Business bus = new Business();
								BusinessTrusteeship bt = new BusinessTrusteeship();
								int c = og.getCount();
								BigDecimal cc = new BigDecimal(c);
								BigDecimal dd = order.getAmount();
								//设置配置业务总表参数
								Integer type = new Integer(3);
								Integer iftest = new Integer(0);
								Integer cyc = new Integer(og.getOrderCycle());
								
								bus.setUserId(userId);
								bus.setType(type.byteValue());
								bus.setIfTest(iftest.byteValue());
								bus.setState(iftest.byteValue());
								bus.setCycle(cyc.byteValue());
								bus.setOrderAmount(dd.divide(cc, 2, RoundingMode.HALF_UP));
								bus.setRenewAmount(dd.divide(cc, 2, RoundingMode.HALF_UP));
								bus.setCreatedDate(DateUtil.getSysDate());
								bus.setOrderId(order.getId());
								bus.setGoodsId(g.getId());
								bus.setGoodsName(g.getGoodsName());
								
								//代理托管业务所需参数
								Integer ipcount = new Integer(ot.getIpCount());
								
								bt.setTrustSize(ot.getTrusteeshipSize());
								bt.setPower(ot.getPower());
								bt.setLine(ot.getHddSize());
								bt.setBandwidth(ot.getBandwidth());
								bt.setIpCount(ipcount);
								bt.setCreatedDate(DateUtil.getSysDate());
								
								//开始插入业务数据注：买几台就对应插几条
								for(int a=0;a<c;a++){
									businessmapper.insertSelective(bus);
									bt.setServiceId(businessmapper.GetMaxId(userId));
									businesstrusteeshipmapper.insertSelective(bt);
								}
							
							}
							//注：如果是代理托管订单就设置收货地址为0
							orderSon.setId(id);
							orderSon.setState(6);
							orderBaseApiServcie.updateOrder(orderSon);
						}
					}
					Invoice invoice = financialBaseApiService
							.getInvoiceByOrderId(Integer.parseInt(orderId));
					// 更新账单
					invoice.setType(5);
					invoice.setAmount(order.getAmount());
					invoice.setPayment("余额支付");
					financialBaseApiService
							.updatePaymentOnLine(invoice, new Date());
					
					SyUser syUser = syUserService.findByUser(order.getUserId().toString());
					//该用户为信赊宝用户  为用户推送订单信息
					if(syUser!=null){
						syUrlService.sendOrderData(order, "余额支付");
					}
					
					return JSON.toJSONString("success");
				} else {
					//余额不足
					return JSON.toJSONString("warning");
				}
			} else {
				//密码错误
				wa.setErrorCount(wa.getErrorCount()+1);
				walletService.updateByUserId(wa);
				return JSON.toJSONString("error"+wa.getErrorCount());
			}
		}else{
			return JSON.toJSONString("error");
		}
		
	}

	@RequestMapping("/success")
	public String success() {
		return "order/success.ftl";
	}
	
	/**
	 * 到支付页面
	 * 
	 * @param map
	 * @return
	 * @throws I9heException
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/topay")
	public String  toPay(ModelMap map,String orderId,Integer addressId,HttpServletRequest request,String zzfpId,String who,String mx1,String remark) throws I9heException, UnsupportedEncodingException {
		//接收新的订单id
		String orderId1 = "";
		Integer orderAddressId = null;
		User user = SessionUtil.getSessionUser();
		List<CartViewModel> ca = new ArrayList<CartViewModel>();
		// 购物车支付
		if (StringUtils.isBlank(orderId)) {
			BigDecimal allPrice = new BigDecimal(0);
			// 计算总价 和购买的商品
			List<Cart> cart = cartService.getCartByUserid(user.getId());
			boolean isOrder = false;
			if (cart != null && cart.size() > 0) {
				for (Cart c : cart) {
					// 从购物车提交的订单
					if (c.getIsSubmit() == 1) {
						CartViewModel cart1 = new CartViewModel(c);
						Goods goods = goodsService.getGoodsByid(c.getGoodsId());
						cart1.setConfig(c.getConfig());
						if (goods != null) {
							cart1.setGoodsName(goods.getGoodsName());
							cart1.setImg(goods.getGoodsImg());
						} else {
							return "error.ftl";
						}
						ca.add(cart1);
						// 有单
						isOrder = true;
					}
				}	
				//新的订单
 				if (isOrder) {
					Integer id = cartService.getorderByCartList2(cart, user,addressId);
					
					Address address = privilegeBaseApiService.getAddrressById(addressId);
					//插入收货地址到订单地址表
					Integer oaId = cartService.updateOrderAddress(address,id);
					orderAddressId = oaId;
					if(remark==null){
						remark="";
					}
					remark=new String (remark.getBytes("iso8859-1"),"utf-8");
					if (id != null) {
						Invoices invoices = new Invoices();
						if(zzfpId==null || zzfpId.equals("")){
							who=new String (who.getBytes("iso8859-1"),"utf-8");
							mx1=new String (mx1.getBytes("iso8859-1"),"utf-8");
							invoices.setContent(mx1);
							invoices.setUserId(user.getId());
							invoices.setCreatedTime(new Date());
							invoices.setHeader(who);
							invoices.setRemark(remark);
							invoices.setOrderId(id);
							invoices.setType(0);
							InvoicesService.insert(invoices);
							
						}else{
							InvoiceQualifed invoiceQualifed =InvoicesService.findById(zzfpId);
							invoices.setBank(invoiceQualifed.getBank());
							invoices.setBankAccount(invoiceQualifed.getBankAccount());
							invoices.setCreatedTime(new Date());
							invoices.setOrderId(id);
							invoices.setOrganization(invoiceQualifed.getOrganization());
							invoices.setRegistAddress(invoiceQualifed.getRegistAddress());
							invoices.setRemark(remark);
							invoices.setRegistPhone(invoiceQualifed.getRegistPhone());
							invoices.setType(1);
							invoices.setUserId(invoiceQualifed.getUserId());
							invoices.setUserIdcode(invoiceQualifed.getUserIdcode());
							InvoicesService.insert(invoices);
						}
						//总单
						Order mainOrder = orderBaseApiServcie.getOrderById(id);
						allPrice = mainOrder.getAmount();
						orderId1 = String.valueOf(id);
						map.put("allPrice", allPrice.toString());
						map.put("orderId", id);
						map.put("goodsList", ca);
					}
					//刷新
				} 
			}else{
				if(isOrder==false) {
					Invoice invoice = financialBaseApiService.getInvoiceByUser(user.getId());
					/*
					map.put("allPrice", allPrice.toString());
					map.put("orderId",invoice.getOrderId());
					map.put("goodsList", ca);*/
					return "redirect:/cart/topay.do?orderId="+invoice.getOrderId();
				}
			}
		} else {
			
			//不让订单价格为0的去支付
			Order flag = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
			BigDecimal Amount = flag.getAmount();
			String A = Amount.toString();
			String B = "0.00";
			if(A.equals(B)){
//				System.out.println("FUCK YOU");
				return "redirect:/controller/toUserCenter.do";
			}
			
			Order order = orderBaseApiServcie.getOrderById(Integer
					.parseInt(orderId));
			if(order.getState()!=0){
				return "error.ftl";
			}
			List<Order> orderList = orderBaseApiServcie
					.getOrderListByBatch(Integer.parseInt(orderId));
			// 有子单
			if (orderList.size() > 0 && orderList != null) {
				for (Order o : orderList) {
					OrderGoods orderGoods = orderBaseApiServcie
							.getOrderGoodsByOrderId(o.getId());
					Goods goods = goodsService.getGoodsByid(orderGoods
							.getGoodsId());
					CartViewModel cart1 = new CartViewModel();
					cart1.setGoodsName(goods.getGoodsName());
					cart1.setGoodnum(orderGoods.getCount());
					ca.add(cart1);
				}
			} else {
				// 普通单
				OrderGoods orderGoods = orderBaseApiServcie
						.getOrderGoodsByOrderId(order.getId());
				Goods goods = goodsService
						.getGoodsByid(orderGoods.getGoodsId());
				CartViewModel cart1 = new CartViewModel();
				cart1.setGoodsName(goods.getGoodsName());
				cart1.setGoodnum(orderGoods.getCount());
				ca.add(cart1);
			}
			//设置立即支付参数
			map.put("allPrice", order.getAmount().toString());
			map.put("orderId", orderId);
			map.put("goodsList", ca);

		}
		OrderAddress address = orderBaseApiServcie.selectOrderAddressById(orderAddressId);
		map.put("address",address);
		// 消息提示用户有一条待支付订单
		if(orderId==null){
			orderId = orderId1;
		}
		/*String url =  this.getPath(request)+"cart/topay.do?orderId="+orderId;
		
		if(!messageService.isHave(url)){
			messageService.insertMessage(user.getId(), 1, null,url);
		}*/
		return "order/pay.ftl";
	}
	@RequestMapping("/wxpay")
	public String wxPay(RedirectAttributes attrs,String orderId){
		attrs.addFlashAttribute(PayController.WXPAY_MODEL, "ORDER_"+orderId);
		return "redirect:/pay/wxpay.do";
	}
	
	@RequestMapping("/jdpay")
	public String jdpay(RedirectAttributes attrs, Integer orderId, String bank) throws I9heException {
		Order order = orderBaseApiServcie.getOrderById(orderId);
		JDPayModel jdpayModel = new JDPayModel(order.getAmount(), bank, orderId.toString(), B2BConstants.PAY_TYPE_ORDER);
		attrs.addFlashAttribute(PayController.JDPAY_MODEL, jdpayModel);
		return "redirect:/pay/jdpay.do";
	}

	@RequestMapping("/jdpay_query")
	public String jdpayQuery(RedirectAttributes attrs, String orderId) throws I9heException {
		JDPayQueryModel jdpayModel = new JDPayQueryModel(B2BConstants.PAY_TYPE_ORDER, orderId);
		attrs.addFlashAttribute(PayController.JDPAY_QUERY_MODEL, jdpayModel);
		return "redirect:/pay/jdpay_query.do";
	}

	@ResponseBody
	@RequestMapping("/f5")
	public String state(Order record,HttpServletRequest request) throws NumberFormatException, I9heException {
		Order order = orderBaseApiServcie.getOrderById(record.getId());
		if(order.getState()==IOrderBaseApiServcie.NON_PAYMENT){
			return JSON.toJSONString(false);
		}
		return JSON.toJSONString(true);
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
	@ResponseBody
	@RequestMapping(value="/zzfp",produces = "text/plain;charset=UTF-8")
	public String zzfp(){
		InvoiceQualifed iqd =  InvoicesService.findByUserId();
		return JSON.toJSONString(iqd);
	}
	
	/**
	 * 立即购买设置cookie
	 * @param model
	 * @return
	 * @throws I9heException
	 * @throws UnsupportedEncodingException 
	 * */
	@RequestMapping(value="/rightnow", method = { RequestMethod.GET, RequestMethod.POST })
	public String rightnow(HttpServletRequest request,String config, String pay, Integer goodsId, Integer orderCycle,String idlink, Integer number,Integer trustarea,Integer gssy,Integer ipnum,Integer ipflag,Integer centerid) throws I9heException, UnsupportedEncodingException {
		
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		
		Cookie[] cookies = request.getCookies();
		
		//设置cookie
		String goodsIdValue = "goodsId"+"^|"+goodsId.toString();
		String payValue= "pay"+"^|"+pay;
		String configValue = "config"+"^|"+config;
		String orderCycleValue = "orderCycle"+"^|"+orderCycle.toString();
		String idlinkValue = "idlink"+"^|"+idlink;
		String numberValue = "number"+"^|"+number.toString();
		String trustareaValue = "trustarea"+"^|"+trustarea.toString();
		String gssyValue = "gssy"+"^|"+gssy.toString();
		String ipnumValue  = "ipnum"+"^|"+ipnum.toString();
		String ipflagValue = "ipflag"+"^|"+ipflag.toString();
		String centeridValue = "centerid"+"^|"+centerid.toString();

		String ALLValue = goodsIdValue.trim()+"-^"+payValue+"-^"+configValue+"-^"+orderCycleValue+"-^"+idlinkValue+"-^"+numberValue+"-^"+trustareaValue+"-^"+gssyValue+"-^"+ipnumValue+"-^"+ipflagValue+"-^"+centeridValue;
		//删除cookie
		for(Cookie cookie : cookies){
            if(cookie.getName().equals("XiaoCha")){
                cookie.setValue(null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            if(cookie.getName().equals("Cha")){
            	cookie.setValue(null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
		//重新设置cookie
		Cookie cookie = new Cookie("XiaoCha", URLEncoder.encode(ALLValue,"UTF-8"));
        cookie.setMaxAge(3600);
        cookie.setPath("/");
        response.addCookie(cookie);
        
        Cookie cookie2 = new Cookie("Cha", centerid.toString());
        cookie2.setMaxAge(3600);
        cookie2.setPath("/");
        response.addCookie(cookie2);
        
        return "redirect:/cart/gopay.do";
        
	}
	
	/**
	 * 立即购买设置
	 * @param model
	 * @return
	 * @throws I9heException
	 * @throws UnsupportedEncodingException 
	 * */
	@RequestMapping(value="/gopay")
	public String gopay(HttpServletRequest request,ModelMap map,HttpServletResponse respo) throws I9heException, UnsupportedEncodingException {
		Integer goodsId = null, number = null;
		Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies){
        	if(cookie.getName().equals("XiaoCha")){
        		String CookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        		String[] Str=CookieValue.split("-\\^");
        		for(int a=0;a<Str.length;a++){
        			String[] Str2 = Str[a].split("\\^\\|");
        			if(Str2[0].equals("goodsId")){
        				Goods goods = goodsService.selectByPrimaryKey(Integer.valueOf(Str2[1]));
        				map.put("goods", goods);
        				goodsId = Integer.valueOf(Str2[1]);
        			}
        			if(Str2[0].equals("pay")){
        				map.put("pay", new BigDecimal(Str2[1]));
        			}
        			if(Str2[0].equals("number")){
        				map.put("number", Integer.valueOf(Str2[1]));
        				number = Integer.valueOf(Str2[1]);
        			}
        			map.put(Str2[0], Str2[1]);
        		}
        	}
        }
		// 用户默认收货地址
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Address> list = privilegeBaseApiService.getAddressByUserId(userId);
		Address address = new Address();
		for (Address a : list) {
			if (a.getIsMain()) {
				address = a;break;
			}
		}
		BigDecimal expressfee = cartService.getExpressfee(goodsId,number,address);
		
		map.put("expressfee", expressfee);
		map.put("list", list);
		/*硬件绑托管代理逻辑Begin 这里拿到的是IDC的goodsId 并非硬件的那个goodsId*/
		int flag = 0;
		for(Cookie cookie : cookies){
        	if(cookie.getName().equals("Cha")){
        		flag = Integer.parseInt(cookie.getValue());
        	}
		}
		if(flag!=0){
			TruDatacenter tru = trustmapper.selectByPrimaryKey(flag);
			Goods goodsIdc = goodsService.selectByPrimaryKey(tru.getGoodsId());
			map.put("goodsIdc", goodsIdc);
			map.put("tru", tru);
			List<GoodsItem> itemsID = goodsitemService.selectItemKey(tru.getGoodsId());
			Map<String, Object> mapp  = new LinkedHashMap<String, Object>();
			TreeMap<Integer, Integer> demo= new TreeMap<Integer, Integer>();
			
			for (GoodsItem goodsitem : itemsID) {
				Item item = itemService.selectByPrimaryKey(goodsitem.getItemId());
				int itemtype = item.getItemType();
				Itemcategory type  = itemscategoryService.selectByPrimaryKey(itemtype);
				if(type!=null){
					int typeid      = type.getId();
					int sortid      = type.getSort();
					demo.put(sortid, typeid);
				}
			}
			// HashMap(无序), LinkedHashMap(有序)
			for(Map.Entry<Integer, Integer> entry : demo.entrySet()){ 
				Itemcategory type  = itemscategoryService.selectByPrimaryKey(entry.getValue());
				String typename = type.getTypeName();
				List<Item> listt = itemService.getjoinitem(tru.getGoodsId(), entry.getValue());
				mapp.put(typename, listt);
			}
			int len = mapp.size();
			map.put("len", len);
			map.put("mapp", mapp);
			
			return "order/toconfirmTwo.ftl";
			/*硬件绑托管代理逻辑End*/
		}else{
			return "order/toconfirm.ftl";
		}
		
	}
	
	/**
	 * 生成订单
	 * @param model
	 * @return
	 * @throws I9heException
	 * */
	@RequestMapping(value="/addorder", method = { RequestMethod.GET, RequestMethod.POST })
	public String addorder(HttpServletRequest request,ModelMap map,String config, String pay, Integer goodsId, Integer orderCycle,String idlink, Integer number,Integer trustarea,Integer gssy,Integer ipnum,Integer ipflag,String header,String content,String remark,Integer zzId,Integer checkBox) throws I9heException, UnsupportedEncodingException {
		
		Integer goodid = Integer.valueOf(goodsId);
		Integer count = Integer.valueOf(number);
		User user = SessionUtil.getSessionUser();
		try {
			Goods goods = goodsService.getGoodsByid(goodid);
			if (goods == null) {
				throw new I9heException("", "商品不存在.");
			}
			//发票记录-FUCK
			Invoices invoices = new Invoices();
			if(zzId==0){
				invoices.setContent(content);
				invoices.setUserId(user.getId());
				invoices.setCreatedTime(new Date());
				invoices.setHeader(header);
				invoices.setRemark(remark);
				invoices.setType(0);
				//InvoicesService.insert(invoices);
			}else{
				InvoiceQualifed invoiceQualifed =InvoicesService.findById(zzId.toString());
				invoices.setBank(invoiceQualifed.getBank());
				invoices.setBankAccount(invoiceQualifed.getBankAccount());
				invoices.setCreatedTime(new Date());
				invoices.setOrganization(invoiceQualifed.getOrganization());
				invoices.setRegistAddress(invoiceQualifed.getRegistAddress());
				invoices.setRemark(remark);
				invoices.setRegistPhone(invoiceQualifed.getRegistPhone());
				invoices.setType(1);
				invoices.setUserId(invoiceQualifed.getUserId());
				invoices.setUserIdcode(invoiceQualifed.getUserIdcode());
				//InvoicesService.insert(invoices);
			}
			
			// 商品是否是IDC业务
			if (goods.getIfIdc()) { // 不是IDC业务 是硬件服务
				// 数据库拿得订单价格来计算
				String id = request.getParameter("idlink");
				Integer orderid;
				//获取运费
				Address address = privilegeBaseApiService.getAddrressById(checkBox);
			    BigDecimal expressfee = cartService.getExpressfee(goodsId, number, address);
			    
				if(id.equals("Cha")){
					BigDecimal amount1 = goods.getGoodsPrice().multiply(new BigDecimal(count));
					orderid = orderService.insertHardware(user, amount1, config, goodid, count,expressfee);
				}else{
					double itemPrice = itemService.getTotalPrice(id);
					BigDecimal goodsPrice = BigDecimal.valueOf(itemPrice);
					BigDecimal amount = goods.getGoodsPrice().add(goodsPrice);
					BigDecimal amount1 = new BigDecimal(Calculations.mul(amount.doubleValue(), count.doubleValue()));
					amount1 = amount1.add(expressfee);//总价=价格+运费
					orderid = orderService.insertHardware(user, amount1, config, goodid, count,expressfee);
					orderService.insertGoodsItem(id, orderid, count);
				}
				
				Order order = orderBaseApiServcie.getOrderById(orderid);
				orderService.insertFinancial(user, order, FinanCanstants.TYPE_ORDER);
				
				//插入发票
				invoices.setOrderId(orderid);
				InvoicesService.insert(invoices);
				
				//插入收货地址
				cartService.updateOrderAddress(address,orderid);
				
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
				if(gssy.equals("1")){
					String order_info = syUrlService.orderInfo(goods,order);
					String sKey = syConfigUtil.getsKey();
					String gssycontent = "order_info="+order_info;
					String sign = SyAESUtil.encrypt(sKey, gssycontent);
					String downOrderUrl = syConfigUtil.getDownOrderUrl();
					String return_url = syConfigUtil.getReturnUrl();
					
					map.put("order_info",order_info );
					map.put("sign", sign);
					map.put("return_url", return_url);
					map.put("downOrderUrl", downOrderUrl);
					return "order/downOrder.ftl";
				}
				
				return "redirect:/cart/topay.do?orderId="+orderid;
				
			} else {
				// 代理托管订单所需要的特定参数
				String id = request.getParameter("idlink");
				int ipnum2 = Integer.valueOf(request.getParameter("ipnum"));
				int ipflag2= Integer.valueOf(request.getParameter("ipflag"));
				// 配件价格
				BigDecimal itemipPrice= BigDecimal.valueOf(itemService.selectItemByItemId(ipflag2).getPrice().longValue()).multiply(new BigDecimal(ipnum2-2));//IP的价格 
				BigDecimal itemAllPrice = BigDecimal.valueOf(itemService.getTotalPrice(id)).add(itemipPrice);
				//商品价格
				BigDecimal goodsPrice = BigDecimal.valueOf(goods.getGoodsPrice().longValue());
				//订单价格
				BigDecimal orderPrice = itemAllPrice.add(goodsPrice).multiply(new BigDecimal(count*orderCycle)); 
				//插入订单ord_order
				int orderid = orderService.insertIDCOrder(user, orderPrice, goodid, 0, orderCycle, count, 0);
				//插入商品配件订单ord_goods_item
				orderService.insertGoodsItem(id, orderid, count);
				
				//插入发票
				invoices.setOrderId(orderid);
				InvoicesService.insert(invoices);
				
				//插入账单表
				Order order = orderBaseApiServcie.getOrderById(orderid);
				orderService.insertFinancial(user, order, FinanCanstants.TYPE_ORDER);
				//插入托管记录表
				OrderTrusteeship orderTrusteeship = new OrderTrusteeship();
				orderTrusteeship.setOrderId(orderid);
				orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
				orderBaseApiServcie.createTrusteeshipOrder2B(orderTrusteeship, config, goodid);
				
				return "redirect:/cart/topay.do?orderId="+orderid;
				
			}
		} catch (I9heException e) {
			logger.error("订购商品出现异常");
			throw new I9heException("订购商品出现异常", e);
		}
	
	}
	
	
	/**
	 * 生成硬件捆绑代理托管订单
	 * @param model
	 * @return
	 * @throws I9heException
	 * */
	@RequestMapping(value="/addorderTwo", method = { RequestMethod.GET, RequestMethod.POST })
	public String addorderTwo(HttpServletRequest request,ModelMap map,String config, String pay, Integer goodsId, Integer orderCycle,String idlink, Integer number,Integer trustarea,Integer gssy,Integer ipnum,Integer ipflag,String header,String content,String remark,Integer zzId,Integer checkBox,Integer goodsIdIdc,String idlinkidc,Integer centerid,String configIdc) throws I9heException, UnsupportedEncodingException {
		//公共参数
		Integer goodid    = Integer.valueOf(goodsId);
		Integer goodidIdc = Integer.valueOf(goodsIdIdc);
		Integer count     = Integer.valueOf(number);
		Integer AddressId = Integer.valueOf(checkBox);
		User user         = SessionUtil.getSessionUser();
		Integer userId = user.getId();
		
		/*获取硬件订单价格Begin*/
		Goods goods = goodsService.getGoodsByid(goodid);
		String id   = request.getParameter("idlink");
		//获取运费
		Address address = privilegeBaseApiService.getAddrressById(checkBox);
	    BigDecimal expressfee = cartService.getExpressfee(goodsId, number, address);
	    //总价
	    double itemPrice = itemService.getTotalPrice(id);
		BigDecimal goodsPrice = BigDecimal.valueOf(itemPrice);
		BigDecimal amount = goods.getGoodsPrice().add(goodsPrice);
		BigDecimal amount1 = new BigDecimal(Calculations.mul(amount.doubleValue(), count.doubleValue()));
		amount1 = amount1.add(expressfee);//总价=价格+运费
		/*获取硬件订单价格End*/
		
		/*获取IDC订单价格Begin*/
		Goods goodsIdc = goodsService.getGoodsByid(goodidIdc);
		String idIdc   = request.getParameter("idlinkidc");
		int ipnum2     = Integer.valueOf(request.getParameter("ipnum"));
		int ipflag2    = Integer.valueOf(request.getParameter("ipflag"));
		//总价
		BigDecimal itemipPrice = BigDecimal.valueOf(itemService.selectItemByItemId(ipflag2).getPrice().longValue()).multiply(new BigDecimal(ipnum2-2));//IP的价格 
		BigDecimal itemAllPrice = BigDecimal.valueOf(itemService.getTotalPrice(idIdc)).add(itemipPrice);
		BigDecimal goodsPriceIdc = BigDecimal.valueOf(goodsIdc.getGoodsPrice().longValue());
		BigDecimal amount2 = itemAllPrice.add(goodsPriceIdc).multiply(new BigDecimal(count*orderCycle)); 
		/*获取IDC订单价格End*/
		
		/*先来个总单Begin*/
		BigDecimal Allamount = amount1.add(amount2);
		Integer Allorderid = cartService.GetAllOrder(expressfee, Allamount, userId, AddressId);
		orderBaseApiServcie.setOrderGoods(Allorderid, goodid, 0, count);
		/*插入地址托管记录表，这里用总单的的订单号*/
		cartService.GetTruArea(userId, goodid, trustarea, centerid, Allorderid);
		/*再来个插入账单表*/
		Order orderAll = orderBaseApiServcie.getOrderById(Allorderid);
		orderService.insertFinancial(user, orderAll, FinanCanstants.TYPE_ORDER);
		/*在搞个发票*/
		cartService.GetInvoice(Allorderid, userId, header, content, remark, zzId);
		/*更新收货地址*/
		cartService.updateOrderAddress(address,Allorderid);
		/*先来个总单End*/
		
		/*来个硬件子单Begin*/
		int orderid = orderService.insertHardware(user, amount1, config, goodid, count,expressfee);
		orderService.insertGoodsItem(id, orderid, count);
		/*来个硬件子单End*/
		
		/*来个IDC子单Begin*/
		int orderidIdc = orderService.insertIDCOrder(user, amount2, goodidIdc, 0, orderCycle, count, 0);
		orderService.insertGoodsItem(idIdc, orderidIdc, count);
		OrderTrusteeship orderTrusteeship = new OrderTrusteeship();
		orderTrusteeship.setOrderId(orderidIdc);
		orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
		orderBaseApiServcie.createTrusteeshipOrder2B(orderTrusteeship, configIdc, orderidIdc);
		/*来个IDC子单End*/
		
		/*绑定子单*/
		cartService.GetBatchSon(orderid, Allorderid, false);
		cartService.GetBatchSon(orderidIdc,Allorderid, false);
		
		return "redirect:/cart/topay.do?orderId="+Allorderid;
	
	}

}