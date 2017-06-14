package com.i9he.m2b.server.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementAddition;
import com.i9he.m2b.model.PurchaseRequirementGoods;
import com.i9he.m2b.model.PurchaseRequirementOffer;

public interface IPurchaseService {

	/**
	 * 创建采购需求
	 * @param requirement
	 * @param goods
	 * @param files
	 * @return
	 * @throws I9heException
	 */
	public Integer createRequirement(PurchaseRequirement requirement, List<PurchaseRequirementGoods> goods, List<PurchaseRequirementAddition> files) throws I9heException;

	/**
	 * 获取用户采购需求单
	 * @param userId
	 * @return
	 * @throws I9heException
	 */
	public List<PurchaseRequirement> getRequirements(Integer userId) throws I9heException;
	
	/**
	 * 获取采购需求单
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public PurchaseRequirement getRequirement(Integer id) throws I9heException;
	
	/**
	 * 获取采购商品
	 * @param requirementId
	 * @return
	 * @throws I9heException
	 */
	public List<PurchaseRequirementGoods> getRequirementGoods(Integer requirementId) throws I9heException;
	
	/**
	 * 获取采购需求附件
	 * @param requirementId
	 * @return
	 * @throws I9heException
	 */
	public List<PurchaseRequirementAddition> getRequirementAdditions(Integer requirementId) throws I9heException;
	
	/**
	 * 获取采购报价(获取最后一条)
	 * @param requirementId
	 * @return
	 * @throws I9heException
	 */
	public PurchaseRequirementOffer getRequirementOffer(Integer requirementId) throws I9heException;
	
}
