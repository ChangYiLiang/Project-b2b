package com.i9he.m2b.server.biz.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.BonusMapper;
import com.i9he.m2b.model.Bonus;
import com.i9he.m2b.server.biz.IBonusService;

@Service
public class BonusService implements IBonusService {

	@Autowired
	private BonusMapper bonusMapper;

	@Override
	public List<Bonus> getBonusOne(Integer userId) throws I9heException{
		return bonusMapper.getBonusOne(userId);
	}
	
	@Override
	public List<Bonus> getBonusTwo(Integer userId) throws I9heException{
		return bonusMapper.getBonusTwo(userId);
	}

	@Override
	public List<Bonus> getBonusThree(Integer userId) throws I9heException{
		return bonusMapper.getBonusThree(userId);
	}
	
	@Override
	public List<Bonus> cangetbonus() throws I9heException{
		return bonusMapper.cangetbonus();
	}
	
	@Override
	public int upgetnum(Integer typeId) throws I9heException{
		return bonusMapper.upgetnum(typeId);
	}
	
	@Override
	public Bonus checknum(Integer typeId) throws I9heException{
		return bonusMapper.checknum(typeId);
	}
	
}