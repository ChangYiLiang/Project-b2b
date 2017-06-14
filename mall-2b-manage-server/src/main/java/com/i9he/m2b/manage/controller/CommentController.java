package com.i9he.m2b.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.ICommentService;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.manage.utils.PageModel;
import com.i9he.m2b.manage.utils.SysConstant;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.Goods;
import com.i9he.mall.api.IMallBaseApiService;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

@Controller
@RequestMapping("/controller/comment")
public class CommentController {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.order.logger");
	

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private ICommentService commentService;
	
	/***
	 * 评价管理
	 * @param request
	 * @param map
	 * @return
	 * @throws I9heException
	 */
	@RequestMapping(value="/list",produces="text/plain;charset=UTF-8")
	public String list(HttpServletRequest request,ModelMap map,Comment comment)throws I9heException{
			
			List<Comment> comments = commentService.getAllComment(comment);
			List<Goods> allGoods = goodsService.getAllGoods();
			Map<String,String> goodsMap = new HashMap<String,String>();
			for(Goods good : allGoods){
				goodsMap.put(good.getId().toString(), good.getGoodsName());
			}
			//设置用户名
			for(Comment com:comments){
				User user = privilegeBaseApiService.getUserById(com.getUserId());
				com.setUserName(user.getNickName());
			}
			//设置分页信息
			PageModel page = new PageModel();
			//好评评价
			if(comment.getOverallComment()!=null){
				//好评评价设为2
				if(comment.getOverallComment() == 2){
					map.put("overComment", 2);
				}
				else if(comment.getOverallComment() == 1){
					map.put("overComment", 1);
				}
				else if(comment.getOverallComment() == 0){
					map.put("overComment", 0);
				}
			}
			//有图评价
			if(comment.getPhoto()!=null){
				map.put("photo", true);
			}
			//当前页码
			if(comment.getPageNo() == 0){
				page.setPageNo(1);
			}else{
				page.setPageNo(comment.getPageNo());
			}
			//总页码数
			Integer count = commentService.getAllCount(comment);
			page.setPageCount(count);
			//查询评价总数
			Comment counts = commentService.getAllCounts(comment);
			
			map.put("counts", counts);
			map.put("page", page);
			map.put("goodsMap", goodsMap);
			map.put("overallComment", SysConstant.GOODS_COMMENT_MAP);
			map.put("comments", comments);
			return "comment/commentlist1.ftl";
	}
	
	/***
	 * 回复评论
	 * @param map
	 * @param comment
	 * @return
	 * @throws I9heException
	 */
	@RequestMapping(value="/replyComment",method = RequestMethod.GET)
	public String replyComment(ModelMap map,Integer id,Integer page)throws I9heException{
		Comment comment = commentService.getCommentByid(id);
		Goods good = goodsService.getGoodsByid(comment.getGoodsId());
		
		map.put("good", good);
		map.put("page", page);
		map.put("id", id);
		return "comment/replyComment.ftl";
	}
	
	@RequestMapping(value="/replyComment",method = RequestMethod.POST)
	public String replyComment(ModelMap map, Integer page,Comment comment,HttpServletResponse response)throws I9heException{

		commentService.replyContent(comment);
		return "redirect:/controller/comment/list.do?pageNo="+page;
		
	}
	
	/***
	 * 删除评论
	 */
	@RequestMapping(value="/deleteComment",method = RequestMethod.GET)
	public String deleteComment(ModelMap map,Integer id,Integer page)throws I9heException{
		map.put("page", page);
		map.put("id", id);
		
		return "comment/deleteComment.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteComment",method = RequestMethod.POST)
	public String deleteComment(ModelMap map, Integer page,Comment comment,HttpServletResponse response)throws I9heException{

		Integer res = commentService.deleteComment(comment);
		if(res == 1){
			return "success";
		}else{
			return "fail";
		}
	}
}
