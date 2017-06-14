package com.i9he.m2b.server.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Trusteeship;


public interface ITrusteeshipService {

	public int insertSelective(Trusteeship record) throws I9heException;
	
}