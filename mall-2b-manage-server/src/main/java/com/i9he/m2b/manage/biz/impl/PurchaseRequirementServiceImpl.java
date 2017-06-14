package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IPurchaseRequirementService;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.manage.utils.SimpleLogger;
import com.i9he.m2b.mapper.PurchaseRequirementAdditionMapper;
import com.i9he.m2b.mapper.PurchaseRequirementGoodsMapper;
import com.i9he.m2b.mapper.PurchaseRequirementMapper;
import com.i9he.m2b.mapper.PurchaseRequirementOfferMapper;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementAddition;
import com.i9he.m2b.model.PurchaseRequirementGoods;
import com.i9he.m2b.model.PurchaseRequirementOffer;
import com.i9he.m2b.model.search.PurchaseRequirementSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

@Service
public class PurchaseRequirementServiceImpl implements IPurchaseRequirementService {
	
	@Autowired
	private PurchaseRequirementMapper requirementMapper;

	@Autowired
	private PurchaseRequirementGoodsMapper requirementGoodsMapper;

	@Autowired
	private PurchaseRequirementAdditionMapper requirementAdditionMapper;
	
	@Autowired
	private PurchaseRequirementOfferMapper requirementOfferMapper;

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@Override
	@SimpleLogger("查询采购需求")
	public List<PurchaseRequirement> searchRequirement(PurchaseRequirementSearchModel searchModel) throws I9heException {
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		if (StringUtils.isNotBlank(searchModel.getKeyword())) {
			List<Integer> userList = privilegeBaseApiService.getIdByUsername(searchModel.getKeyword());
			searchModel.setUserList(userList);
		}
		int total = requirementMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		List<PurchaseRequirement> list = requirementMapper.selectBySearchModel(searchModel, rowBounds);
		return list;
	}

	@Override
	@SimpleLogger("获取采购需求")
	public PurchaseRequirement getRequirement(Integer id) throws I9heException {
		return requirementMapper.selectByPrimaryKey(id);
	}

	@Override
	@SimpleLogger("获取采购需求附件")
	public List<PurchaseRequirementAddition> getRequirementAdditions(Integer requirementId) throws I9heException {
		return requirementAdditionMapper.selectByRequirementId(requirementId);
	}

	@Override
	@SimpleLogger("查询采购需求商品列表")
	public List<PurchaseRequirementGoods> getRequirementGoods(Integer requirementId) throws I9heException {
		return requirementGoodsMapper.selectByRequirementId(requirementId);
	}

	@Override
	@SimpleLogger("获取采购需求报价")
	public PurchaseRequirementOffer getRequirementOffer(Integer requirementId) throws I9heException {
		return requirementOfferMapper.selectByRequirementId(requirementId);
	}

	@Override
	@SimpleLogger("保存采购需求报价")
	public Integer saveRequirementOffer(PurchaseRequirementOffer offer) throws I9heException {
		Integer count = 0;
		if (offer.getId() == null) {
			offer.setCreateTime(new Date());
			offer.setCreateUser(SessionUtil.getSessionUserId());
			count = requirementOfferMapper.insertSelective(offer);
		} else {
			offer.setUpdateTime(new Date());
			offer.setUpdateUser(SessionUtil.getSessionUserId());
			count = requirementOfferMapper.updateByPrimaryKeySelective(offer);
		}
		PurchaseRequirement requirement = requirementMapper.selectByPrimaryKey(offer.getRequirementId());
		if (B2BConstants.PURCHASE_REQUIREMENT_STATE_UNPROCESS.equals(requirement.getState())) {
			requirement = new PurchaseRequirement();
			requirement.setId(offer.getRequirementId());
			requirement.setState(B2BConstants.PURCHASE_REQUIREMENT_STATE_PROCESSED);
			requirementMapper.updateByPrimaryKeySelective(requirement);
		}
		// TODO: 推用户送站内信
		return count;
	}
}
