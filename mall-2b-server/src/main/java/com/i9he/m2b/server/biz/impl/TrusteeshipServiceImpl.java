package com.i9he.m2b.server.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.TrusteeshipMapper;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.server.biz.ITrusteeshipService;

@Service
public class TrusteeshipServiceImpl implements ITrusteeshipService {
	
	@Autowired
	private TrusteeshipMapper trusteeshipMapper;
	
	@Override
	public int insertSelective(Trusteeship record) throws I9heException {
		return trusteeshipMapper.insertSelective(record);
	}

}