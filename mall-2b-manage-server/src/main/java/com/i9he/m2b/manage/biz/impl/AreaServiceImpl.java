package com.i9he.m2b.manage.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAreaService;
import com.i9he.m2b.manage.utils.SimpleLogger;
import com.i9he.m2b.mapper.AreaMapper;
import com.i9he.m2b.model.Area;

@Service
public class AreaServiceImpl implements IAreaService {
	
	private static final Logger logger = Logger.getLogger(TagServiceImpl.class);

	@Autowired
	private AreaMapper areaMapper;
	
	@Override
	@SimpleLogger("获取地区列表")
	public List<Area> getallArea() throws I9heException {
		return areaMapper.getallArea();
	}
	
	@Override
	@SimpleLogger("插入地区")
	public int insertSelective(Area record) throws I9heException{
		return areaMapper.insertSelective(record);
	}
	
	@Override
	@SimpleLogger("修改地区")
	public int updateByPrimaryKeySelective(Area record) throws I9heException{
		return areaMapper.updateByPrimaryKey(record);
	}
	
}