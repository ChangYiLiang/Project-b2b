package com.i9he.m2b.server.controller.callback;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.financial.api.IFinancialBaseApiService;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.ISyUserService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.mapper.BusinessMapper;
import com.i9he.m2b.mapper.BusinessTrusteeshipMapper;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.BusinessTrusteeship;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderTrusteeship;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.nr.comm.util.DateUtil;

@Service
public class OrderCallbackService {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;

	@Autowired
	private IFinancialBaseApiService financialBaseApiService;

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@Autowired
	private SyUrlService syUrlService;

	@Autowired
	private ISyUserService syUserService;
	
	@Autowired
	private BusinessMapper businessmapper;
	@Autowired
	private BusinessTrusteeshipMapper businesstrusteeshipmapper;
	@Resource
	private IGoodsService goodsService;

	public void onPaySuccess(String orderId, String payment) throws I9heException {

		// 商品总价
		Order order = orderBaseApiServcie.getOrderById(Integer.parseInt(orderId));
		if (order.getState() != 0) {
			logger.info("订单已经支付！");
		}
		// 订单集合
		List<Integer> orderIds = new ArrayList<Integer>();
		orderIds.add(Integer.parseInt(orderId));

		List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(Integer.parseInt(orderId));
		for (Order o : orderList) {
			orderIds.add(o.getId());
		}
		// 用户默认地址
		List<Address> list = privilegeBaseApiService.getAddressByUserId(order.getUserId());
		Integer addressId = 0;
		for (Address a : list) {
			if (a.getIsMain()) {
				addressId = a.getId();
				break;
			}
		}

		// 更新订单状态
		if (orderIds.size() > 0) {
			for (Integer id : orderIds) {
				Order flag = orderBaseApiServcie.getOrderById(id);
				Order orderSon = new Order();
				orderSon.setPayTime(new Date());
				
				if(flag.getType2()==IOrderBaseApiServcie.TYPE2_AGENT){
					Integer userId = flag.getUserId();
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
				logger.info("更新订单[" + id + "]为已支付");
			}
		}
		Invoice invoice = financialBaseApiService.getInvoiceByOrderId(Integer.parseInt(orderId));
		// 更新账单
		invoice.setType(5);
		invoice.setAmount(order.getAmount());
		invoice.setPayment(payment);
		financialBaseApiService.updatePaymentOnLine(invoice, new Date());
		logger.info("更新账单[" + invoice.getId() + "]为已付款");
		SyUser syUser = syUserService.findByUser(order.getUserId().toString());
		// 该用户为信赊宝用户 为用户推送订单信息
		if (syUser != null) {
			syUrlService.sendOrderData(order, payment);
		}
		
	}

}
