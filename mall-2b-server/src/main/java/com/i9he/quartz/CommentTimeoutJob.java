package com.i9he.quartz;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICommentService;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.DateUtil;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.order.api.IOrderBaseApiServcie;

public class CommentTimeoutJob {
	private static final Logger logger = LoggerFactory.getLogger(CommentTimeoutJob.class);
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private ICommentService commentService;
	
	/***
	 * 订单超过15天默认好评 
	 * @throws I9heException 
	 */
	public void scanComments () throws I9heException {
		List<Order> orderList = getOrderList();
		if (orderList != null && orderList.size() > 0) {
			Integer timeoutDay = ConstantUtil.COMMENT_TIMEOUT_DAY;//默认好评时间(从确认收货计算)
			Order updateOrder = new Order();
			updateOrder.setIsComment(1);
			updateOrder.setUpdatedDate(new Date());
			for (Order order : orderList) {
				if (DateUtil.compareDates(order.getUpdatedDate(),DateUtil.getSysDate()) > timeoutDay) {
					if (order.getOrderType() == 0) {
						Integer res = DefaultPraise(order.getId(),order.getUserId());
						if (res > 0) {
							updateOrder.setId(order.getId());
							orderBaseApiServcie.updateOrder(updateOrder);
						}
					}
					else if (order.getOrderType() == 2) {
						for (Order ord : order.getOrderList()) {
							Integer res = DefaultPraise(ord.getId(),ord.getUserId());
							if (res > 0) {
								updateOrder.setId(ord.getId());
								orderBaseApiServcie.updateOrder(updateOrder);
								updateOrder.setId(order.getId());
								orderBaseApiServcie.updateOrder(updateOrder);
							}
						}
					}
				}
			}
		}
	}
	
	private List<Order> getOrderList() {
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.setState(IOrderBaseApiServcie.RECEIVED);
		searchModel.setIsComment(0);
		List<Order> orderList = orderBaseApiServcie.getB2BOrderBySearch(searchModel);
		return orderList;
	}
	
	/***
	 * 默认好评
	 */
	private Integer DefaultPraise(Integer orderId, Integer userId) throws I9heException {
		Comment comment = new Comment(); 
		OrderGoods goods = orderBaseApiServcie.getOrderGoodsByOrderId(orderId);
		comment.setGoodsId(goods.getId());
		comment.setUserId(userId);
		comment.setOrderId(orderId);
		comment.setContent("评价方未及时做出评价,系统默认好评!");
		comment.setOverallComment(2);//好评
		comment.setGoodsSatisfied(5);//五星
		comment.setCommentDate(new Date());
		Integer res = commentService.addComment(comment);
		logger.info("订单:{}默认好评",orderId);
		return res;
	}
}
