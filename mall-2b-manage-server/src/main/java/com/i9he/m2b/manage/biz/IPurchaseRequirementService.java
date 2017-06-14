package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementAddition;
import com.i9he.m2b.model.PurchaseRequirementGoods;
import com.i9he.m2b.model.PurchaseRequirementOffer;
import com.i9he.m2b.model.search.PurchaseRequirementSearchModel;

public interface IPurchaseRequirementService {

	public List<PurchaseRequirement> searchRequirement(PurchaseRequirementSearchModel searchModel) throws I9heException;

	public PurchaseRequirement getRequirement(Integer id) throws I9heException;

	public List<PurchaseRequirementAddition> getRequirementAdditions(Integer requirementId) throws I9heException;

	public List<PurchaseRequirementGoods> getRequirementGoods(Integer requirementId) throws I9heException;

	public PurchaseRequirementOffer getRequirementOffer(Integer requirementId) throws I9heException;

	public Integer saveRequirementOffer(PurchaseRequirementOffer offer) throws I9heException;
	
}
