package com.i9he.m2b.server.biz.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.LogisticsDetailMapper;
import com.i9he.m2b.mapper.LogisticsInfoMapper;
import com.i9he.m2b.model.LogisticsDetail;
import com.i9he.m2b.model.LogisticsInfo;
import com.i9he.m2b.model.LogisticsViewModel;
import com.i9he.m2b.server.biz.ILogisticService;

@Service
public class LogisticServiceImpl implements ILogisticService{
	
	public static final Logger logger = Logger.getLogger(LogisticServiceImpl.class);
	
	@Autowired
	private LogisticsInfoMapper logisticsInfoMapper;
	@Autowired
	private LogisticsDetailMapper logisticsDetailMapper;

	@Override
	public int addLogistics(LogisticsInfo logisticsInfo,List<LogisticsDetail> logisticsDetails) throws I9heException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logCode = logisticsInfo.getLogisticCode();
		try{
			//首先判断数据库中是否有该物流记录
			LogisticsInfo isExist = logisticsInfoMapper.selectByLogCode(logisticsInfo.getLogisticCode());
			if(isExist == null){
				//插入物流信息
				logisticsInfoMapper.insertSelective(logisticsInfo);
				//插入物流详情
				for(LogisticsDetail ld :logisticsDetails){
					ld.setLogisticCode(logisticsInfo.getLogisticCode());
					logisticsDetailMapper.insertSelective(ld);
				}
				logger.info("[物流单号:"+logCode+"]插入物流记录");
			}else{
				logisticsInfoMapper.updateByPrimaryKeySelective(logisticsInfo);
				int count = logisticsDetailMapper.selectCountByLogCode(logisticsInfo.getLogisticCode());
				for(int i=0; i<logisticsDetails.size();i++){
					//插入最新更新的物流记录
					if(i>=count){
						logisticsDetails.get(i).setLogisticCode(logisticsInfo.getLogisticCode());
						logisticsDetailMapper.insertSelective(logisticsDetails.get(i));
					}
				}
				logger.info("[物流单号:"+logCode+"]更新物流记录");
			}
			return 1;
		}catch(Exception e){
			logger.error("[物流单号:"+logCode+"]添加物流记录异常");
			throw new I9heException("添加物流记录异常", e);
		}
		
	}

	@Override
	public LogisticsViewModel getLogisticByCode(String code) throws I9heException {
		try{
			LogisticsViewModel Logistics = logisticsInfoMapper.selectLogisticByCode(code);
			if(Logistics != null){
				List<LogisticsDetail> LogisticsDetails = logisticsDetailMapper.selectLogisticsByCode(Logistics.getLogisticCode());
				Logistics.setLogisticsDetails(LogisticsDetails);
			}
			return Logistics;
		}catch(Exception e){
			logger.error("查询物流详情异常");
			throw new I9heException("查询物流详情异常", e);
		}
		
	}
}
