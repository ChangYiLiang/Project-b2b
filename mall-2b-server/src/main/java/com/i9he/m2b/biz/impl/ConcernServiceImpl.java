package com.i9he.m2b.biz.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.m2b.biz.IConcernService;
import com.i9he.m2b.mapper.ConcernMapper;
import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.search.ConcernSearchModel;
import com.i9he.m2b.util.SessionUtil;
@Service("concernService")
public class ConcernServiceImpl implements IConcernService {
     
	@Autowired
	private ConcernMapper concernMapper;
	@Override
	public List<Concern> getConcernList(ConcernSearchModel csm) {
		RowBounds rb = new RowBounds(csm.getOffset(),csm.getLimit());
		List<Concern> concernList = concernMapper.getConcernGoodsList(csm, rb);
		int total = concernMapper.getTotal(csm);
		csm.setTotal(total);
		return concernList;
	}
	@Override
	public int cancelConcern(String concernId) {
		Concern cn = new Concern();
		cn.setId(Integer.parseInt(concernId));
		cn.setStatus((byte)0);
		cn.setRemindStatus((byte)0);
		return concernMapper.updateByPrimaryKeySelective(cn);
	}
	@Override
	public int updateRemind(Concern concern) {
		return concernMapper.updateByPrimaryKeySelective(concern);
	}
	@Override
	public int addConcern(Concern concern,String state) {
		Integer userId = SessionUtil.getSessionUser().getId();
		concern.setUserId(userId);  
		concern.setCreateTime(new Date());
		Byte b1= 1;
		concern.setStatus(b1);
		if(state!=null){
			concern.setRemindStatus(Byte.valueOf("0"));
		}else{
			concern.setRemindStatus(b1);
		}
		Concern c = concernMapper.isConcern(concern);
		if(c!=null){
			concern.setId(c.getId());
			return concernMapper.updateByPrimaryKeySelective(concern);
		}
		return concernMapper.insertSelective(concern);
	}
	@Override
	public Concern isConcern(Concern concern) {
		Integer userId = SessionUtil.getSessionUser().getId();
		concern.setUserId(userId);
		return concernMapper.isConcern(concern);
	}
	@Override
	public int concernCount() {
		Integer userId = SessionUtil.getSessionUser().getId();
		return concernMapper.concernCount(userId);
	}
	@Override
	public Concern isRemind(Concern concern) {
		Integer userId = SessionUtil.getSessionUser().getId();
		concern.setUserId(userId);
		return concernMapper.isRemind(concern);
	}
	
	

}
