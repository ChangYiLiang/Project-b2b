package com.i9he.m2b.biz.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.FinanCanstants;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.mapper.BusinessMapper;
import com.i9he.m2b.mapper.Item2bMapper;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.search.UserCenterCountsModel;
import com.i9he.m2b.util.DateUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.PageModel;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Batch;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoodsItem;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.model.User;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.com");

	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	@Resource
	private ICategoryService categoryService;
	@Resource
	private IGoodsService goodsService;
	@Autowired
	private Item2bMapper itemMapper;
	
	// @Autowired
	// private IBusinessBaseApiService businessBaseApiService;
	// @Autowired
	// private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	IItemService itemService;
	@Autowired
	private BusinessMapper businessmapper;
	
	@Override
	public Integer GetBusId(Business record) throws I9heException {
		businessmapper.insertSelective(record);
		return record.getId();		
	}
	@Override
	public int insertHardware(User user, BigDecimal amount, String config, Integer goodsid, Integer count,BigDecimal expressfee) throws I9heException {
		try {
			BigDecimal big = new BigDecimal(0);
			Order order = new Order();
			// 设置订单的所属用户ID
			order.setUserId(user.getId());
			// 设置订单类型1 为实物类订单
			order.setType1(IOrderBaseApiServcie.TYPE1_HARDWARE);
			// 设置订单类型2 为硬件类订单
			order.setType2(IOrderBaseApiServcie.TYPE2_HARDWARE);
			// 设置订单类型3 为正式类订单
			order.setType3(IOrderBaseApiServcie.TYPE3_OFFICIAL);
			order.setAmount(amount);// 设置订单金额 = 原价-优惠金额
			order.setExpressfee(new BigDecimal(0));//服务类订单，运费统一设为0
			order.setDiscount(big);// 优惠金额 默认为0
			order.setIsDelete(false);
			order.setIsComment(0);
			order.setOrigAmount(amount);// 原价
			order.setExpressfee(expressfee);
			// order.setAddress(addressid);//设置订单的收获地址ID 暂时没这人字段 后面加
			// order.setClientRemark(config);//设置配置信息 后面 会加个配置信息的字段 先放到客户备注里
			// 设置订单状态 刚生成统一为未支付
			order.setOrderTime(DateUtil.getSysDate());
			order.setState(IOrderBaseApiServcie.NON_PAYMENT);
			order.setUpdatedDate(DateUtil.getSysDate());
			order.setCreatedDate(DateUtil.getSysDate());
			Integer orderid = orderBaseApiServcie.createOrder(order);
			// 硬件的订购周期 为0
			// 订购数量为1
			orderBaseApiServcie.setOrderGoods(orderid, goodsid, 0, count);
			return orderid;
		} catch (I9heException e) {
			logger.error("插入硬件账单出现异常");
			throw new I9heException(MallErroCode.MALL_HARDWARE_INSERT_ERRO, "插入硬件订单出现异常", e);
		}
	}

	@Override
	public int insertFinancial(User user, Order order, Integer type) throws I9heException {
		try {
			Invoice invoice = new Invoice();
			// 设置账单所属订单ID
			invoice.setOrderId(order.getId());
			// 设置账单金额
			// double a = 0.01;
			// BigDecimal cs = new BigDecimal(a);
			invoice.setAmount(order.getAmount().add(order.getExpressfee()));
			// invoice.setAmount(cs);
			// 设置账单创建时间
			invoice.setCreateDate(DateUtil.getSysDate());
			// 设置更新时间 首次创建和创建时间一样
			invoice.setUpdateDate(DateUtil.getSysDate());
			// 设置账单类型
			invoice.setType(type);
			// 设置过期时间
			invoice.setInvalidDate(DateUtil.addDays(new Date(), FinanCanstants.INVOICE_TIME));
			// 设置支付方式
			invoice.setPayment(FinanCanstants.PAY_METHOD);
			// 设置账单状态
			invoice.setStatus(FinanCanstants.STATUS_UNPAID);
			// 设置 税前金额，税后金额，税率 暂时都设置一样 后面和发票有关
			
			invoice.setAmountAfter(order.getAmount());
			invoice.setAmountBefore(order.getAmount());
			invoice.setTax(order.getAmount());
			// 设置更新人和创建人 第一次 均为用户本身
			invoice.setCreatePerson(user.getUsername());
			invoice.setUpdatePerson(user.getUsername());
			// 设置客户id
			invoice.setUserId(user.getId());
			// 设置是否删除
			invoice.setIsDelete(false); // false 为 0
			// 设置客户备注
			int result =financialBaseApiService.insertInvoice(invoice);
			return result;
		} catch (Exception e) {
			logger.error("插入账单出现异常");
			throw new I9heException(MallErroCode.MALL_FIN_INSERT_ERRO, "插入账单出现异常", e);
		}

	}

	/**
	 * 硬件--要进入客户个人信息页面 ，添加地址 账单支付--客户网上支付，成功之后执行以下操作<br>
	 * 账单为订购：同步修改订单支付状态、支付方式、生成业务<br>
	 * 续费：同步修改业务到期时间、业务续费次数、业务状态、业务暂停级别<br>
	 * 充值: 同步修改用户帐号余额<br>
	 */

	@Override
	public int insertIDCOrder(User user, BigDecimal amount, Integer goodsid, Integer addressid, Integer orderCycle, Integer count, Integer serviceid) throws I9heException {
		Goods goods = goodsService.getGoodsByid(goodsid);
		Category category = categoryService.getById(goods.getCategoryId());
		Order order = new Order();
		Integer parentId = category.getParentId();
		try {
			// 设置订单的所属用户ID
			order.setUserId(user.getId());
			// 暂时先统一为正式订单-------------
			order.setType3(IOrderBaseApiServcie.TYPE3_OFFICIAL);
			BigDecimal big = new BigDecimal(0);
			order.setAmount(amount);// 设置订单金额 = 原价-优惠金额
			order.setExpressfee(new BigDecimal(0));//服务类订单，运费设为0
			order.setDiscount(big);// 优惠金额 默认为0
			order.setOrigAmount(amount);// 原价
			// 设置业务ID 暂时没这个字段 后面加 但方法要加上 因为传个业务ID确认续费的业务ID
			order.setServiceId(serviceid);
			order.setIsDelete(false);
			// 设置订单状态 刚生成统一为未支付
			order.setOrderTime(DateUtil.getSysDate());
			order.setState(IOrderBaseApiServcie.NON_PAYMENT);
			order.setUpdatedDate(DateUtil.getSysDate());
			order.setCreatedDate(DateUtil.getSysDate());
			// 设置订单类型这里2B先默认为代理托管类的
			order.setType1(IOrderBaseApiServcie.TYPE1_HARDWARE);
			order.setType2(IOrderBaseApiServcie.TYPE2_AGENT);
			order.setIsComment(0);
			// 生成订单
			Integer orderid = orderBaseApiServcie.createOrder(order);
			// 生成订单商品表
			orderBaseApiServcie.setOrderGoods(orderid, goodsid, orderCycle, count);
			return orderid;
		} catch (Exception e) {
			logger.error(user.getUsername() + "插入订单出现异常");
			throw new I9heException(MallErroCode.MALL_IDC_INSERT_ERRO, user.getUsername() + "插入订单出现异常", e);
		}
	}

	@Override
	public Boolean updatePaymentAplipy(Invoice invoice, Date payDate, Double amout) throws I9heException {
		try {
			Boolean result = Boolean.FALSE;
			Batch ba = orderBaseApiServcie.getMainBatch(invoice.getOrderId());
			if (ba != null) {
				List<Batch> bba = orderBaseApiServcie.getBatch(invoice.getOrderId());
				for (Batch b : bba) {
					Invoice in = financialBaseApiService.getInvoiceByOrderId(b.getOrderId());
					financialBaseApiService.confirmInvoice(in, null);
				}
				financialBaseApiService.updatePaymentOnLine(invoice, DateUtil.getSysDate());
				Order order = orderBaseApiServcie.getOrderById(invoice.getOrderId());
				order.setState(IOrderBaseApiServcie.PREPAID);
				order.setUpdatedDate(DateUtil.getSysDate());
				order.setPayTime(DateUtil.getSysDate());
				orderBaseApiServcie.updateOrder(order);
			} else {
				financialBaseApiService.confirmInvoice(invoice, null);
			}
			result = Boolean.TRUE;
			return result;
		} catch (Exception e) {
			logger.error("更新账单id" + invoice.getId() + "出现异常");
			throw new I9heException(MallErroCode.MALL_FIN_UPDATE_ERRO, "更新账单id" + invoice.getId() + "出现异常", e);
		}
	}

	@Override
	public Boolean insertGoodsItem(String id, Integer orderId, Integer count) throws I9heException {
		Boolean result = false;
		try {
			String[] idList = id.split(";");
			for (String itemId : idList) {
				OrderGoodsItem ogi = new OrderGoodsItem();
				ogi.setMallItemId(Integer.parseInt(itemId));
				ogi.setOrderId(orderId);
				ogi.setCreatedDate(DateUtil.getSysDate());
				ogi.setCount(count);// 硬件的数量全部为1
				orderBaseApiServcie.insertOrderGoodsItem(ogi);
			}
			result = true;
			return result;
		} catch (Exception e) {
			logger.error("遍历硬件配件ID" + id + "出现异常");
			throw new I9heException(MallErroCode.MALL_ITEM_INSERT_ERRO, "遍历硬件配件ID" + id + "出现异常", e);
		}
	}

	@Override
	public List<Item> getOrderItem(Integer orderId) throws I9heException {
		List<Item> items;
		try {
			items = itemMapper.getItemListByOrderId(orderId);
			return items;
		} catch (Exception e) {
			logger.error("获取订单["+orderId+"]的配件失败");
			throw new I9heException("获取订单["+orderId+"]的配件失败",e);
		}
	}

	@Override
	public UserCenterCountsModel getOrderStateCount() throws I9heException {
		User user = SessionUtil.getSessionUser();
		UserCenterCountsModel  model = new UserCenterCountsModel();
		OrderSearchModel search = new OrderSearchModel();
		search.setUserId(user.getId());
		search.setState(0);
		int count1 =  orderBaseApiServcie.getB2BOrderCount(search);
		search.setState(6);
		int count2 =  orderBaseApiServcie.getB2BOrderCount(search);
		search.setState(7);
		search.setIsComment(0);
		int count3 =  orderBaseApiServcie.getB2BOrderCount(search);
		model.setNotPayOrder(count1);
		model.setReceivingOrder(count2);
		model.setNotCommentOrder(count3);
		return model;
	}

	@Override
	public PageModel getPageModel(OrderSearchModel searchModel) throws I9heException {
		int pageSize = searchModel.getPageSize();
		PageModel pageModel = new PageModel();
		int counts =  orderBaseApiServcie.getB2BOrderCount(searchModel);
		int count = counts/pageSize;
		if(counts%pageSize > 0){
			count =count+1; 
		}
		if(count == 0){
			count = 1;
		}
		pageModel.setPageCount(count);
		pageModel.setPageNo(searchModel.getPageNo());
		pageModel.setState(searchModel.getState());
		pageModel.setIsComment(searchModel.getIsComment());
		if(searchModel.getState() != null && searchModel.getIsComment() == null){
			pageModel.setUrl("&state="+searchModel.getState());
		}
		else if(searchModel.getState() != null && searchModel.getIsComment() != null){
			pageModel.setUrl("&state="+searchModel.getState()+"&isComment="+searchModel.getIsComment());
		}
		
		return pageModel;
	}

	// @Override
	// public int addOrdeRenew(Integer id, User user) throws I9heException {
	// try {
	// //
	// 旧订单ID取到后需要更新4张表的数据，订单表(fin_invoice)+订单商品表(ord_goods)+财务账单表(fin_invoice)+服务器租用订单详情表(ord_server_hire)
	// // 根据订单ID查到订单
	// Business bus = businessBaseApiService.getBusiness(id);
	// // 获取订单商品
	// // OrderGoods orderGoods
	// // =orderBaseApiServcie.getOrderGoodsByOrderId(bus.getOrderId());
	// // 地址设置为0
	// int orderid = insertIDCOrder(user, bus.getRenewAmount(),
	// bus.getGoodsId(), 0, (int) bus.getCycle(), 1, id);
	// // 获取插入的订单
	// Order order = orderBaseApiServcie.getOrderById(orderid);
	//
	// insertFinancial(user, order, FinanCanstants.TYPE_RENEW);
	//
	// switch (order.getType2()) {
	// case IOrderBaseApiServcie.TYPE2_HIRE:
	// OrderServerHire orderServerHire =
	// orderBaseApiServcie.getOrderServerHireById(bus.getOrderId());
	// if (orderServerHire == null) {
	// OrderServerHire od = new OrderServerHire();
	// od.setCreatedDate(DateUtil.getSysDate());
	// od.setOrderId(orderid);
	// orderBaseApiServcie.creatServerHire2(od);
	// break;
	// }
	// orderServerHire.setCreatedDate(DateUtil.getSysDate());
	// orderServerHire.setOrderId(orderid);
	// orderBaseApiServcie.creatServerHire2(orderServerHire);
	// break;
	// case IOrderBaseApiServcie.TYPE2_TRUSTEESHIP:
	// OrderTrusteeship orderTrusteeship =
	// orderBaseApiServcie.getOrderTrusteeshipById(bus.getOrderId());
	// if (orderTrusteeship == null) {
	// OrderTrusteeship od = new OrderTrusteeship();
	// od.setOrderId(orderid);
	// od.setTrusteeshipSize("联系客服确定.");
	// od.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatTru2(od);
	// break;
	// }
	// orderTrusteeship.setOrderId(orderid);
	// orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatTru2(orderTrusteeship);
	// break;
	// case IOrderBaseApiServcie.TYPE2_DEFENSE:
	// OrderDefense orderDefense =
	// orderBaseApiServcie.getOrderDefense(bus.getOrderId());
	// if (orderDefense == null) {
	// OrderDefense od = new OrderDefense();
	// od.setOrderId(orderid);
	// od.setCreatedDate(DateUtil.getSysDate());
	// od.setMaxDefense("联系客服确定.");
	// od.setCpuCount("联系客服确定.");
	// orderBaseApiServcie.creatDefense2(od);
	// break;
	// }
	// orderDefense.setOrderId(orderid);
	// orderDefense.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatDefense2(orderDefense);
	// break;
	// case IOrderBaseApiServcie.TYPE2_DUBBO_DEFENSE:
	// break;
	// default:
	// throw new I9heException(MallErroCode.MALL_PARA_ERRO, "查询订单类型出现异常");
	// }
	//
	// return orderid;
	// } catch (I9heException e) {
	// logger.error("续费出现异常");
	// throw new I9heException(MallErroCode.MALL_REW_ERRO, "续费出现异常", e);
	// }
	// }

	// @Override
	// public int addUpServer(Integer id, User user, String itemId) throws
	// I9heException {
	// return id;
	// /*
	// * try {
	// *
	// //旧订单ID取到后需要更新4张表的数据，订单表(fin_invoice)+订单商品表(ord_goods)+财务账单表(fin_invoice
	// * )+服务器租用订单详情表(ord_server_hire)
	// *
	// * //根据业务ID查到业务 Business bus= businessBaseApiService.getBusiness(id);
	// * //根据业务中的订单ID查到订单 //Order order =
	// * orderBaseApiServcie.getOrderById(bus.getOrderId()); Item item =
	// * itemService.selectItemByItemId(Integer.parseInt(itemId));
	// *
	// * //新增增值服务（busi_value_added） Integer BusinessValueAddedId =
	// * businessBaseApiService.createBusinessValueAdded(id, item.getArgs0()
	// * ); BusinessValueAdded businessValueAdded =
	// * businessBaseApiService.getBusinessValueAddedById
	// * (BusinessValueAddedId);
	// *
	// * //新增订单增值服务详情（ord_value_added） OrderValueAdded orderValueAdded = new
	// * OrderValueAdded(); orderValueAdded.setOrderId(bus.getOrderId());
	// * orderValueAdded.setType(businessValueAdded.getType());
	// * orderValueAdded.setServiceId(bus.getId());
	// * orderValueAdded.setMallItemId(item.getId()); //暂时配件数量默认为1
	// * orderValueAdded.setCount(1); //放入配件价格
	// * orderValueAdded.setAmount(item.getPrice());
	// *
	// * insertFinancial(user, order, FinanCanstants.TYPE_RENEW);
	// *
	// * switch(order.getType2()){ case IOrderBaseApiServcie.TYPE2_HIRE:
	// * OrderServerHire orderServerHire =
	// * orderBaseApiServcie.getOrderServerHireById(bus.getOrderId());
	// * orderServerHire.setCreatedDate(DateUtil.getSysDate());
	// * orderServerHire.setOrderId(orderid);
	// * orderBaseApiServcie.creatServerHire2(orderServerHire); break; case
	// * IOrderBaseApiServcie.TYPE2_TRUSTEESHIP: OrderTrusteeship
	// * orderTrusteeship =
	// * orderBaseApiServcie.getOrderTrusteeshipById(bus.getOrderId());
	// * orderTrusteeship.setOrderId(orderid);
	// * orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
	// * orderBaseApiServcie.creatTru2(orderTrusteeship); break; case
	// * IOrderBaseApiServcie.TYPE2_DEFENSE: OrderDefense orderDefense =
	// * orderBaseApiServcie.getOrderDefense(bus.getOrderId());
	// * orderDefense.setOrderId(orderid);
	// * orderDefense.setCreatedDate(DateUtil.getSysDate());
	// * orderBaseApiServcie.creatDefense2(orderDefense); break; case
	// * IOrderBaseApiServcie.TYPE2_DUBBO_DEFENSE: break; default: throw new
	// * I9heException(MallErroCode.MALL_PARA_ERRO, "查询订单类型出现异常"); } //生成账单
	// * int invoiceId = insertFinancialByUpServer(user, orderValueAdded,
	// * FinanCanstants.TYPE_UPSERVER);
	// *
	// *
	// * //放到账单生成后再生成订单增值服务详情
	// * //orderBaseApiServcie.createOrderValueAdded(orderValueAdded); return
	// * invoiceId; } catch (I9heException e) { logger.error("续费出现异常"); throw
	// * new I9heException(MallErroCode.MALL_ADDUPSERVER_ERRO, "续费出现异常", e); }
	// * logger.error("升级出现异常", e); throw new I9heException("", "升级出现异常", e);
	// * }
	// */
	// }

	// @Override
	// public int insertFinancialByUpServer(User user, OrderValueAdded
	// orderValueAdded, Integer type) throws I9heException {
	// Invoice invoice = new Invoice();
	// // 设置账单所属订单ID
	// invoice.setOrderId(orderValueAdded.getOrderId());
	// // 设置账单金额
	// // double a = 0.01;
	// // BigDecimal cs = new BigDecimal(a);
	// invoice.setAmount(orderValueAdded.getAmount());
	// // invoice.setAmount(cs);
	// // 设置账单创建时间
	// invoice.setCreateDate(DateUtil.getSysDate());
	// // 设置更新时间 首次创建和创建时间一样
	// invoice.setUpdateDate(DateUtil.getSysDate());
	// // 设置账单类型
	// invoice.setType(type);
	// // 设置过期时间
	// invoice.setInvalidDate(DateUtil.addDays(new Date(),
	// FinanCanstants.INVOICE_TIME));
	// // 设置支付方式
	// invoice.setPayment(FinanCanstants.PAY_METHOD);
	// // 设置账单状态
	// invoice.setStatus(FinanCanstants.STATUS_UNPAID);
	// // 设置 税前金额，税后金额，税率 暂时都设置一样 后面和发票有关
	// invoice.setAmountAfter(orderValueAdded.getAmount());
	// invoice.setAmountBefore(orderValueAdded.getAmount());
	// invoice.setTax(orderValueAdded.getAmount());
	// // 设置更新人和创建人 第一次 均为用户本身
	// invoice.setCreatePerson(user.getUsername());
	// invoice.setUpdatePerson(user.getUsername());
	// // 设置客户id
	// invoice.setUserId(user.getId());
	// // 设置是否删除
	// invoice.setIsDelete(false); // false 为 0
	// // 设置客户备注
	// return financialBaseApiService.insertInvoice(invoice);
	// }

	// @Override
	// public int addrenwOrder(Integer id, User user) throws I9heException {
	// try {
	// //
	// 旧订单ID取到后需要更新4张表的数据，订单表(fin_invoice)+订单商品表(ord_goods)+财务账单表(fin_invoice)+服务器租用订单详情表(ord_server_hire)
	// // 根据订单ID查到订单
	// Business bus = businessBaseApiService.getBusiness(id);
	// // 获取订单商品
	// // OrderGoods orderGoods
	// // =orderBaseApiServcie.getOrderGoodsByOrderId(bus.getOrderId());
	// // 地址设置为0
	// int orderid = insertIDCOrder(user, bus.getRenewAmount(),
	// bus.getGoodsId(), 0, (int) bus.getCycle(), 1, id);
	// // 获取插入的订单
	// Order order = orderBaseApiServcie.getOrderById(orderid);
	// switch (order.getType2()) {
	// case IOrderBaseApiServcie.TYPE2_HIRE:
	// OrderServerHire orderServerHire =
	// orderBaseApiServcie.getOrderServerHireById(bus.getOrderId());
	// if (orderServerHire == null) {
	// OrderServerHire od = new OrderServerHire();
	// od.setCreatedDate(DateUtil.getSysDate());
	// od.setOrderId(orderid);
	// orderBaseApiServcie.creatServerHire2(od);
	// break;
	// }
	// orderServerHire.setCreatedDate(DateUtil.getSysDate());
	// orderServerHire.setOrderId(orderid);
	// orderBaseApiServcie.creatServerHire2(orderServerHire);
	// break;
	// case IOrderBaseApiServcie.TYPE2_TRUSTEESHIP:
	// OrderTrusteeship orderTrusteeship =
	// orderBaseApiServcie.getOrderTrusteeshipById(bus.getOrderId());
	// if (orderTrusteeship == null) {
	// OrderTrusteeship od = new OrderTrusteeship();
	// od.setOrderId(orderid);
	// od.setTrusteeshipSize("联系客服确定.");
	// od.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatTru2(od);
	// break;
	// }
	// orderTrusteeship.setOrderId(orderid);
	// orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatTru2(orderTrusteeship);
	// break;
	// case IOrderBaseApiServcie.TYPE2_DEFENSE:
	// OrderDefense orderDefense =
	// orderBaseApiServcie.getOrderDefense(bus.getOrderId());
	// if (orderDefense == null) {
	// OrderDefense od = new OrderDefense();
	// od.setOrderId(orderid);
	// od.setCreatedDate(DateUtil.getSysDate());
	// od.setMaxDefense("联系客服确定.");
	// od.setCpuCount("联系客服确定.");
	// orderBaseApiServcie.creatDefense2(od);
	// break;
	// }
	// orderDefense.setOrderId(orderid);
	// orderDefense.setCreatedDate(DateUtil.getSysDate());
	// orderBaseApiServcie.creatDefense2(orderDefense);
	// break;
	// case IOrderBaseApiServcie.TYPE2_DUBBO_DEFENSE:
	// break;
	// default:
	// throw new I9heException(MallErroCode.MALL_PARA_ERRO, "查询订单类型出现异常");
	// }
	// return orderid;
	// } catch (I9heException e) {
	// logger.error("续费出现异常");
	// throw new I9heException(MallErroCode.MALL_REW_ERRO, "续费出现异常", e);
	// }
	// }
}
