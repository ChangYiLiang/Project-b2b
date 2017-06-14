package com.i9he.m2b.biz;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Shipping;




public interface IShippingService {

	/**
	 * 根据订单orderIdID获取物流
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Shipping getShippingByOrderId(Integer orderId)throws I9heException;

	/**
	 * 更新物流信息
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public int updateByPrimaryKeySelective(Shipping shipping)throws I9heException;
}
