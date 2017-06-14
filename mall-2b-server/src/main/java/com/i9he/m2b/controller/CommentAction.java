package com.i9he.m2b.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICommentService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.m2b.util.PageModel;
import com.i9he.m2b.util.PathUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SysConstant;
import com.i9he.ord.model.Batch;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.model.User;

@Security
@Controller
@RequestMapping("/controller/comment")
public class CommentAction {
	
	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private ICommentService commentService;
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/uncommentlist", method = RequestMethod.GET)
	public String unCommentList (OrderSearchModel searchModel, ModelMap map) throws Exception{
		User user = SessionUtil.getSessionUser();
		if(searchModel.getPageNo() == null){
			searchModel.setPageNo(1);
		}
		searchModel.setUserId(user.getId());
		searchModel.setPageSize(5);//页大小设为5
		searchModel.setType1(1);//实物类订单
		searchModel.setState(7);//已收货
		searchModel.setIsComment(0);//待评价
		List<Order> list = orderBaseApiServcie.getB2BOrderBySearch(searchModel);
		PageModel page = orderService.getPageModel(searchModel);
		map.put("page", page);
		map.put("orderList", list);
			
		return "comment/uncommentlist.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/comment",method=RequestMethod.POST,produces = "application/json;charset=utf8")
	public String comment(HttpServletRequest request,String comment) throws I9heException{
		List<Comment> comments = JSON.parseArray(comment, Comment.class); 
		Integer res = commentService.addComments(comments);
		Integer userId = SessionUtil.getSessionUser().getId();
		MessageContentUtil util = new MessageContentUtil();
		String orderid = "";
		if(res>0){
			 for(Comment c : comments){
				 orderid = c.getOrderId()+"";
				 if(c.getPhoto()!=null && !c.getPhoto().equals("")){
					 messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("5"), util.getOrderCommentst(orderid));
				     messageService.updateBalances(userId, 5);
					 messageService.addLog(userId, 5, "晒图赠送5节操币");
					 break;
				 }
			 }
			 messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("5"), util.getOrderEnd(orderid));
			 messageService.updateBalances(userId, 5);
			 messageService.addLog(userId, 5, "评论订单赠送5节操币");
		}
		return JSON.toJSONString(res>0);
	}
	
	@RequestMapping(value = "/commentlist", method = RequestMethod.GET)
	public String commentList (OrderSearchModel searchModel, ModelMap map) throws Exception{
		User user = SessionUtil.getSessionUser();
		if(searchModel.getPageNo() == null){
			searchModel.setPageNo(1);
		}
		searchModel.setUserId(user.getId());
		searchModel.setPageSize(5);//页大小设为5
		searchModel.setType1(1);//实物类订单
		searchModel.setState(7);//已收货
		searchModel.setIsComment(1);//已评价
		List<Order> list = orderBaseApiServcie.getB2BOrderBySearch(searchModel);
		PageModel page = orderService.getPageModel(searchModel);
		List<Order> newList = commentService.getCommentByOrder(list);
		map.put("page", page);
		map.put("orderList", newList);
		
		return "comment/commentlist.ftl";
	}
	
	/***
	 * 上传图片
	 * @param txt_file
	 * @return
	 * @throws IOException
	 */
//	@ResponseBody
//	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "application/json;charset=utf8")
//	public String uploadMultipleFileHandler(@RequestParam("txt_file") MultipartFile[] txt_file) throws IOException {
//	     StringBuffer photosName = new StringBuffer();
//	     for (int i = 0; i < txt_file.length; i++) {
//	         MultipartFile file = txt_file[i];
//	         if (!file.isEmpty()) {
//	             InputStream in = null;
//	             OutputStream out = null;
//	             //修改文件名，
//	             String name = file.getOriginalFilename();//获取文件名称
//	             int index = name.lastIndexOf(".");
////	             String fName = name.substring(0,index); 
//	             String lastName = name.substring(index);//文件后缀
//	             String newname = new Date().getTime() + lastName;//新文件名
//	             System.out.println(configUtil.getImgpath());
//	             photosName.append(newname+",");
//	             try {
//	                 File dir = new File(configUtil.getImgpath());
//	                 if (!dir.exists())
//	                        dir.mkdirs();
//	                    File serverFile = new File(dir.getAbsolutePath() + File.separator + newname);
//	                    in = file.getInputStream();
//	                    out = new FileOutputStream(serverFile);
//	                    byte[] b = new byte[1024];
//	                    int len = 0; 
//	                    while ((len = in.read(b)) > 0) {
//	                        out.write(b, 0, len);
//	                    }
//	                    out.close();
//	                    in.close();
//	                    logger.info("Server File Location=" + serverFile.getAbsolutePath());
//	                } catch (Exception e) {
//	                	
//	                } finally {
//	                    if (out != null) {
//	                        out.close();
//	                        out = null;
//	                    }
//	                    if (in != null) {
//	                        in.close();
//	                        in = null;
//	                    }
//	                }
//	            } else {
//	                System.out.println("图片为空！");
//	            }
//	        }
//	        return JSON.toJSONString(photosName);
//	    }
	
	/***
	 * 追加评论
	 * @param map
	 * @param comment
	 * @return
	 * @throws I9heException
	 */
//	@RequestMapping(value="/addComment",method = RequestMethod.GET)
//	public String addComment(ModelMap map,Integer id,Integer page)throws I9heException{
//		CommentWithBLOBs comment = commentServer.getCommentByid(id);
//		Goods good = goodsService.selectByPrimaryKey(comment.getGoodsId());
//		
//		map.put("good", good);
//		map.put("page", page);
//		map.put("id", id);
//		return "order/addComment.ftl";
//	}
	
//	@RequestMapping(value="/addComment",method = RequestMethod.POST)
//	public String addComment(ModelMap map, Integer page,CommentWithBLOBs comment,HttpServletResponse response)throws I9heException{
//
//		commentServer.addContent(comment);
//		return "redirect:/controller/comment/list.do?pageNo="+page;
//	}
	
}
	
	