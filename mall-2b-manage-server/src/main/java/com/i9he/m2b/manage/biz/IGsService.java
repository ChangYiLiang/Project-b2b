package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.search.GsSearchModel;

public interface IGsService {
	
	public List<SyUser> getUserList(GsSearchModel gsm);
	
	public List<HistoryOrder> getOrderList(GsSearchModel gsm);
	
	public HistoryOrder findById(Integer id);
	
	public int update(HistoryOrder historyOrder);
	
	public String returnGoods(Integer orderId, String money)throws I9heException;

}
