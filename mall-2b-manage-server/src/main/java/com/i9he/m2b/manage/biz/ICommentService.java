package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.AfterSaleViewModel;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.CommentViewModel;


public interface ICommentService {
	


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
	
	/***
	 * 回复评论
	 * @param comment
	 * @return
	 * @throws I9heException 
	 */
	public Integer replyContent(Comment comment) throws I9heException;
	
	/***
	 * 删除评价
	 * @param comment
	 */
	public Integer deleteComment(Comment comment);
	
    public List<CommentViewModel> getCommentRankData();
	
	public List<AfterSaleViewModel> getListViewModel();
}
