package com.i9he.m2b.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.i9he.common.config.FinanCanstants;
import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.biz.ICommentService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IHistoryOrderService;
import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.IShippingService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.LogisticsViewModel;
import com.i9he.m2b.model.Shipping;
import com.i9he.m2b.server.biz.ILogisticService;
import com.i9he.m2b.util.B2BConstrant;
import com.i9he.m2b.util.ExpressQueryAPI;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.m2b.util.PageModel;
import com.i9he.m2b.util.PathUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SysConstant;
import com.i9he.ord.model.Batch;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderAddress;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.User;
import com.nr.comm.util.Calculations;
import com.nr.comm.util.DateUtil;

@Security
@Controller
@RequestMapping("/controller/order")
public class MallOrderAction {

	private static Logger logger = LoggerFactory.getLogger(MallOrderAction.class);
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private IFinancialBaseApiService financialBaseApiService;
	@Autowired
	private ICommentService commentService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IOrderService orderService;
	@Resource
	private IShippingService shippingService;
	@Autowired
	private IHistoryOrderService historyOrderService;
	@Autowired
	private SyUrlService syUrlService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private ILogisticService logisticService;
	@Autowired
	private IInvoicesService invoicesService;

	@RequestMapping(value = "/tomyorder", produces = "text/plain;charset=UTF-8")
	public String toMyOrder(HttpServletRequest request, ModelMap map, OrderSearchModel searchModel) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		searchModel.setUserId(user.getId());
		searchModel.setPageSize(5);
		searchModel.setUserName(user.getNickName());
		searchModel.setType1(1);
		List<Order> list = orderBaseApiServcie.getB2BOrderBySearch(searchModel);
		PageModel page = orderService.getPageModel(searchModel);

		map.put("page", page);
		map.put("orderList", list);
		map.put("orderState", SysConstant.ORDER_STATUS_MAP);
		return "order/orderlist.ftl";
	}

	@RequestMapping(value = "/orddetail")
	public String orderDetail(ModelMap map, Integer orderId) throws I9heException {
		User user = SessionUtil.getSessionUser();
		Order order = orderBaseApiServcie.getOrderById(orderId);
		if (null != order) {
			if (user.getId().equals(order.getUserId())) {
				List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(orderId);
				if (null != orderList && orderList.size() > 0) {
					for (Order ord : orderList) {
						OrderGoods ordGoods = orderBaseApiServcie.getOrderGoodsByOrderId(ord.getId());
						Goods g = goodsService.getGoodsByid(ordGoods.getGoodsId());
						ord.setGoodsName(g.getGoodsName());
						ord.setGoodsImg(g.getGoodsImg());
						ord.setGoodsId(g.getId());
						ord.setCount(ordGoods.getCount());
						List<Item> orderItem = orderService.getOrderItem(ord.getId());
						ord.setItems(orderItem);
					}
					order.setOrderType(1);
					order.setOrderList(orderList);
				} else {
					OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
					Goods good = goodsService.getGoodsByid(orderGoods.getGoodsId());
					order.setGoodsName(good.getGoodsName());
					order.setGoodsImg(good.getGoodsImg());
					order.setGoodsId(good.getId());
					order.setCount(orderGoods.getCount());
					order.setOrderType(0);
					List<Item> orderItem = orderService.getOrderItem(order.getId());
					order.setItems(orderItem);
				}
				OrderAddress address = orderBaseApiServcie.selectOrderAddressById(order.getAddressId());
				//查看是否通知物流
				Shipping shipping = shippingService.getShippingByOrderId(order.getId());
				int shippingStatus = 0;
				if (shipping != null) {
					if (shipping.getState() == 1) {
						shippingStatus = 1;
					}
				}
				BigDecimal expressfee = order.getExpressfee();
				BigDecimal allPrice = order.getAmount();
				//查看发票
				Invoices invoice = invoicesService.selectInvoiceByOrderId(orderId);
				
				map.put("invoice", invoice);
				map.put("allPrice", allPrice.toString());
				map.put("expressFee", Objects.toString(expressfee, "0"));
				map.put("shippingStatus", shippingStatus);
				map.put("orderState", SysConstant.ORDER_STATUS_MAP);
				map.put("address", address);
				map.put("order", order);
				return "order/orderDetails.ftl";
			}
		}
		return "404.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String deleteOrder(Integer id) throws I9heException {
		try {
			OrderSearchModel ord = new OrderSearchModel();
			ord.setUserId(SessionUtil.getSessionUser().getId());
			ord.setId(id);
			List<Order> orders = orderBaseApiServcie.getOrderBySearch(ord);
			if (null != orders) {
				Order od = new Order();
				od.setId(id);
				od.setState(IOrderBaseApiServcie.CANCELED);
				orderBaseApiServcie.updateOrder(od);
				Invoice in = financialBaseApiService.getInvoiceByOrderId(id);
				in.setStatus(FinanCanstants.STATUS_CLIENT_CANCEL);
				in.setUpdateDate(DateUtil.getSysDate());
				financialBaseApiService.updateInvoice(in);
				List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(id);
				// 更改子订单状态为已取消
				if (null != orderList && orderList.size() > 0) {
					for (Order order : orderList) {
						od.setId(order.getId());
						od.setState(IOrderBaseApiServcie.CANCELED);
						orderBaseApiServcie.updateOrder(od);
						// 现在子单不生成账单，所以移除
						// Invoice ordin =
						// financialBaseApiService.getInvoiceByOrderId(order.getId());
						// ordin.setStatus(FinanCanstants.STATUS_CLIENT_CANCEL);
						// ordin.setUpdateDate(DateUtil.getSysDate());
						// financialBaseApiService.updateInvoice(in);
					}
				}
				return JSON.toJSONString("success");
			} else {
				return JSON.toJSONString("false");
			}
		} catch (Exception e) {
			logger.error("删除订单id[" + id + "出现异常");
			throw new I9heException(MallErroCode.MALL_ORDER_DELETE_ERRO, "删除订单id[" + id + "出现异常", e);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/received", method = RequestMethod.POST)
	public String received(Integer id,HttpServletRequest request) throws I9heException {
		try {
			OrderSearchModel ord = new OrderSearchModel();
			ord.setUserId(SessionUtil.getSessionUser().getId());
			ord.setId(id);
			List<Order> orders = orderBaseApiServcie.getOrderBySearch(ord);
			if (null != orders) {
				
				String goodsName = "";
				
				Order order = new Order();
				order.setId(id);
				order.setUpdatedDate(new Date());
				order.setState(IOrderBaseApiServcie.RECEIVED);
				orderBaseApiServcie.updateOrder(order);
				Shipping shipping = new Shipping();
				shipping.setOrderId(id);
				shipping.setState((byte) 2);
				shippingService.updateByPrimaryKeySelective(shipping);
				
				Shipping s =  shippingService.getShippingByOrderId(id);
				
				OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(order.getId());
				if(orderGoods!=null){
					Goods goods = goodsService.selectByPrimaryKey(orderGoods.getGoodsId());
					goodsName = goods.getGoodsName();
				}
				List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(id);
				// 更改子订单状态为已收货
				if (null != orderList) {
					for (Order od : orderList) {
						order.setId(od.getId());
						orderBaseApiServcie.updateOrder(order);
						shipping.setOrderId(od.getId());
						shippingService.updateByPrimaryKeySelective(shipping);
						OrderGoods orderGoods1 = orderBaseApiServcie.getOrderGoodsByOrderId(order.getId());
						if(orderGoods1!=null){
							Goods goods1 = goodsService.selectByPrimaryKey(orderGoods1.getGoodsId());
							goodsName = goods1.getGoodsName();
						}
					}
				}
				String expressNo = "";
				if(s!=null){
					expressNo = s.getExpressNo();
				}
				MessageContentUtil util = new MessageContentUtil();
				Integer userId = SessionUtil.getSessionUser().getId();
				messageService.addMessage(PathUtil.getPath(request)+"controller/order/orddetail.do?orderId="+id, util.getLogisticsTitle(goodsName),util.getLogistics(id+"", expressNo));
				return JSON.toJSONString("success");
				
				
			}
			return JSON.toJSONString("fail");
		} catch (Exception e) {
			logger.error("订单id[" + id + "]确认收货出现异常");
			throw new I9heException(MallErroCode.MALL_ORDER_DELETE_ERRO, "订单id[" + id + "]确认收货出现异常", e);
		}
	}

	@RequestMapping(value = "todelete", produces = "text/plain;charset=UTF-8")
	public String todelete(HttpServletRequest request, String id, ModelMap map) throws I9heException {
		if (Calculations.isNumber(id)) {
			map.put("id", id);
			return "order/delete.ftl";
		}
		return "404.ftl";// 错误页面
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
	
	/**
	 * 通过订单号查询订单的物流情况
	 * @param orderId
	 * @param map
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/logisticsquery", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String logisticsQuery(Integer orderId, ModelMap map) throws Exception {
		Shipping shipping = shippingService.getShippingByOrderId(orderId);
		String expNo = "";
		String expCompany = "";
		if (shipping != null) {
			expNo = shipping.getExpressNo();
			expCompany = shipping.getExpressCompany();
		}
		String logistics = ExpressQueryAPI.getOrderTracesByNo(expNo);
		if (!logistics.equals("0")) {
			Integer logisticStatus = JSONObject.parseObject(logistics).getInteger("State");
			// 判断查询接果是否为空或有异常
			map.put("result", 1);
			map.put("expCompany", expCompany);
		//	map.put("logisticStatus", SysConstant.LOGISTIC_STATUS_MAP.get(logisticStatus));
			map.put("LogisticCode", JSONObject.parseObject(logistics).getString("LogisticCode"));
			map.put("Logistics", JSONObject.parseObject(logistics).getJSONArray("Traces"));
		} else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/logisticsdetails",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
	public String getLogisticsDetails(Integer orderId, ModelMap map) throws I9heException{
		Batch batch = orderBaseApiServcie.getBatchByOrderId(orderId);
		if(batch != null){
			orderId = batch.getBatchId();
		}
		Shipping shipping = shippingService.getShippingByOrderId(orderId);
		String expNo = null;
		String expCompany = null;
		if (shipping != null) {
			expNo = shipping.getExpressNo();
		    expCompany = shipping.getExpressCompany();
			LogisticsViewModel  logistics = logisticService.getLogisticByCode(expNo);
			
			map.put("logisticStateMap", JSON.toJSON(B2BConstrant.LOGISTIC_STATE));
			map.put("result", 1);//已经通知物流
			map.put("logistics", logistics);
			map.put("expNo", expNo);
			map.put("expCompany", expCompany);
		}else{
			map.put("result", 0);//还未通知物流
		}
		return JSON.toJSONStringWithDateFormat(map, "yyyy-MM-dd HH:mm:ss");
	}
	
	@RequestMapping(value = "comment", method = RequestMethod.GET)
	public String comment(HttpServletRequest request, Integer orderId, ModelMap map) throws Exception {
		try {
			Integer id = Integer.valueOf(orderId);
			Order order = orderBaseApiServcie.getOrderById(id);
			if (order != null) {
				User user = SessionUtil.getSessionUser(request);
				if (user.getId().equals(order.getUserId())) {
					map.put("order", order);
					OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(id);
					Goods good = goodsService.getGoodsByid(orderGoods.getGoodsId());
					map.put("good", good);
					map.put("orderGood", orderGoods);
					return "comment/comment.ftl";
				}
				// 订单不属于该用户
				return "404.ftl";
			}
		} catch (I9heException e) {
			logger.error("评论订单ID[" + orderId + "]为空");
			throw new I9heException(MallErroCode.MALL_ORDER_COMMENT_ERRO, "评价订单ID[" + orderId + "]为空", e);
		}
		return "404.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "comment", method = RequestMethod.POST)
	public void comment(HttpServletRequest request, HttpServletResponse response, Comment comment, Integer orderId) throws I9heException {
		try {
			User user = SessionUtil.getSessionUser();
			comment.setUserId(user.getId());
			comment.setOrderId(orderId);

			String[] photos = request.getParameterValues("photo");
			StringBuffer str = new StringBuffer();
			if (photos != null && photos.length > 0) {
				for (int i = 0; i < photos.length; i++) {
					str.append(photos[i]);
					if (photos.length - i != 1) {
						str.append(";");
					}
				}
			}
			comment.setPhoto(str.toString());
			Integer res = commentService.addComment(comment);
			if (res > 0) {
				Order order = orderBaseApiServcie.getOrderById(orderId);
				order.setIsComment(1);
				orderBaseApiServcie.updateOrder(order);
				// 判断主订单是否评价完,如果子订单完全被评价，则主订单设为已评价
				Batch mainBatch = orderBaseApiServcie.getBatchByOrderId(order.getId());
				if (null != mainBatch) {
					boolean isComment = orderBaseApiServcie.getOrderIsComment(mainBatch.getBatchId());
					if (isComment) {
						Order mainOrder = orderBaseApiServcie.getOrderById(mainBatch.getBatchId());
						mainOrder.setIsComment(1);
						orderBaseApiServcie.updateOrder(mainOrder);
					}
				}
				response.sendRedirect("tomyorder.do?state=7&isComment=0");
			} else {
				response.sendRedirect("404.ftl");
			}
		} catch (Exception e) {
			logger.error("评论订单ID为空");
			throw new I9heException(MallErroCode.MALL_ORDER_COMMENT_ERRO, "评价订单ID为空", e);
		}
	}

	@ResponseBody
	@RequestMapping("/returnGoods")
	public String returnGoods(HttpServletRequest request) {
		String orderId = request.getParameter("orderId");
		String money = request.getParameter("money");
		HistoryOrder historyOrder = historyOrderService.findByOrderId(Integer.parseInt(orderId));
		try {
			if (historyOrder != null) {
				String result = syUrlService.returnGoods(Integer.parseInt(orderId),money);
				net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(result);
				logger.info("返回信息[" + json.getString("msg") + "]");
				if (json.getString("msg").equals("success")) {
					historyOrder.setStatus(6);
					historyOrderService.update(historyOrder);
					return JSON.toJSONString(true);
				}
				return JSON.toJSONString(false);
			} else {
				return JSON.toJSONString(false);
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
			return JSON.toJSONString(false);
		} catch (I9heException e) {
			e.printStackTrace();
			return JSON.toJSONString(false);
		} catch (Exception e) {
			e.printStackTrace();
			return JSON.toJSONString(false);
		}
	}
	@ResponseBody
	@RequestMapping("/cancelOrder")
	public String cancelOrder(Integer id) {
		try {
			HistoryOrder historyOrder = historyOrderService.findByOrderId(id);
			if (historyOrder != null) {
				String result = syUrlService.cancelOrder(id);
				if (result.equals("success")) {
					historyOrder.setStatus(5);
					historyOrderService.update(historyOrder);
					return JSON.toJSONString(result);
				}else{
					return JSON.toJSONString(false);
				}
			} else {
				return JSON.toJSONString(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return JSON.toJSONString(false);
		}
	}

}
