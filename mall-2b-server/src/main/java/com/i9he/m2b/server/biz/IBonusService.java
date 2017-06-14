package com.i9he.m2b.server.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Bonus;


public interface IBonusService {

	/**
	 * 未使用的节操券
	 * @param userId
	 * @throws I9heException
	 */
	public List<Bonus> getBonusOne(Integer userId) throws I9heException;
	
	/**
	 * 已使用的节操券
	 * @param userId
	 * @throws I9heException
	 */
	public List<Bonus> getBonusTwo(Integer userId) throws I9heException;
	
	/**
	 * 已过期的节操券
	 * @param userId
	 * @throws I9heException
	 */
	public List<Bonus> getBonusThree(Integer userId) throws I9heException;
	
	/**
	 * 可以领取的节操券
	 * @throws I9heException
	 */
	public List<Bonus> cangetbonus() throws I9heException;
	
	/**
	 * 更新已领取的数量
	 * @throws I9heException
	 * */
	public int upgetnum(Integer typeId) throws I9heException;
	
	/**
	 * 检查是否相等
	 * @throws I9heException
	 * */
	public Bonus checknum(Integer typeId) throws I9heException;
}