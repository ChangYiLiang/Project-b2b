package com.i9he.m2b.server.biz.impl;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.ObjectUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heAssert;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.mapper.AfterSaleMapper;
import com.i9he.m2b.mapper.AfterSaleRecordMapper;
import com.i9he.m2b.mapper.AfterSaleRefundMapper;
import com.i9he.m2b.mapper.AfterSaleShippingMapper;
import com.i9he.m2b.mapper.HistoryOrderMapper;
import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleExample;
import com.i9he.m2b.model.AfterSaleRecord;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.AfterSaleShipping;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.search.SimpleSearchModel;
import com.i9he.m2b.server.biz.IAfterSaleService;
import com.i9he.m2b.util.B2BConstrant;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.ThreadContextHolder;

@Service
public class AfterSaleServiceImpl implements IAfterSaleService {
	// 售后申请单编号: 1{type}{申请时间}{流水号}
	private static final String AFS_NO_FORMAT = "1{0}yyMMddHHmmssSSS{1}";
	
	private static int Ticks = 0;
	
	private static final Object SyncObject = new Object();

	@Autowired
	private AfterSaleMapper afterSaleMapper;
	@Autowired
	private AfterSaleRefundMapper refundMapper;
	@Autowired
	private AfterSaleShippingMapper shippingMapper;
	@Autowired
	private AfterSaleRecordMapper recordMapper;
	@Autowired
	private HistoryOrderMapper historyOrderMapper;
	
	@Override
	public void apply(AfterSale afterSale, AfterSaleRefund refund, AfterSaleShipping shipping) throws I9heException {
		AfterSaleExample example = new AfterSaleExample();
		example.createCriteria()
			   .andOrderIdEqualTo(afterSale.getOrderId())
			   .andGoodsIdEqualTo(afterSale.getGoodsId())
			   .andStateEqualTo(B2BConstants.AFS_STATE_REFUSED);
		int refusedCount = afterSaleMapper.countByExample(example);
		I9heAssert.assertEquals(0, refusedCount, "无法申请售后, 请联系客服!");
		
		String afsNo = "";
		synchronized (SyncObject) {
			int ticks = 0;
			ticks = Ticks;
			Ticks = (Ticks + 1) % 10;
			afsNo = MessageFormat.format(AFS_NO_FORMAT, afterSale.getType(), ticks);
		}

		afterSale.setCreateTime(new Date());
		afterSale.setUserId(SessionUtil.getSessionUserID());
		afterSale.setState(B2BConstants.AFS_STATE_UNPROCESS);
		// 申请单编号
		afsNo = new SimpleDateFormat(afsNo).format(afterSale.getCreateTime());
		afterSale.setAfsNo(afsNo);
		afterSaleMapper.insertSelective(afterSale);
		// 插入申请记录
		AfterSaleRecord record = new AfterSaleRecord();
		record.setAfterSaleId(afterSale.getId());
		record.setCreateTime(new Date());
		record.setIp(ThreadContextHolder.getHttpRequest().getRemoteAddr());
		record.setUserId(afterSale.getUserId());
		String type = (String)ObjectUtils.defaultIfNull(B2BConstrant.AFTER_SALE_TYPES.get(afterSale.getType()), "未知");
		String state = "未知";
		String reason = afterSale.getReason();
		String details = String.format("买家发起了【%s】申请, 货物状态:【%s】;原因:【%s】", type, state, reason);
		record.setDetails(details);
		recordMapper.insertSelective(record);
		
		//改变订单状态
		HistoryOrder ho =  historyOrderMapper.selectByPrimaryKey(afterSale.getOrderId());
		ho.setStatus(7);
		historyOrderMapper.updateByPrimaryKeySelective(ho);
		
		// 插入退款信息和物流信息
		if (refund != null) {
			refund.setAfterSaleId(afterSale.getId());
			refundMapper.insert(refund);
		}
		if (shipping != null) {
			shipping.setAfterSaleId(afterSale.getId());
			shippingMapper.insertSelective(shipping);
		}
	}

	@Override
	public List<AfterSale> getAfterSales(AfterSaleExample example, SimpleSearchModel searchModel) throws I9heException {
		RowBounds rowBounds = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		int total = afterSaleMapper.countByExample(example);
		searchModel.setTotal(total);
		List<AfterSale> list = afterSaleMapper.selectByExample(example, rowBounds);
		return list;
	}

	@Override
	public AfterSale getAfterSale(Integer id) throws I9heException {
		return afterSaleMapper.selectMoreByPrimaryKey(id);
	}

	@Override
	public List<AfterSaleRecord> getAfterSaleRecord(Integer afsId) throws I9heException {
		return recordMapper.selectByAfterSaleId(afsId);
	}

	@Override
	public void cancel(Integer id) throws I9heException {
		int userId = SessionUtil.getSessionUserID();
		AfterSale afterSale = afterSaleMapper.selectByPrimaryKey(id);
		I9heAssert.assertNotNull(afterSale, "未知申请");
		I9heAssert.assertEquals(afterSale.getUserId(), userId, "错误的申请单");
		I9heAssert.assertEquals(B2BConstants.AFS_STATE_UNPROCESS, afterSale.getState(), "无法取消已受理的申请");
		afterSale.setState(B2BConstants.AFS_STATE_CANCEL);
		afterSaleMapper.updateByPrimaryKey(afterSale);
		// 插入取消记录
		AfterSaleRecord record = new AfterSaleRecord();
		record.setAfterSaleId(afterSale.getId());
		record.setCreateTime(new Date());
		record.setIp(ThreadContextHolder.getHttpRequest().getRemoteAddr());
		record.setUserId(afterSale.getUserId());
		String type = (String)ObjectUtils.defaultIfNull(B2BConstrant.AFTER_SALE_TYPES.get(afterSale.getType()), "未知");
		String details = String.format("买家取消了【%s】的申请", type);
		record.setDetails(details);
		recordMapper.insertSelective(record);
		
	}

}
