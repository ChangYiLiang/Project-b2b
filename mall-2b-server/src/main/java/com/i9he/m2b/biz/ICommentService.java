package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Comment;
import com.i9he.ord.model.Order;


public interface ICommentService {
	/***
	 * 添加商品评论
	 * @param comment
	 * @return
	 */
	public Integer addComment(Comment comment);

	/***
	 * 获取所有的个人所有评价
	 * @return
	 * @throws I9heException 
	 */
	public List<Comment> getCommentByUser(Comment comment) throws I9heException;

	/***
	 * 获取总评价数
	 * @param userId
	 * @return
	 * @throws I9heException 
	 */
	public Integer getCount(Comment comment) throws I9heException;

	/***
	 * 根据id获取评价
	 * @return
	 * @throws I9heException 
	 */
	public Comment getCommentByid(Integer id) throws I9heException;

	/***
	 * 追加评论
	 * @param comment
	 * @return
	 * @throws I9heException 
	 */
//	public Integer addContent(Comment comment) throws I9heException;

	/***
	 * 获取所有评价
	 * @param comment
	 * @return
	 * @throws I9heException
	 */
	public List<Comment> getAllComment(Comment comment) throws I9heException;
	
	/***
	 * 获取 所有评级总数
	 * @param comment
	 * @return
	 * @throws I9heException
	 */
	public Integer getAllCount(Comment comment) throws I9heException;
	
	/***
	 * 获取各类评价总数
	 * @return
	 */
	public Comment getAllCounts(Comment comment);

	/***评价商品*/
	public Integer addComments(List<Comment> comments) throws I9heException;

	/***通过订单列表获取用户评价*/
	public List<Order> getCommentByOrder(List<Order> list);
}
