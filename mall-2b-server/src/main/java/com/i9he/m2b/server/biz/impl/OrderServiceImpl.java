package com.i9he.m2b.server.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heAssert;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.server.biz.IOrderService;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private Goods2bMapper goodsMapper;
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiService;
	
	@Override
	public Order getUserOrder(Integer orderId) throws I9heException {
		Order order = orderBaseApiService.getOrderById(orderId);
		I9heAssert.assertEquals(SessionUtil.getSessionUserID(), order.getUserId(), "获取用户订单失败");
		return order;
	}

	@Override
	public Goods getOrderGoods(Integer orderId, Integer goodsId) throws I9heException {
		OrderGoods goods = orderBaseApiService.getOrderGoodsByOrderId(orderId);
		I9heAssert.assertEquals(goodsId, goods.getGoodsId(), "该订单未购买该商品");
		return goodsMapper.selectByPrimaryKey(goodsId);
	}

}
