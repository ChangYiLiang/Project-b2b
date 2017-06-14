package com.i9he.m2b.manage.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.MessageService;
import com.i9he.m2b.manage.biz.impl.AuthenticationServiceImpl;
import com.i9he.m2b.manage.utils.MessageContentUtil;
import com.i9he.m2b.manage.utils.PathUtil;
import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.search.AuthenticationSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
@Controller
@RequestMapping("/controller/examine")
public class ExamineController extends AbstractController {
	@Autowired
	private AuthenticationServiceImpl authenticationService;
	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private MessageService messageService;
	
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	@RequestMapping("/list")
	public String list(){
		return "2buser/examine.ftl";
	}
	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST, produces = MIME_JSON)
	public String list(AuthenticationSearchModel asm){
		List<Authentication> list = authenticationService.getList(asm);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, asm), DATE_FORMAT);
	}
	@RequestMapping(value="info")
	public String getInfo(String id,ModelMap map){
	 Authentication authentication = authenticationService.findById(id);
	 map.put("authentication", authentication);
	 return "2buser/info.ftl";
	 
	}
	@ResponseBody
	@RequestMapping(value= "save",produces = "text/plain;charset=UTF-8")
	public String save(Authentication authentication,HttpServletRequest request) throws I9heException{
	  Integer count = authenticationService.updateStatus(authentication);
	  //审核通过
		  if(authentication.getStatus()==1){
			  Authentication au =  authenticationService.findById(String.valueOf(authentication.getId())); 
			  User u =privilegeBaseApiService.getUserById(au.getUserId());
			  //不是企业用户
			  if(u.getMerchantNo()==null || u.getMerchantNo().equals("")){
				  String qy = "qy"+System.currentTimeMillis();
				  u.setMerchantNo(qy);
				  //更改用户信息
				  privilegeBaseApiService.updateUserById(u);
				  //插入企业用户信息
				   IMerchant merchant = new IMerchant();
					merchant.setMerchantNo(qy);
					merchant.setMailName(au.getName());
					merchant.setRegDate(new Date());
					authenticationService.addMerchant(merchant);
			  }
			  //发送消息
			  System.out.println("添加消息");
			  MessageContentUtil util = new MessageContentUtil();
			  
			    Message message = new Message();
				message.setCreateTime(new Date());
				message.setContent(util.getCompany());
				message.setTitle(util.getJcbTitle("5000"));
				message.setUserId(au.getUserId());
				message.setUrl(PathUtil.getPath(request)+"mark/userfest.do");
			    messageService.addMessage(message);
			    messageService.updateBalances(au.getUserId(), 5000);
				messageService.addLog(au.getUserId(), 5000, "完成企业认证赠送5000节操币");
		  }
	  return JSON.toJSONString(count);
	}
	
	

}
