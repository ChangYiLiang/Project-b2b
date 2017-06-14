package com.i9he.m2b.manage.biz.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Transformer;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.common.util.PropertyTransformer;
import com.i9he.m2b.manage.biz.IAfterSaleService;
import com.i9he.m2b.manage.model.AfterSaleViewModel;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.mapper.AfterSaleMapper;
import com.i9he.m2b.mapper.AfterSaleRecordMapper;
import com.i9he.m2b.mapper.AfterSaleRefundMapper;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.HistoryOrderMapper;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.search.AfterSaleSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

@Service
public class AfterSaleServiceImpl implements IAfterSaleService {

	private static final Logger logger = Logger.getLogger(AfterSaleServiceImpl.class);

	@Autowired
	private AfterSaleMapper afterSaleMapper;
	@Autowired
	private Goods2bMapper goodsMapper;
	@Autowired
	private AfterSaleRecordMapper afterSaleRecordMapper;
	@Autowired
	private AfterSaleRefundMapper afterSaleRefundMapper;

	// API Service
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@Override
	public List<AfterSale> searchAfterSale(AfterSaleSearchModel searchModel) {
		int total = afterSaleMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		List<AfterSale> list = afterSaleMapper.selectBySearchModel(searchModel, rowBounds);
		Collection<Integer> userList = CollectionUtils.collect(list, new PropertyTransformer("userId", 0));
		Map<Integer, String> users = privilegeBaseApiService.getUsernameMap(new ArrayList<Integer>(userList));
		CollectionUtils.transform(list, new AfterSaleTransformer(users));
		return list;
	}

	@Override
	public AfterSale getAfterSale(Integer id) throws I9heException {
		return afterSaleMapper.selectMoreByPrimaryKey(id);
	}

	@Override
	public void saveAfterSale(AfterSale afterSale) throws I9heException {
		AfterSale afs = afterSaleMapper.selectByPrimaryKey(afterSale.getId());
		if(afs.getProcessTime() == null) {
			afterSale.setProcessTime(new Date());
		}
		if (afs.getProcessUserId() == null) {
			afterSale.setProcessUserId(SessionUtil.getSessionUserId());
		}
		afterSale.setLastProcessUserId(SessionUtil.getSessionUserId());
		afterSale.setLastProcessTime(new Date());
		afterSaleMapper.updateByPrimaryKeySelective(afterSale);
	}

	private class AfterSaleTransformer implements Transformer {

		private final Map<Integer, String> users;

		public AfterSaleTransformer(Map<Integer, String> users) {
			if (users != null) {
				this.users = users;
			} else {
				this.users = new HashMap<Integer, String>();
			}
			
		}

		@Override
		public Object transform(Object obj) {
			AfterSaleViewModel model = new AfterSaleViewModel();
			try {
				PropertyUtils.copyProperties(model, obj);
				model.setUsername(users.get(model.getUserId()));
				if (model.getUsername() == null) {
					privilegeBaseApiService.getUsernameMap(Arrays.asList(model.getUserId())).get(model.getUserId());
				}
				Goods goods = goodsMapper.selectByPrimaryKey(model.getGoodsId());
				if (goods != null) {
					model.setGoodsName(goods.getGoodsName());
				}
			} catch (Exception e) {
				logger.error("转换售后数据异常", e);
				return obj;
			}
			return model;
		}

	}

	@Override
	public void insertAfterSaleRecord(Integer afsId, String details) throws I9heException {
		String ip = SessionUtil.getRemoteAddr();
		Integer serviceUserId = SessionUtil.getSessionUserId();
		AfterSaleRecord record = new AfterSaleRecord();
		record.setAfterSaleId(afsId);
		record.setCreateTime(new Date());
		record.setDetails(details);
		record.setIp(ip);
		record.setServiceUserId(serviceUserId);
		afterSaleRecordMapper.insert(record);
	}

	@Override
	public void saveAfterSaleRefundMoney(AfterSaleRefund refund) throws I9heException {
		refund.setConfirmRefundTime(new Date());
		refund.setConfirmRefundUserId(SessionUtil.getSessionUserId());
		
		afterSaleRefundMapper.updateByPrimaryKeySelective(refund);
	}

	@Override
	public List<AfterSaleRecord> getAfterSaleRecords(Integer afsId) throws I9heException {
		return afterSaleRecordMapper.selectByAfterSaleId(afsId);
	}
}
