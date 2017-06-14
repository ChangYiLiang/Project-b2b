package com.i9he.m2b.server.biz.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.ObjectUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heAssert;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.PurchaseRequirementAdditionMapper;
import com.i9he.m2b.mapper.PurchaseRequirementGoodsMapper;
import com.i9he.m2b.mapper.PurchaseRequirementMapper;
import com.i9he.m2b.mapper.PurchaseRequirementOfferMapper;
import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementAddition;
import com.i9he.m2b.model.PurchaseRequirementGoods;
import com.i9he.m2b.model.PurchaseRequirementOffer;
import com.i9he.m2b.model.search.PurchaseRequirementSearchModel;
import com.i9he.m2b.server.biz.IPurchaseService;
import com.i9he.m2b.util.SessionUtil;

@Service
public class PurchaseService implements IPurchaseService {

	@Autowired
	private PurchaseRequirementMapper requirementMapper;

	@Autowired
	private PurchaseRequirementGoodsMapper requirementGoodsMapper;

	@Autowired
	private PurchaseRequirementAdditionMapper requirementAdditionMapper;
	
	@Autowired
	private PurchaseRequirementOfferMapper requirementOfferMapper;

	@Override
	public Integer createRequirement(PurchaseRequirement requirement, List<PurchaseRequirementGoods> goods, List<PurchaseRequirementAddition> files) throws I9heException {
		requirement.setCreateTime(new Date());
		requirement.setState(B2BConstants.PURCHASE_REQUIREMENT_STATE_UNPROCESS);
		if (SessionUtil.getSessionUser() != null) {
			requirement.setUserId(SessionUtil.getSessionUser().getId());
		}
		int count = requirementMapper.insert(requirement);

		if (goods != null) {
			for (PurchaseRequirementGoods g : goods) {
				if (g == null) {
					continue;
				}
				g.setRequirementId(requirement.getId());
				count += requirementGoodsMapper.insertSelective(g);
			}
		}

		if (files != null) {
			for (PurchaseRequirementAddition f : files) {
				if (f == null) {
					continue;
				}
				f.setRequirementId(requirement.getId());
				count += requirementAdditionMapper.insertSelective(f);
			}
		}
		return count;
	}

	@Override
	public List<PurchaseRequirement> getRequirements(Integer userId) throws I9heException {
		PurchaseRequirementSearchModel searchModel = new PurchaseRequirementSearchModel();
		searchModel.setPageSize(30);
		searchModel.setUserId((Integer) ObjectUtils.defaultIfNull(userId, 0));
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		return requirementMapper.selectBySearchModel(searchModel, rowBounds);
	}

	@Override
	public PurchaseRequirement getRequirement(Integer id) throws I9heException {
		PurchaseRequirement requirement = requirementMapper.selectByPrimaryKey(id);
		I9heAssert.assertEquals(SessionUtil.getSessionUser().getId(), requirement.getUserId(), "获取采购报价单出错");
		return requirement;
	}

	@Override
	public List<PurchaseRequirementGoods> getRequirementGoods(Integer requirementId) throws I9heException {
		return requirementGoodsMapper.selectByRequirementId(requirementId);
	}

	@Override
	public List<PurchaseRequirementAddition> getRequirementAdditions(Integer requirementId) throws I9heException {
		return requirementAdditionMapper.selectByRequirementId(requirementId);
	}

	@Override
	public PurchaseRequirementOffer getRequirementOffer(Integer requirementId) throws I9heException {
		return requirementOfferMapper.selectByRequirementId(requirementId);
	}

}
