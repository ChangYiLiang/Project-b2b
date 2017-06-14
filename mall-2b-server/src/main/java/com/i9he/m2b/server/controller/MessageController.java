package com.i9he.m2b.server.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.search.MessageSearchModel;
import com.i9he.m2b.util.SessionUtil;
@Security
@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	/**
	 * 消息列表
	 * @param page
	 * @param mp
	 * @param userId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String search(
			@RequestParam(value = "pageNo", required = false) String pageNo,
			@RequestParam(value = "isRead",required=false)String isRead,
			ModelMap mp,HttpServletRequest request )
			throws Exception {
		Integer userId = SessionUtil.getSessionUser().getId();
		if (pageNo == null) {
			pageNo = "1";
		}
		//设置查询实体参数
		MessageSearchModel msm = new MessageSearchModel();
		msm.setPageSize(6);
		msm.setPageNo(Integer.parseInt(pageNo));
		msm.setUserId(userId);
		if(isRead!=null){
			msm.setIsRead(Byte.parseByte(isRead));	
		}
		msm.setIsReceive((byte)1);	
		RowBounds rb =  new RowBounds(msm.getOffset(),msm.getLimit());
		List<Message> messageList = messageService.getUserMessage(msm,rb);
		int totalNum = messageService.getUserTotal(msm);
		//分页工具类
		String path = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort()
				+ request.getContextPath();		
		StringBuffer sb = new StringBuffer();
		if(isRead!=null){
			sb.append("&isRead=");
			sb.append(isRead);
		}	
		mp.addAttribute("pageCode", getPageCode(Integer.parseInt(pageNo),
				totalNum, msm.getPageSize(), path,sb.toString()));
		mp.addAttribute("messageList", messageList);
		mp.addAttribute("totalPage", totalNum % msm.getPageSize() == 0 ? totalNum
				/ msm.getPageSize() : totalNum / msm.getPageSize() + 1);
		messageService.updateIsRead();
		return "message/message.ftl";
	}
	
	public String getPageCode(Integer page, int totalNum,Integer pageSize, String projectContext,String param) {
		StringBuffer pageCode = new StringBuffer();
		// 得到总页数
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;
		if (totalNum == 0) {
			return "";
		} else {
			pageCode.append("<nav>");
			pageCode.append("<ul class='pager'>");
			if (page > 1) {
				pageCode.append("<li><a href='" + projectContext + "/message/list.do?pageNo=" + (page-1) +""+ param+"'>上一页</a></li>"+page);
			} else {
				pageCode.append("<li class='disabled'><a>上一页</a></li>"+page);
			}
			
			if (page < totalPage) {
				pageCode.append("<li><a href='" + projectContext + "/message/list.do?pageNo=" + (page+1) +""+ param+"'>下一页</a></li>"+"共"+totalPage+"页");
			} else {
				pageCode.append("<li class='disabled'><a>下一页</a></li>");
			}

			pageCode.append("</ul>");
			pageCode.append("</nav>");

		}

		return pageCode.toString();
	}
	@RequestMapping("/allRead")
	public String allRead(){
	   messageService.updateIsRead();
	   return "redirect:/message/list.do";
	}
	@ResponseBody
	@RequestMapping("/delete")
	public String del(String id){
		if(messageService.delete(Integer.parseInt(id))>0){
			return  JSON.toJSONString(true);
		}else{
			return JSON.toJSONString(false);
		}
	}
}
