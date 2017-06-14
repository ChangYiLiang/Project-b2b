package com.i9he.m2b.manage.biz.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.manage.biz.IConcernService;
import com.i9he.m2b.mapper.ConcernMapper;
import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.InterestedModel;
import com.i9he.m2b.model.search.ConcernSearchModel;
@Service("concernServie")
public class ConcernServiceImpl implements IConcernService {
	@Autowired
	private ConcernMapper concernMapper;

	@Override
	public List<Concern> getList(ConcernSearchModel csm) {
		RowBounds rs = new RowBounds(csm.getOffset(),csm.getLimit());
		List<Concern> list = concernMapper.getConcernGoodsList(csm, rs);
		int total = concernMapper.getTotal(csm);
		csm.setTotal(total);
		return list;
	}

	@Override
	public List<InterestedModel> getInterestedModel() {
		return concernMapper.getInterestedModel();
	}

}
