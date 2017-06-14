package com.i9he.m2b.manage.biz.impl;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.common.util.DateUtil;
import com.i9he.m2b.manage.biz.IGsService;
import com.i9he.m2b.manage.utils.GsConfigUtil;
import com.i9he.m2b.manage.utils.SyAESUtil;
import com.i9he.m2b.mapper.HistoryOrderMapper;
import com.i9he.m2b.mapper.LoanMapper;
import com.i9he.m2b.mapper.SyUserMapper;
import com.i9he.m2b.model.HistoryOrder;
import com.i9he.m2b.model.Loan;
import com.i9he.m2b.model.SyUser;
import com.i9he.m2b.model.search.GsSearchModel;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;
@Service("gsService")
public class GsServiceImpl implements IGsService {
	@Autowired
	private SyUserMapper syUserMapper;
	@Autowired
	private HistoryOrderMapper historyOrderMapper;
	@Autowired
	private LoanMapper loanMapper;
	@Autowired
	private GsConfigUtil gsConfigUtil;
	
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;

	private static Logger logger = LoggerFactory.getLogger(GsServiceImpl.class);
	@Override
	public List<SyUser> getUserList(GsSearchModel gsm) {
		RowBounds rs = new RowBounds(gsm.getOffset(),gsm.getLimit());
		List<SyUser> list = syUserMapper.getAll(gsm, rs);
		int total = syUserMapper.getCount(gsm);
		gsm.setTotal(total);
		return list;
	}
	
	public List<HistoryOrder> getOrderList(GsSearchModel gsm){
		RowBounds rs = new RowBounds(gsm.getOffset(),gsm.getLimit());
		List<HistoryOrder> list = historyOrderMapper.getAll(gsm, rs);
		int total = historyOrderMapper.getCount(gsm);
		gsm.setTotal(total);
		return list;
	}

	@Override
	public HistoryOrder findById(Integer id) {
		return historyOrderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(HistoryOrder historyOrder) {
		return historyOrderMapper.updateByPrimaryKeySelective(historyOrder);
	}
	
	// 退货请求
	@Override
	public String returnGoods(Integer orderId, String money) throws I9heException {

		Loan loan = loanMapper.findByOrderId(orderId);
		SyUser syUser = syUserMapper.findByUserId(Integer.parseInt(loan.getUserId()));

		String orderno = orderId.toString();
		String orderamount = loan.getOrderamount().toString();
		// 用户退款金额 暂定为订单金额
		String returnamount = money;
		String euserid = syUser.getUserId();
		String phone = gsConfigUtil.getB2bTel();
		// 电商同意退货时间
		String ordertime = DateUtil.formateDateToNum(new Date()).toString();
		// 白条ID
		String loanid = loan.getLoanid();

		OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
		// 退货商品列表
		JSONObject orderGoodsInfo = new JSONObject();
		orderGoodsInfo.put("goodid", orderGoods.getGoodsId());
		orderGoodsInfo.put("returncount", 1);
		JSONArray orderGoodsArr = new JSONArray();
		orderGoodsArr.add(orderGoodsInfo);

		String sStr = "orderno=" + orderno + "&orderamount=" + orderamount + "&returnamount=" + returnamount + "&euserid=" + euserid + "&phone=" + phone + "&ordertime=" + ordertime + "&loanid="
				+ loanid + "&goods=" + orderGoodsArr.toString();
		String sign = SyAESUtil.encrypt(gsConfigUtil.getsKey(), sStr);
		try {
			HttpClient httpclient = new HttpClient();
			PostMethod post = new PostMethod(gsConfigUtil.getReturnGoodsUrl());
			post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			post.addParameter("orderno", orderno);
			post.addParameter("orderamount", orderamount);
			post.addParameter("returnamount", returnamount);
			post.addParameter("euserid", euserid);
			post.addParameter("phone", phone);
			post.addParameter("ordertime", ordertime);
			post.addParameter("loanid", loanid);
			post.addParameter("goods", orderGoodsArr.toString());
			post.addParameter("sign", sign);
			httpclient.executeMethod(post);
			String result = new String(post.getResponseBody(), "utf-8");
			logger.info("退货返回信息[" + result + "]");
			return result;
		} catch (Exception e) {
			logger.error("[退货时发生错误]");
			return null;

		}
	}
}
