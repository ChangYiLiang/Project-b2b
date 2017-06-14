package com.i9he.m2b.biz.impl;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICommentService;
import com.i9he.m2b.mapper.CommentMapper;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Batch;
import com.i9he.ord.model.CommentEx;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.model.User;

@Service("commentService")
public class CommentServiceImpl implements ICommentService{

	static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	
	
	@Override
	public Integer addComment(Comment comment) {
		comment.setCommentDate(new Date());
		//如果检测没有评价，则默认所有好评
		if(comment.getOverallComment() == null){
			comment.setOverallComment(2);
		}
		if(comment.getContent() == null || comment.getContent() == ""){
			comment.setContent("好评!");
		}
		if(comment.getGoodsSatisfied() == null){
			comment.setGoodsSatisfied(5);
		}
		return commentMapper.insertSelective(comment);
	}


	@Override
	public List<Comment> getCommentByUser(Comment comment) throws I9heException {
		try{
			User user = SessionUtil.getSessionUser();
			comment.setUserId(user.getId());
			comment.setPageSize(5);
			List<Comment> commentMap = commentMapper.selectByUser(comment);
			//如果存有照片，则切割照片名为单独的照片集合
			for(Comment com:commentMap){
				if(com.getPhoto() != null){
					List<String> photos = Arrays.asList(com.getPhoto().split(";"));
					com.setPhotos(photos);
				}
		}
			return commentMap;
		}catch(Exception e){
			logger.error("查看评价异常！");
			throw new I9heException(MallErroCode.MALL_GETUSER_COMMENT_ERRO, "查看评价异常！",e);
		}
	}


	@Override
	public Integer getCount(Comment comment) throws I9heException {
		try{
			User user = SessionUtil.getSessionUser();
			comment.setUserId(user.getId());
			Integer tempCount = commentMapper.selectCount(comment);
			Integer count =  tempCount/5;
			if(tempCount%5 != 0){
			count = count+1;
			}
			if(count == 0){
				count = 1;
			}
			return count;
		}catch(Exception e){
			logger.error("获取评价总数异常！");
			throw new I9heException(MallErroCode.MALL_GETALL_COMMENT_ERRO, "获取评价总数异常！",e);
		}
	}


	@Override
	public Comment getCommentByid(Integer id) throws I9heException {
		try{
			return commentMapper.selectByPrimaryKey(id);
		}catch(Exception e){
			logger.error("根据id获取评价异常！");
			throw new I9heException(MallErroCode.MALL_GET_COMMENT_ERRO, "根据id获取评价异常！",e);
		}
	}


	@Override
	public List<Comment> getAllComment(Comment comment) throws I9heException {
		try{
			comment.setPageSize(10);
			List<Comment> commentMap = commentMapper.selectAllComment(comment);
			//如果存有照片，则切割照片名为单独的照片集合
			for(Comment com:commentMap){
				if(com.getPhoto() != null){
					List<String> photos = Arrays.asList(com.getPhoto().split(";"));
					com.setPhotos(photos);
				}
		}
			return commentMap;
		}catch(Exception e){
			logger.error("查看评价异常！");
			throw new I9heException("查看评价异常！",e);
		}
	}


	@Override
	public Integer getAllCount(Comment comment) throws I9heException {
		try{
			Integer tempCount = commentMapper.selectAllCount(comment);
			Integer count =  tempCount/10;
			if(tempCount%10 != 0){
			count = count+1;
		}
			return count;
		}catch(Exception e){
			logger.error("查看评价异常");
			throw new I9heException("查看评价异常",e);
		}
	}


	@Override
	public Comment getAllCounts(Comment comment1) {
		Comment com = new Comment();
		Comment comment = new Comment();
		//查询总评价数
		comment.setGoodsId(comment1.getGoodsId());
		comment.setIsReply(comment1.getIsReply());
		com.setAllCount(commentMapper.selectAllCount(comment));
		//查询好评数
		comment.setOverallComment(2);
		com.setPositiveCount(commentMapper.selectAllCount(comment));
		//查询中评数
		comment.setOverallComment(1);
		com.setMediumCount(commentMapper.selectAllCount(comment));
		//查询差评数
		comment.setOverallComment(0);
		com.setBadCount(commentMapper.selectAllCount(comment));
		//查询有图评论数
		comment.setOverallComment(null);
		comment.setPhoto("true");
		com.setPhotoCount(commentMapper.selectAllCount(comment));
		//计算好评度
		double grade = 0;
		if(null != com.getAllCount()&&com.getAllCount() !=0){
			grade = (double)com.getPositiveCount()/com.getAllCount();
		}
		DecimalFormat df = new DecimalFormat("#.00"); 
		com.setCommentDegree(df.format(grade*100));
		return com;
	}


	@Override
	public Integer addComments(List<Comment> comments) throws I9heException {
		try{
			User user = SessionUtil.getSessionUser();
			Integer userId = user.getId();
			Integer res =0;
			for(Comment com : comments){
				com.setUserId(userId);
				com.setCommentDate(new Date());
				//如果检测没有评价，则默认所有好评
				if(com.getContent() == null || "".equals(com.getContent())){
					com.setContent("[默认]好评!");
				}
				res = commentMapper.insertSelective(com);
		}
		//修改订单评价状态为已评价
		Integer orderId = comments.get(0).getOrderId();
		Batch batch = orderBaseApiServcie.getBatchByOrderId(orderId);
		if(null != batch){
			List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(batch.getBatchId());
			for(Order o : orderList){
				Order order = orderBaseApiServcie.getOrderById(o.getId());
				order.setIsComment(1);
				orderBaseApiServcie.updateOrder(order);
			}
			Order order = orderBaseApiServcie.getOrderById(batch.getBatchId());
			order.setIsComment(1);
			orderBaseApiServcie.updateOrder(order);
		}
			Order order = orderBaseApiServcie.getOrderById(orderId);
			order.setIsComment(1);
			orderBaseApiServcie.updateOrder(order);
			return res;
		}catch(Exception e){
			logger.error("评价商品异常");
			throw new I9heException("评价商品异常",e);
		}
	}


	@Override
	public List<Order> getCommentByOrder(List<Order> list) {
		//临时数组存放没有评价的订单
		List<Order> tempOrder = new ArrayList<Order>();
		for(Order order:list){
			if(order.getOrderType() == 0){
				Comment comment= commentMapper.selectByOrderId(order.getId());
				if(null != comment) {
					//切割照片
					if(comment.getPhoto() != null){
						List<String> photos = Arrays.asList(comment.getPhoto().split(";"));
						comment.setPhotos(photos);
					}
					order.setCommentEx(this.transComment(comment));
				}else{
					tempOrder.add(order);
				}
			}
			else if(order.getOrderType() == 2){
				List<Order> tempOrder2 = new ArrayList<Order>();
				for(Order ord : order.getOrderList()){
					Comment comment= commentMapper.selectByOrderId(ord.getId());
					if(null != comment) {
						if(comment.getPhoto() != null){
							List<String> photos = Arrays.asList(comment.getPhoto().split(";"));
							comment.setPhotos(photos);
						}
						ord.setCommentEx(this.transComment(comment));
					}else{
						tempOrder2.add(ord);
				}
					if(tempOrder2.size() == order.getOrderList().size()) {
						tempOrder.add(order);
					}
				}
			}
		}
		if(tempOrder.size() > 0) {
			list.removeAll(tempOrder);
		}
		return list;
	}
	
	public CommentEx transComment(Comment comment){
		CommentEx commentEx = new CommentEx();
		commentEx.setId(comment.getId());
		commentEx.setGoodsId(comment.getGoodsId());
		commentEx.setUserId(comment.getUserId());
		commentEx.setContent(comment.getContent());
		commentEx.setPhoto(comment.getPhoto());
		commentEx.setOverallComment(comment.getOverallComment());
		commentEx.setGoodsSatisfied(comment.getGoodsSatisfied());
		commentEx.setCommentDate(comment.getCommentDate());
		commentEx.setReplyContent(comment.getReplyContent());
		commentEx.setReplyDate(comment.getReplyDate());
		commentEx.setIsDel(comment.getIsDel());
		commentEx.setPhotos(comment.getPhotos());
		return commentEx;
		
	}

//	@Override
//	public Integer addContent(Comment comment) throws I9heException {
//		try{
//			comment.setAddCommentDate(new Date());
//			if(comment.getAddContent() == null || comment.getAddContent() == ""){
//			comment.setAddContent("终极好评!");
//		}
//			return commentMapper.updateByPrimaryKeySelective(comment);
//		}catch(Exception e){
//			logger.error("添加追评出现异常！");
//			throw new I9heException(MallErroCode.MALL_ADD_COMMENT_ERRO, "添加追评出现异常！",e);
//		}
//	}
	
 }
