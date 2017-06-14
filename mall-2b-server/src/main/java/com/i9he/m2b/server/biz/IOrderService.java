package com.i9he.m2b.server.biz;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Goods;
import com.i9he.ord.model.Order;

public interface IOrderService {

	Order getUserOrder(Integer orderId) throws I9heException;

	Goods getOrderGoods(Integer orderId, Integer goodsId) throws I9heException;

}
