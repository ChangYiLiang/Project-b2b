package com.i9he.m2b.biz.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IShippingService;
import com.i9he.m2b.mapper.Shipping2bMapper;
import com.i9he.m2b.model.Shipping;

@Service("shippingService")
public class ShippingServiceImpl implements IShippingService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private Shipping2bMapper shippingMapper;

	@Override
	public Shipping getShippingByOrderId(Integer orderId) throws I9heException {
		Shipping shipping;
		try {
			shipping =	shippingMapper.selectShippingByOrderId(orderId);
			return shipping;
		} catch (Exception e) {
			logger.error("根据订单id["+orderId+"]查询物流异常");
			throw new I9heException("根据订单id["+orderId+"]查询物流异常", e);
		}
	}

	@Override
	public int updateByPrimaryKeySelective(Shipping shipping)throws I9heException {
		try {
			return shippingMapper.updateByPrimaryKeySelective(shipping);
		} catch (Exception e) {
			logger.error("根据更新物流异常");
			throw new I9heException("根据更新物流异常", e);
		}
	}
	
	

	
	
}
