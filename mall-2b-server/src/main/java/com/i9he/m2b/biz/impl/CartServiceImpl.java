package com.i9he.m2b.biz.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.FinanCanstants;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.model.PayViewModel;
import com.i9he.m2b.mapper.Cart2bMapper;
import com.i9he.m2b.mapper.ExpressAddressMapper;
import com.i9he.m2b.mapper.ExpressfeeGoodsMapper;
import com.i9he.m2b.mapper.ExpressfeeTemplateMapper;
import com.i9he.m2b.mapper.ExpressfeeTypeMapper;
import com.i9he.m2b.mapper.TruDatacenterMapper;
import com.i9he.m2b.model.Cart;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.ExpressAddress;
import com.i9he.m2b.model.ExpressfeeGoods;
import com.i9he.m2b.model.ExpressfeeTemplateEX;
import com.i9he.m2b.model.ExpressfeeType;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.TruDatacenter;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.server.biz.ITrusteeshipService;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.SysConstant;

import com.i9he.ord.model.Batch;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderAddress;
import com.i9he.ord.model.OrderDefense;
import com.i9he.ord.model.OrderServerHire;
import com.i9he.ord.model.OrderTrusteeship;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.User;
import com.nr.comm.util.Calculations;
import com.nr.comm.util.DateUtil;

@Service("cartService")
public class CartServiceImpl implements ICartService {

	private static Logger logger = LoggerFactory
			.getLogger(CartServiceImpl.class);

	@Autowired
	private Cart2bMapper cartMapper;
	@Resource
	private IGoodsService goodsService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Resource
	private IOrderService orderService;
	@Resource
	private IItemService itemService;
	@Autowired
	private ITrusteeshipService trusteeshipService;
	@Autowired
	private ExpressfeeTemplateMapper expressfeeTemplateMapper;
	@Autowired
	private ExpressAddressMapper expressAddressMapper;
	@Autowired
	private ExpressfeeTypeMapper expressfeeTypeMapper;
	@Autowired
	private ExpressfeeGoodsMapper expressfeeGoodsMapper;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IInvoicesService InvoicesService;
	@Autowired
	private TruDatacenterMapper trudatacentermapper;
	
//	@Autowired
//	private IBusinessBaseApiService BusinessBaseApiService;

	@Override
	public List<Cart> getCartByUserid(Integer userId) throws I9heException {
		List<Cart> cart;
		try {
			cart = cartMapper.selectCartByUserId(userId);
			return cart;
		} catch (Exception e) {
			logger.error("根据用户id[" + userId + "]查询购物车异常");
			throw new I9heException(ConstantUtil.SELECT_CART_ERROR, "根据用户id["
					+ userId + "]查询购物车异常", e);
		}
	}

	@Override
	public Boolean insertCart(Cart cart) throws I9heException {
		Boolean result = false;

		Integer userid = cart.getUserId();
		if (userid == null || userid.equals("")) {
			throw new I9heException("", "购物车中用户ID为空");
		}
		Integer goodid = cart.getGoodsId();
		if (goodid == null || goodid.equals("")) {
			throw new I9heException("", "购物车中商品ID为空");
		}
		Goods goods = goodsService.getGoodsByid(goodid);
		if (goods == null) {
			throw new I9heException("", "商品不存在.");
		}
		Integer goodsum = cart.getGoodsNum();
		if (goodsum == null || goodsum.equals("")) {
			throw new I9heException("", "购物车中商品数量为空");
		}
		try {
			// cart.setIsIdc(goods.getIfIdc());
			cart.setIsDelete(0);
			cart.setCretedDate(DateUtil.getSysDate());
			if (cart.getServiceId() == null) {
				if (goods.getIfIdc()) {
					String itemIdList = cart.getItemIdList();
					double totalPrice;
					if(itemIdList.equals("Cha")){
						totalPrice = 0;
					}else{
						totalPrice = itemService.getTotalPrice(itemIdList);
					}
					Goods good = goodsService.getGoodsByid(cart.getGoodsId());
					BigDecimal price = good.getGoodsPrice().add(BigDecimal.valueOf(totalPrice));
					BigDecimal amount1 = new BigDecimal(Calculations.mul(price.doubleValue(), goodsum.doubleValue()));
					cart.setPrice(price);
					cart.setAllprice(amount1);
				} else {
//					cart.setCycle(SysConstant.getOrderCycle(cart.getCycle(),
//							goodid));
//					Double orderAllp = null;
////					BigDecimal goodsprice = goodsDetailService
////							.getAmountByGoodsId(cart.getCycle(), goodid);
//					Category category = categoryService.getById(goods
//							.getCategoryId());
//					if (category.getParentId().equals(
//							ParaConstants.SERVER_TRUSTEESHIP)) {
//						Double a = Calculations.mul(goodsprice.doubleValue(),
//								(double) goodsum);
//						orderAllp = Calculations.add(cart.getPrice()
//								.doubleValue(), a);
//						Double b = Calculations
//								.div(orderAllp, (double) goodsum);
//						cart.setPrice(new BigDecimal(b));
//					} else {
//						Double itemAllp = goodsDetailService.getAllItemAmount(
//								cart.getItemIdList(), cart.getCycle(), goodid);
//						Double allGoodsIdItem = Calculations.add(
//								goodsprice.doubleValue(), itemAllp);
//						cart.setPrice(new BigDecimal(allGoodsIdItem));
//						orderAllp = Calculations.mul(allGoodsIdItem,
//								(double) goodsum);
//					}
//					BigDecimal amount1 = new BigDecimal(orderAllp);
//					cart.setAllprice(amount1);
				}
			} else {
//				cart.setAllprice(cart.getPrice());
			}
			cartMapper.insertSelective(cart);
			result = true;
			return result;
		} catch (Exception e) {
			logger.error("插入购物车异常");
			throw new I9heException("", "插入购物车异常", e);
		}
	}

	@Override
	public Integer getCartCount(Integer userId) throws I9heException {
		Integer count = null;
		try {
			count = cartMapper.getCartCount(userId);
			return count;
		} catch (Exception e) {
			logger.error("获取购物车商品数量异常.");
			throw new I9heException("", "获取购物车商品数量异常.", e);
		}
	}

	@Override
	public int updateCart(Cart cart) throws I9heException {
		try {
			return cartMapper.updateByPrimaryKeySelective(cart);
		} catch (Exception e) {
			logger.error("更新购物车出现异常.");
			throw new I9heException("", "更新购物车出现异常", e);
		}
	}

	@Override
	public Cart selectCartById(Integer id) throws I9heException {
		Cart cart;
		try {
			cart = cartMapper.selectByPrimaryKey(id);
			return cart;
		} catch (Exception e) {
			logger.error("获取购物车异常 id:" + id);
			throw new I9heException("", "获取购物车异常 id:" + id, e);
		}
	}

//	@Override
//	public Integer getorderByCartList(List<Cart> cart, User user)
//			throws I9heException {
//		try {
//			Order order = new Order();
//			BigDecimal amount = cartMapper.getAllPrice(user.getId());
//			BigDecimal amount1 = new BigDecimal(0);
//			order.setIsDelete(true);
//			order.setUserId(user.getId());
//			order.setAmount(amount);
//			order.setOrigAmount(amount);
//			order.setDiscount(amount1);
//			order.setType3(IOrderBaseApiServcie.TYPE3_TEST);
//			order.setOrderTime(DateUtil.getSysDate());
//			order.setState(IOrderBaseApiServcie.NON_PAYMENT);
//			order.setUpdatedDate(DateUtil.getSysDate());
//			order.setCreatedDate(DateUtil.getSysDate());
//
//			// 这个有问题 这些都有问题
//			order.setServiceId(1);
//			order.setType1(IOrderBaseApiServcie.TYPE1_IDC);
//			order.setType2(IOrderBaseApiServcie.TYPE2_HIRE);
//			// 就这这个订单 假的
//			Integer orderid = orderBaseApiServcie.createOrder(order);
//			Batch ba = new Batch();
//			ba.setOrderId(orderid);
//			ba.setIsBatch(true);
//			ba.setBatchId(orderid);
//			ba.setCreatedDate(DateUtil.getSysDate());
//			orderBaseApiServcie.createOrderBatch(ba);
//			for (Cart c : cart) {
//				if (c.getServiceId() != null) {
//					Integer oid = orderService.addOrdeRenew(c.getServiceId(),
//							user);
//					Batch batch = new Batch();
//					batch.setOrderId(oid);
//					batch.setBatchId(orderid);
//					batch.setIsBatch(false);
//					batch.setCreatedDate(DateUtil.getSysDate());
//					orderBaseApiServcie.createOrderBatch(batch);
//					c.setUpdatedDate(DateUtil.getSysDate());
//					c.setOrderId(orderid);
//					c.setIsDelete(2);
//					updateCart(c);
//				}
//				// 然后是订购的逻辑 订购分为IDC和硬件 暂时不写
//			}
//			// 这里类型要改
//			Order order1 = orderBaseApiServcie.getOrderById(orderid);
//			orderService.insertFinancial(user, order1,
//					FinanCanstants.TYPE_RENEW);
//			return orderid;
//		} catch (Exception e) {
//			throw new I9heException("", "批量下单出现异常.", e);
//		}
//	}

	@Override
	public Integer getorderByCartList2(List<Cart> cart, User user,Integer addressId)
			throws I9heException {
		try {
			Order order = new Order();
			BigDecimal amount = cartMapper.getAllPrice1(user.getId());
			BigDecimal amount1 = new BigDecimal(0);
			BigDecimal allExpressfee = new BigDecimal(0);
			order.setIsDelete(false);
			order.setUserId(user.getId());
			order.setAmount(amount);
			order.setOrigAmount(amount);
			order.setDiscount(amount1);
			order.setType3(IOrderBaseApiServcie.TYPE3_TEST);
			order.setOrderTime(DateUtil.getSysDate());
			order.setState(IOrderBaseApiServcie.NON_PAYMENT);
			order.setUpdatedDate(DateUtil.getSysDate());
			order.setCreatedDate(DateUtil.getSysDate());
			order.setIsComment(0);
			order.setType1(IOrderBaseApiServcie.TYPE1_HARDWARE);
			order.setType2(IOrderBaseApiServcie.TYPE2_CART);
			// 生成一个总的假订单
			Integer orderid = orderBaseApiServcie.createOrder(order);
			Batch ba = new Batch();
			ba.setOrderId(orderid);
			ba.setIsBatch(true);
			ba.setBatchId(orderid);
			ba.setCreatedDate(DateUtil.getSysDate());
			orderBaseApiServcie.createOrderBatch(ba);
			
			//new 插入托管机器区域记录
			Trusteeship Tt = new Trusteeship();
			
			//添加订单id
			for (Cart c : cart) {
				// idc服务订单
				if (c.getIsIdc() == 1) {
					if(c.getIsSubmit()==1){
						int ord = orderService.insertIDCOrder(user, c.getAllprice(), c.getGoodsId(), 0, c.getCycle(), c.getGoodsNum(), 0);
						//插入商品配件订单ord_goods_item
						orderService.insertGoodsItem(c.getItemIdList(), orderid, c.getGoodsNum());
						//插入托管记录表
						OrderTrusteeship orderTrusteeship = new OrderTrusteeship();
						orderTrusteeship.setOrderId(ord);
						orderTrusteeship.setCreatedDate(DateUtil.getSysDate());
						orderBaseApiServcie.createTrusteeshipOrder2B(orderTrusteeship, c.getConfig(), c.getGoodsId());
						
						// 设置为购物车的子类订单
						Batch batch = new Batch();
						batch.setOrderId(ord);
						batch.setBatchId(orderid);
						batch.setIsBatch(false);
						batch.setCreatedDate(DateUtil.getSysDate());
						//获取订单集合
						orderBaseApiServcie.createOrderBatch(batch);
						
						c.setUpdatedDate(DateUtil.getSysDate());
						c.setOrderId(orderid);
						c.setIsDelete(1);
						updateCart(c);
					}
				}
				// 硬件订单
				if (c.getIsIdc() == 2) {
						if(c.getIsSubmit()==1){
							//获取运费
							Address address = privilegeBaseApiService.getAddrressById(addressId);
						    BigDecimal expressfee = this.getExpressfee(c.getGoodsId(), c.getGoodsNum(), address);
						    allExpressfee = allExpressfee.add(expressfee);//叠加运费到总单
						    BigDecimal newAmount= c.getAllprice().add(expressfee);//总价=价格+运费
							Integer ord = orderService.insertHardware(user,newAmount, c.getConfig(), c.getGoodsId(),c.getGoodsNum(),expressfee);
							//针对配件散卖做的判断
							if(c.getItemIdList().equals("Cha")){
								System.out.println();
							}else{
								orderService.insertGoodsItem(c.getItemIdList(), ord,
										c.getGoodsNum());
							}
							Order newOrder = orderBaseApiServcie.getOrderById(ord);
					
							//插入机器托管记录0为不托管标记不生成记录
							if(c.getTrustarea()==0){
								System.out.println("");
							} else {
								Tt.setGoodsId(c.getGoodsId());
								Tt.setUserId(user.getId());
								Tt.setArea(c.getTrustarea());
								Tt.setOrderId(ord);
								trusteeshipService.insertSelective(Tt);
							}
							
							//注释掉子账单
							/*orderService.insertFinancial(user, newOrder,
									FinanCanstants.TYPE_RECHARGE);*/
							// 设置为购物车的子类订单
							Batch batch = new Batch();
							batch.setOrderId(ord);
							batch.setBatchId(orderid);
							batch.setIsBatch(false);
							batch.setCreatedDate(DateUtil.getSysDate());
							//获取订单集合
							
							orderBaseApiServcie.createOrderBatch(batch);
							//更新购物车
							c.setUpdatedDate(DateUtil.getSysDate());
							c.setOrderId(orderid);
							c.setIsDelete(1);
							updateCart(c);
						}
				}
			}
			//添加总运费到总单
			Order upOrder = new Order();
			upOrder.setId(orderid);
			upOrder.setAmount(amount.add(allExpressfee));//计算总价
			upOrder.setExpressfee(allExpressfee);
			orderBaseApiServcie.updateOrder(upOrder);
			
			Order order1 = orderBaseApiServcie.getOrderById(orderid);
			// 订单类型设为5：购物车虚拟订单
			orderService.insertFinancial(user, order1, 5);
			return orderid;
		} catch (Exception e) {
			throw new I9heException("", "批量下单出现异常.", e);
		}
	}

	@Override
	public List<Cart> getListCartBy2(Integer orderId) throws I9heException {
		try {
			return cartMapper.selectListCartByOrderId(orderId);
		} catch (Exception e) {
			throw new I9heException("", "根据订单获取购买详情异常.", e);
		}
	}
	
	@Override
	public List<Cart> ListCartByUserId(Integer userId) throws I9heException{
		try {
			return cartMapper.ListCartByUserId(userId);
		} catch (Exception e) {
			throw new I9heException("", "获取数据异常.", e);
		}
	}

	@Override
	public BigDecimal getAllPrice(Integer userId)throws I9heException{
		try {
			return cartMapper.getAllPrice(userId);
		} catch (Exception e) {
			throw new I9heException("", "获取数据异常.", e);
		}
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id)throws I9heException{
		try {
			return cartMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			throw new I9heException("", "删除数据异常.", e);
		}
	}
	
	@Override
	public BigDecimal getExpressfee(Integer goodsId, Integer number,Address address) {
		BigDecimal expressfee = new BigDecimal(0);
		//非硬件订单，没有收货地址
		if(address == null){
			return expressfee;
		}else{
			if(address.getId() == null){
				return expressfee;
			}
			//获取发货地所属省分名
			String[] str = address.getRegionStructure().split("--");
			String provinceName = str[0];
			//获取商品所对应的运费模板
			ExpressfeeGoods expressfeeGoods = expressfeeGoodsMapper.selectByGoodsId(goodsId);
			//判断商品是否绑定运费模板
			if(expressfeeGoods == null){
				return expressfee;
			}
			ExpressfeeTemplateEX template = this.getTemplateById(expressfeeGoods.getExpressfeeTemplateId());
			//获取模板中每个地址所对应的的计算方式
			List<ExpressfeeType> expressfeeTypes = template.getExpressfeeTypes();
			for(ExpressfeeType expressfeeType:expressfeeTypes){
				Boolean isBreak = false;//一旦匹配到地址跳出循环
				ExpressAddress expressAddress = expressfeeType.getExpressAddress();
				String tpProvinceName = expressAddress.getProvinceName();
				if(tpProvinceName.equals("全国")){
					BigDecimal firstFee = expressfeeType.getFirstFee();
					BigDecimal addFee = expressfeeType.getAddFee();
					expressfee= addFee.multiply(new BigDecimal((number-1)/expressfeeType.getAddCount())).add(firstFee);
					break;
				}else{
					String[] provinces = tpProvinceName.split("、");
					for(String p:provinces){
						if(provinceName.equals(p)){
							BigDecimal firstFee = expressfeeType.getFirstFee();
							BigDecimal addFee = expressfeeType.getAddFee();
							expressfee= addFee.multiply(new BigDecimal((number-1)/expressfeeType.getAddCount())).add(firstFee);
							isBreak = true;
							break;
						}
					}
					if(isBreak){
						break;
					}
				}
			}
			return expressfee;
		}
	}
	
	public ExpressfeeTemplateEX getTemplateById(Integer templateId) {
		ExpressfeeTemplateEX template = expressfeeTemplateMapper.selectTemplateById(templateId);
		List<ExpressfeeType>  expressfeeTypes = expressfeeTypeMapper.selectTypeListByTemplateId(template.getId());
		for(ExpressfeeType expressfeeType:expressfeeTypes ){
			ExpressAddress expressAddress = expressAddressMapper.selectAddressListByTypeId(expressfeeType.getId());
			expressfeeType.setExpressAddress(expressAddress);
		}
		template.setExpressfeeTypes(expressfeeTypes);
		return template;
	}
	
	@Override
	public Integer updateOrderAddress(Address ad,Integer orderId) throws I9heException {
		try{
			OrderAddress oa = new OrderAddress();
			if(ad != null){
				oa.setConsigneeName(ad.getConsigneeName());
				oa.setMobile(ad.getMobile());
				oa.setOrderId(orderId);
				oa.setType(0);//0为收货地址
				oa.setRegionStructure(ad.getRegionStructure());
				oa.setStreetAddress(ad.getStreetAddress());
				Integer oaId = orderBaseApiServcie.insertOrderAddress(oa);
				//更新订单表，插入地址id
				Order neworder = new Order();
				neworder.setId(orderId);
				neworder.setAddressId(oaId);
				orderBaseApiServcie.updateOrder(neworder);
				return oaId;
			}else{
				return null;
			}
			
		}catch(Exception e){
			logger.error("插入订单地址异常");
			throw new I9heException("插入订单地址异常",e);
		}
		
	}
	
	@Override
	public Integer GetAllOrder(BigDecimal expressfee,BigDecimal Allamount,Integer userId,Integer AddressId) throws I9heException {
		try{
			Order order = new Order();
			//BigDecimal allExpressfee = new BigDecimal(0);
			order.setIsDelete(false);
			order.setUserId(userId);
			order.setAddressId(AddressId);
			order.setAmount(Allamount);
			order.setOrigAmount(Allamount);
			order.setDiscount(new BigDecimal(0));
			order.setExpressfee(expressfee);
			order.setType3(IOrderBaseApiServcie.TYPE3_TEST);
			order.setOrderTime(DateUtil.getSysDate());
			order.setState(IOrderBaseApiServcie.NON_PAYMENT);
			order.setUpdatedDate(DateUtil.getSysDate());
			order.setCreatedDate(DateUtil.getSysDate());
			order.setIsComment(0);
			order.setType1(IOrderBaseApiServcie.TYPE1_HARDWARE);
			order.setType2(IOrderBaseApiServcie.TYPE2_CART);
			// 生成一个总的假订单
			Integer orderid = orderBaseApiServcie.createOrder(order);
			Batch ba = new Batch();
			ba.setOrderId(orderid);
			ba.setIsBatch(true);
			ba.setBatchId(orderid);
			ba.setCreatedDate(DateUtil.getSysDate());
			orderBaseApiServcie.createOrderBatch(ba);
			return orderid;
		}catch(Exception e){
			logger.error("插入总单异常");
			throw new I9heException("插入总单异常",e);
		}
	} 
	
	@Override
	public Integer GetInvoice(Integer orderid,Integer userId,String header,String content,String remark,Integer zzId) throws I9heException{
		
		try{
			Invoices invoices = new Invoices();
			if(zzId==0){
				invoices.setContent(content);
				invoices.setUserId(userId);
				invoices.setCreatedTime(new Date());
				invoices.setHeader(header);
				invoices.setRemark(remark);
				invoices.setType(0);
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
			}
			invoices.setOrderId(orderid);
			int Inv = InvoicesService.insert(invoices);
			return Inv;
			
		}catch(Exception e){
			logger.error("插入发票异常");
			throw new I9heException("插入发票异常",e);
		}
		
	}
	
	@Override
	public Integer GetBatchSon(Integer orderid,Integer batch,boolean flag) throws I9heException{
		try{
			Batch ba = new Batch();
			ba.setOrderId(orderid);
			ba.setIsBatch(flag);
			ba.setBatchId(batch);
			ba.setCreatedDate(DateUtil.getSysDate());
			int bat = orderBaseApiServcie.createOrderBatch(ba);
			return bat;
		}catch(Exception e){
			logger.error("插入子单异常");
			throw new I9heException("插入子单异常",e);
		}
	}
	
	@Override
	public Integer GetTruArea(Integer userId,Integer goodsId,Integer area,Integer trustId,Integer orderId) throws I9heException{
		try{
			
			TruDatacenter td = trudatacentermapper.selectByPrimaryKey(trustId);
			
			Trusteeship Tt = new Trusteeship();
			Tt.setGoodsId(Integer.valueOf(goodsId));
			Tt.setTrustName(td.getTruname());
			Tt.setUserId(userId);
			Tt.setTrustId(trustId);
			Tt.setArea(Integer.valueOf(area));
			Tt.setOrderId(orderId);
			int tru = trusteeshipService.insertSelective(Tt);
			return tru;
		}catch(Exception e){
			logger.error("插入硬件地区绑定异常");
			throw new I9heException("插入硬件地区绑定异常",e);
		}
	}	
}
