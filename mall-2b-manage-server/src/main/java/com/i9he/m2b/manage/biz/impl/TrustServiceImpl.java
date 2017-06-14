package com.i9he.m2b.manage.biz.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAreaService;
import com.i9he.m2b.manage.biz.ITrustService;
import com.i9he.m2b.manage.utils.SimpleLogger;
import com.i9he.m2b.mapper.AreaMapper;
import com.i9he.m2b.mapper.TruDatacenterMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.TruDatacenter;

@Service
public class TrustServiceImpl implements ITrustService {
	
	private static final Logger logger = Logger.getLogger(TagServiceImpl.class);

	@Autowired
	private TruDatacenterMapper trudatacenterMapper;
	
	@Override
	@SimpleLogger("绑定区域机房")
	public int insertSelective(TruDatacenter record) throws I9heException {
		return trudatacenterMapper.insertSelective(record);
	}
	
	@Override
	@SimpleLogger("展示区域机房")
	public List<TruDatacenter> getjointru() throws I9heException {
		return trudatacenterMapper.getjointru();
	}
	
	@Override
	@SimpleLogger("某个区域机房")
	public TruDatacenter selectByPrimaryKey(Integer id) throws I9heException{
		return trudatacenterMapper.selectByPrimaryKey(id);
	}
	
	@Override
	@SimpleLogger("修改区域机房")
	public int updateByPrimaryKeySelective(TruDatacenter record) throws I9heException{
		return trudatacenterMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	@SimpleLogger("寻找区域下的机房")
	public List<TruDatacenter> gettrucity(Integer id) throws I9heException{
		return trudatacenterMapper.gettrucity(id);
	}
	
}