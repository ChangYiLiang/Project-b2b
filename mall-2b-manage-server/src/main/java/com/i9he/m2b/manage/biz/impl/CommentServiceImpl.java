package com.i9he.m2b.manage.biz.impl;


import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.ICommentService;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.mapper.AfterSaleMapper;
import com.i9he.m2b.mapper.CommentMapper;
import com.i9he.m2b.model.AfterSaleViewModel;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.CommentViewModel;
import com.i9he.mall.api.MallApiErroCode;
import com.i9he.privilege.model.User;

@Service("commentService")
public class CommentServiceImpl implements ICommentService{

	static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private AfterSaleMapper afterSaleMapper;
	
	@Override
	public Integer getCount(Comment comment) throws I9heException {
		try{
			User user = SessionUtil.getSessionUser();
			comment.setUserId(user.getId());
			Integer tempCount = commentMapper.selectCount(comment);
			Integer count =  tempCount/10;
			if(tempCount%10 != 0){
			count = count+1;
		}
			return count;
		}catch(Exception e){
			logger.error("获取评价总数异常！");
			throw new I9heException("获取评价总数异常！",e);
		}
	}

	@Override
	public Comment getCommentByid(Integer id) throws I9heException {
		try{
			return commentMapper.selectByPrimaryKey(id);
		}catch(Exception e){
			logger.error("根据id获取评价异常！");
			throw new I9heException("根据id获取评价异常！",e);
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
	public Integer replyContent(Comment comment) throws I9heException {
		try{
			comment.setReplyDate(new Date());
			if(comment.getReplyContent() == null || comment.getReplyContent() == ""){
			comment.setReplyContent("感谢好评!");
		}
			return commentMapper.updateByPrimaryKeySelective(comment);
		}catch(Exception e){
			logger.error("回复评价出现异常！");
			throw new I9heException(MallApiErroCode.MALL_REPLYCOMMENT_ERRO, "回复评价出现异常！",e);
		}
	}

	@Override
	public Integer deleteComment(Comment comment) {
		comment.setIsDel(1);
		return commentMapper.updateByPrimaryKeySelective(comment);
	}

	@Override
	public List<CommentViewModel> getCommentRankData() {
		return commentMapper.getCommentRankData();
	}


	@Override
	public List<AfterSaleViewModel> getListViewModel() {
		
		return afterSaleMapper.getListViewModel();
	}

 }
