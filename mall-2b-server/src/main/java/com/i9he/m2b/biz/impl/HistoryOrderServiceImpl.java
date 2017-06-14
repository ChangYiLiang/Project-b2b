package com.i9he.m2b.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IHistoryOrderService;
import com.i9he.m2b.mapper.HistoryOrderMapper;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.util.SessionUtil;
@Service("historyOrderService")
public class HistoryOrderServiceImpl implements IHistoryOrderService {
	@Autowired
	private HistoryOrderMapper historyOrderMapper;
	@Override
	public int insert(HistoryOrder historyOrder) {
		return historyOrderMapper.insertSelective(historyOrder);
	}

	@Override
	public HistoryOrder findByOrderId(Integer orderId) {
		return historyOrderMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public int update(HistoryOrder historyOrder) {
		// TODO Auto-generated method stub
		return historyOrderMapper.updateByPrimaryKeySelective(historyOrder);
	}

	@Override
	public List<HistoryOrder> findOrderListByUserId() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return historyOrderMapper.findOrderListByUserId(userId);
	}

}
