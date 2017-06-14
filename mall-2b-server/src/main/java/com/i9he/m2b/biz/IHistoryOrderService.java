package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.model.HistoryOrder;

public interface IHistoryOrderService {
	
	public int insert(HistoryOrder historyOrder);
	
	public HistoryOrder findByOrderId(Integer orderId);
	
	public int update(HistoryOrder historyOrder);
	
	public List<HistoryOrder> findOrderListByUserId();

}
