package com.i9he.m2b.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IAuthenticationService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.util.ResponseUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
import com.nr.comm.util.DateUtil;
@Security
@Controller
@RequestMapping("/authentication")
public class AuthenticationController {
	
	@Autowired
	private IAuthenticationService authenticationService;	
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	
	@RequestMapping("/show")
	public String show(ModelMap map) throws I9heException{
		Authentication authentication =authenticationService.findByUserId();
		//Integer userId = SessionUtil.getSessionUser().getId();
		//User u =privilegeBaseApiService.getUserById(userId);
			if(authentication==null){
				map.put("state", -1);
				map.put("authentication", new Authentication());
			}else{
				map.put("state", authentication.getStatus());
				map.put("authentication", authentication);
			}
		return "2buser/userCompany.ftl";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String  save(String endTime, Authentication authentication,HttpServletRequest request,
			HttpServletResponse response){
		String result = "";
		try{
			authentication.setExceed(DateUtil.parseDate(endTime,new SimpleDateFormat("yyyy-MM-dd")));
			Authentication attt =authenticationService.findByUserId();
			if(attt==null){
				authenticationService.addAuthentication(authentication);	
			}else{
				authentication.setId(attt.getId());
				authenticationService.updateAuthentication(authentication);
			}
			return "redirect:/authentication/show.do";
		}catch(Exception he){
		    result="<script language='javascript'>alert('提交失败,请检查资料是否正确或者完善');window.history.go(-1)</script>";
		}
		ResponseUtil.write(response, result);
		return "";
	}

}
