package com.i9he.m2b.manage.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.MessageService;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.MessageType;
import com.i9he.m2b.model.search.MessageSearchModel;

@Controller
@RequestMapping("/controller/message")
public class MessageController extends AbstractController{
	
	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";

	@Autowired
	private MessageService messageService;
	  @RequestMapping("/messageList")
	  public String list(ModelMap map){
		  List<MessageType> typeList = messageService.getMessageType(null, new RowBounds());
		  map.put("typeList", typeList);
		  return "message/message.ftl";
	  }
	
	  @ResponseBody
	  @RequestMapping(value="/messageList",method = RequestMethod.POST, produces = MIME_JSON)
	  public String messageList(MessageSearchModel msm){
		  RowBounds rb = new RowBounds(msm.getOffset(),msm.getLimit());
		  List<Message> list = messageService.getMessage(msm, rb);
		  return JSON.toJSONStringWithDateFormat(wrapDataTable(list, msm), DATE_FORMAT);  
	  }
	  @RequestMapping("/deleteMessage")
	  public String deleteMessage(String messageId){
       messageService.deleteMessage(messageId);
       return "";
	
	  }
	  @RequestMapping("/typeList")
	  public String typeList(ModelMap map){
		  return "message/messageType.ftl";
	  }
	  @ResponseBody
	  @RequestMapping(value="/typeList",method = RequestMethod.POST, produces = MIME_JSON)
	  public String typeList(MessageSearchModel msm,String typeName){
		  RowBounds rb = new RowBounds(msm.getOffset(),msm.getLimit());
		  List<MessageType> list = messageService.getMessageType(typeName, rb);
		  return JSON.toJSONStringWithDateFormat(wrapDataTable(list, msm), DATE_FORMAT);  
	  }

}
