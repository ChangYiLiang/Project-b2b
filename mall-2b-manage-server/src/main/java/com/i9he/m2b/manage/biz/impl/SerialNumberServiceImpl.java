package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.ISerialNumberService;
import com.i9he.m2b.mapper.SerialNumberMapper;
import com.i9he.m2b.model.SerialNumber;
import com.i9he.m2b.model.search.SerialSearchModel;
@Service("serialNumberService")
public class SerialNumberServiceImpl implements ISerialNumberService {

	@Autowired
	private SerialNumberMapper serialNumberMapper;
	@Override
	public int insert(SerialNumber serialNumber) {
		return serialNumberMapper.insertSelective(serialNumber);
	}

	@Override
	public int update(SerialNumber serialNumber) {
		return serialNumberMapper.updateByPrimaryKeySelective(serialNumber);
	}

	@Override
	public List<SerialNumber> getAll(SerialSearchModel ssm) {
		RowBounds rs = new RowBounds(ssm.getOffset(),ssm.getLimit());
		List<SerialNumber> list = serialNumberMapper.getAll(ssm, rs);
		int total = serialNumberMapper.getCount(ssm);
		ssm.setTotal(total);
		return list;
	}

	@Override
	public SerialNumber findById(String id) {
		return serialNumberMapper.selectByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public SerialNumber searchModel(String id) {
		return serialNumberMapper.getSerialNumberModel(Integer.parseInt(id));
	}

}
