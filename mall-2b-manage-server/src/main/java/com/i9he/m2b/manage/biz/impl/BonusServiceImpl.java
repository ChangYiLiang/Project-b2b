package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IBonusService;
import com.i9he.m2b.manage.utils.SimpleLogger;
import com.i9he.m2b.mapper.BonusMapper;
import com.i9he.m2b.model.Bonus;

@Service
public class BonusServiceImpl implements IBonusService {
	
	private static final Logger logger = Logger.getLogger(TagServiceImpl.class);

	@Autowired
	private BonusMapper bonusMapper;
	
	@Override
	@SimpleLogger("获取节操券列表")
	public List<Bonus> getallbonus() throws I9heException {
		return bonusMapper.getallbouns();
	}
	
	@Override
	@SimpleLogger("插入节操券")
	public int insertSelective(Bonus record) throws I9heException{
		return bonusMapper.insertSelective(record);
	}
	
	@Override
	@SimpleLogger("查询某个节操券")
	public Bonus selectByPrimaryKey(Integer typeId) throws I9heException{
		return bonusMapper.selectByPrimaryKey(typeId);
	}
	
	@Override
	@SimpleLogger("修改某个节操券")
	public int updateByPrimaryKeySelective(Bonus record) throws I9heException{
		return bonusMapper.updateByPrimaryKeySelective(record);
	}

}