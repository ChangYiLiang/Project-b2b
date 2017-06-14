package com.i9he.m2b.server.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.AreaMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.server.biz.IAreaService;

@Service
public class AreaServiceImpl implements IAreaService {
	
	@Autowired
	private AreaMapper areaMapper;
	
	@Override
	public List<Area> getallArea() throws I9heException {
		return areaMapper.getallArea();
	}

}