package com.i9he.m2b.biz;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.financial.model.Invoice;
import com.i9he.m2b.model.Business;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.search.UserCenterCountsModel;
import com.i9he.m2b.util.PageModel;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.privilege.model.User;

public interface IOrderService {
	/**
	 * 获取代理托管业务ID
	 */
	public Integer GetBusId(Business record) throws I9heException;
	/**
	 * 插入硬件订单 ,返回订单主键ID
	 * 
	 * @param user
	 * @param amount
	 * @param config
	 * @param goodsid
	 * @param expressfee 
	 * @return
	 */
	public int insertHardware(User user, BigDecimal amount, String config, Integer goodsid, Integer addressid, BigDecimal expressfee) throws I9heException;

	/**
	 * 创建账单,返回插入账单ID
	 * 
	 * @param orderid
	 * @return
	 */
	public int insertFinancial(User user, Order order, Integer type) throws I9heException;

	/**
	 * 插入IDC订单 user 用户实体 amount 账单金额 config 配置信息 goodsid 商品ID addressid 用户地址id
	 * 可以为空 IDC类不需要 orderCycle 订购周期 硬件默认为0 IDC类需要订购周期 serviceid 业务id 续费时需要传入业务ID
	 * 
	 * @return 订单ID 同时插入了订单商品表
	 * @throws I9heException
	 */
	public int insertIDCOrder(User user, BigDecimal amount, Integer goodsid, Integer addressid, Integer orderCycle, Integer count, Integer serviceid) throws I9heException;

	/**
	 * *硬件--要进入客户个人信息页面 ，添加地址 账单支付--客户网上支付，成功之后执行以下操作<br>
	 * 账单为订购：同步修改订单支付状态、支付方式、生成业务<br>
	 * 续费：同步修改业务到期时间、业务续费次数、业务状态、业务暂停级别<br>
	 * 充值: 同步修改用户帐号余额<br>
	 * 
	 * @return
	 */
	public Boolean updatePaymentAplipy(Invoice invoice, Date payDate, Double amout) throws I9heException;

	/**
	 * 插入硬件的ID
	 * 
	 * @param id
	 * @param orderId
	 * @return
	 * @throws I9heException
	 */
	public Boolean insertGoodsItem(String id, Integer orderId, Integer count) throws I9heException;
	
	/**
	 * 根据orderId 获取配件列表
	 * @return
	 * @throws I9heException
	 */
	public List<Item> getOrderItem(Integer orderId)throws I9heException;

	/***
	 * 获取各种状态订单的数量
	 * @return
	 * @throws I9heException 
	 */
	public UserCenterCountsModel getOrderStateCount() throws I9heException;

	/***
	 * 设置分页信息
	 * @param searchModel
	 * @return
	 * @throws I9heException 
	 */
	public PageModel getPageModel(OrderSearchModel searchModel) throws I9heException;
	

	// /**
	// * 业务续费
	// * @param id
	// * @param orderId
	// * @return
	// * @throws I9heException
	// */
	// public int addOrdeRenew(Integer id, User user) throws I9heException;
	// /**
	// * 宽带变更
	// * @param id
	// * @param number
	// * @param orderId
	// * @return
	// * @throws I9heException
	// */
	// public int addUpServer(Integer id, User user, String itemId) throws
	// I9heException;
	// /**
	// * 宽带变更升级，生成账单
	// * @param id
	// * @param number
	// * @param orderId
	// * @return
	// * @throws I9heException
	// */
	// int insertFinancialByUpServer(User user, OrderValueAdded orderValueAdded,
	// Integer type)throws I9heException;

	// /**
	// * 续费订单批量生产 不生成账单
	// * @param id
	// * @param user
	// * @return
	// * @throws I9heException
	// */
	// public int addrenwOrder(Integer id, User user)throws I9heException;

}
