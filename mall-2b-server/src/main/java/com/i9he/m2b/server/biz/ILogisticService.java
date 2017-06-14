package com.i9he.m2b.server.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.LogisticsDetail;
import com.i9he.m2b.model.LogisticsInfo;
import com.i9he.m2b.model.LogisticsViewModel;

public interface ILogisticService {

	/***
	 * 添加物流记录
	 * @param logisticsInfo
	 * @param logisticsDetails
	 * @return 
	 * @throws I9heException 
	 */
	public int addLogistics(LogisticsInfo logisticsInfo,List<LogisticsDetail> logisticsDetails) throws I9heException;

	/***
	 * 根据物流单号查物流
	 * @param expNo
	 * @return
	 * @throws I9heException 
	 */
	public LogisticsViewModel getLogisticByCode(String expNo) throws I9heException;
	
}
