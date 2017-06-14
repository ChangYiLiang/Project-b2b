package com.i9he.m2b.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.HttpCookie;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.captcha.CaptchaServiceSingleton;
import com.i9he.common.cas.client.restful.CasClientUtils;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.common.sms.SmsSender;
import com.i9he.common.util.FreeMarkerUtils;
import com.i9he.common.util.JavaMailUtils;
import com.i9he.common.util.RequestUtils;
import com.i9he.common.util.TripleDesCoder;
import com.i9he.m2b.biz.IAuthenticationService;
import com.i9he.m2b.biz.IBalancesService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.IMerchant;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.server.biz.IWebsiteService;
import com.i9he.m2b.server.form.JsonMessage;
import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.m2b.util.PathUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Merchant;
import com.i9he.privilege.model.User;
import com.i9he.privilege.model.UserLogin;
import com.nr.comm.util.DateUtil;

/**
 * 主界面及登录验证相关的控制器
 */
@Controller
@RequestMapping(value = { "/i9he", "/" })
public class IndexController {
	
	private static final String MIME_JSON = "application/json;charset=UTF-8";
	
	private final String MOBILE_VALIDATE_CODE = getClass().getName() + ".MobileValidateCode";
	
	private final String MOBILE_VALIDATE_PHONE_NUMBER = getClass().getName() + ".MobileValidatePhoneNumber";

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");

	private static final String VlidatCodeKey = "casRegister";
	
	private static final String VlidatCodeKeyLogin = "login";

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private ConfigUtil configUtil;
	@Resource
	private IBalancesService balancesService;
	@Autowired
	private IAuthenticationService authenticationService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private IWalletService walletService;
	
	@Resource(name = "mobileLoginSmsSender")
	private SmsSender mobileLoginSmsSender;
	
	@Autowired
	private IWebsiteService websiteService;

	@RequestMapping("/register")
	public String loginRegister(HttpServletRequest request) {
		return "2buser/register.ftl";
	}

	@RequestMapping({"404", "/error"})
	public String error(String visitedModule, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		return "error.ftl";
	}

	@RequestMapping("/main")
	public String main(String visitedModule, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		if (!Boolean.TRUE.equals(request.getAttribute("from_index.jsp"))) {
			return "redirect:/";
		}
		return "main.ftl";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) throws Exception {
		String ticketUrl = (String) ThreadContextHolder.getSession().getAttribute("casTicketUrl");
		if (StringUtils.isNotBlank(ticketUrl)) {
			CasClientUtils.logout(ticketUrl);
		}
		SessionUtil.clearSession(request);
		// 被拦截器拦截处理
		return "redirect:" + configUtil.getCasServerUrl()+"/logout?service=" + URLEncoder.encode(RequestUtils.getClientUrl(""), "UTF-8");
	}

	@ResponseBody
	@RequestMapping("/validcode")
	public void validcodeImages(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CaptchaServiceSingleton.getInstance().writeCaptchaImage(request, response, VlidatCodeKey);
	}

	@ResponseBody
	@RequestMapping(value = "/add",produces = "text/plain;charset=UTF-8")
	public String addUser(@ModelAttribute("user") User user, HttpServletRequest request,
			String mailName,
			HttpServletResponse respon, String validcode) throws IOException, I9heException {
		HttpSession session = request.getSession();
		final CaptchaServiceSingleton captachService = CaptchaServiceSingleton.getInstance();
		if (!captachService.validateCaptchaResponse(validcode, session, VlidatCodeKey)) {
			return JSON.toJSONString("error");
		}
		try {
			if (!privilegeBaseApiService.isUserLogin(user.getUsername())) {
				StringBuffer url = request.getRequestURL();
				String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
				user.setSource(tempContextUrl);
				user.setIsAdmin(2);
				Integer userId = null;
				String qy = "qy"+System.currentTimeMillis();
				if(mailName!=null && (!mailName.equals("-1"))){
					userId	= privilegeBaseApiService.createUser(user, qy);
				}else{
					userId	= privilegeBaseApiService.createUser(user, null);
				}
				Balances balances = new Balances();
				balances.setUserId(userId);
				balances.setFestBalance(ParaConstants.BALANCE);
				balancesService.creatBalancesByuserId(balances);
				UserLogin ul = new UserLogin();
				ul.setCreatedDate(DateUtil.getSysDate());
				ul.setIsLocked(false);
				ul.setLoginName(user.getUsername());
				ul.setUserId(userId);
				privilegeBaseApiService.createUserLogin(ul);
				//用户余额
				Wallet wallet = new Wallet();
				wallet.setMoney(new BigDecimal(0));
				wallet.setErrorCount(0);
				wallet.setErrorAll(5);
				wallet.setUserId(userId);
				wallet.setCreateTime(new Date());
				walletService.insert(wallet);
				
				//企业用户
				if(mailName!=null && (!mailName.equals("-1"))){
					IMerchant merchant = new IMerchant();
					merchant.setMerchantNo(qy);
					merchant.setMailName(mailName);
					merchant.setRegDate(new Date());
					authenticationService.addMerchant(merchant);
				}
				//添加 消息 增加节操币
				MessageContentUtil util = new MessageContentUtil();
				Message message = new Message();
				message.setCreateTime(new Date());
				message.setContent(util.getRegister());
				message.setTitle(util.getJcbTitle("1000"));
				message.setUserId(userId);
//				message.setUserId(5183);
				message.setUrl(PathUtil.getPath(request)+"mark/userfest.do");
				messageService.addMessage(message);
				messageService.updateBalances(userId, 1000);
				messageService.addLog(userId, 1000, "注册赠送1000节操币");
				
				return JSON.toJSONString("success");
			}
			return ConstantUtil.Fail;
		} catch (I9heException e) {
			logger.error("注册用户出现异常");
			throw new I9heException(MallErroCode.MALL_USER_INSERT_ERRO, "注册用户出现异常", e);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getEmail")
	public String isEmail(HttpServletRequest request, String email) throws I9heException {
		try {
			if (!privilegeBaseApiService.isEmail(email)) {
				return ConstantUtil.AJAX_TRUE;
			}
			return ConstantUtil.AJAX_FALSE;
		} catch (I9heException e) {
			logger.error("验证邮箱" + email + "是否存在出现异常");
			return JSON.toJSONString("error");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getUser")
	public String isUserByUserName(HttpServletRequest request, String username) throws I9heException {
		if (!privilegeBaseApiService.isUser(username)) {
			return ConstantUtil.AJAX_FALSE;
		}
		return ConstantUtil.AJAX_TRUE;
		
	}

	@RequestMapping(value = "/getCode")
	public String sendEmailValidateCode(HttpServletRequest request) throws I9heException {
		String email = request.getParameter("email");// 获取email
		String validateCode = request.getParameter("validateCode");

		try {
			logger.info(email + "进入邮箱验证");
			if (privilegeBaseApiService.processActivate(email, validateCode)) {
				User user = privilegeBaseApiService.getUserByLogin(email);
				request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
				logger.info(email + "验证成功");
				return "success.ftl";
			}
			logger.info(email + "验证失败");
			return "404.ftl";
		} catch (I9heException e) {
			logger.error(MallErroCode.MALL_EMAIL_VERIFY_ERRO);
			throw new I9heException(MallErroCode.MALL_EMAIL_VERIFY_ERRO, "邮箱" + email + "验证失败", e);
		}// 调用激活方法
	}

	@RequestMapping(value = "/toRegister")
	public String getGoRegister(HttpServletRequest request, String recommander, ModelMap model) {

		if (recommander != null && !recommander.trim().equals("")) {
			try {
				// String recommanderId = TripleDesCoder.decrypt(recommander,
				// configUtil.getUserRecommanderKey());
				model.put("recommanderId", recommander);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.put("recommanderId", recommander);
		return "toRegister.ftl";
	}

	@RequestMapping(value = "/toMerchantRegist")
	public String getGoMerchantRegister(HttpServletRequest request) {

		return "toMerchantRegister.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/merchantUser_add", produces = "text/plain;charset=UTF-8")
	public String addMerthandUser(User user, Merchant merchant, HttpServletRequest request, HttpServletResponse respon) throws IOException, I9heException {
		try {
			// 判断该企业是否已被其他用户创建
			if (privilegeBaseApiService.getMerchantById(merchant.getUsrMerchant()) == null) {
				privilegeBaseApiService.createMerchantUser(merchant);
			}
			StringBuffer url = request.getRequestURL();
			String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
			user.setSource(tempContextUrl);
			Integer userId = privilegeBaseApiService.createUser(user, merchant.getUsrMerchant());
			user.setIsAdmin(2);
			Balances balances = new Balances();
			balances.setUserId(userId);
			balances.setFestBalance(ParaConstants.BALANCE);
			balancesService.creatBalancesByuserId(balances);
			UserLogin ul = new UserLogin();
			ul.setCreatedDate(DateUtil.getSysDate());
			ul.setIsLocked(false);
			ul.setLoginName(user.getUsername());
			ul.setUserId(userId);
			privilegeBaseApiService.createUserLogin(ul);
			return ConstantUtil.Success;
		} catch (I9heException e) {
			logger.error("注册企业用户出现异常");
			throw new I9heException(MallErroCode.MALL_M_USER_INSERT_ERRO, "注册企业用户出现异常", e);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/sendforgetemail", produces = "application/json;charset=UTF-8")
	public String sendForgetPasswordEmail(String username, String email) throws I9heException {
		// FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		User user = privilegeBaseApiService.getUserByUsername(username);
		int res = -1;
		if (user == null) {
			res = 1; // 用户名不存在
		} else if (!email.equalsIgnoreCase(user.getEmail())) {
			res = 2; // 邮箱不匹配
		} else if (!user.getIsValidatedEmail()) {
			res = 3; // 邮箱未验证
		} else {
			// 发送验证
			String token = System.currentTimeMillis() + ":" + user.getUsername();
			try {
				String forgetMailKey = configUtil.getForgetPasswordKey();
				token = TripleDesCoder.encrypt(token, forgetMailKey);
				token = URLEncoder.encode(token, "UTF-8");
				token = token.replace('/', '-');
				Map<String, Object> models = new HashMap<String, Object>();
				models.put("basepath", RequestUtils.getClientUrl(request, ""));
				models.put("token", token);
				models.put("username", user.getUsername());
				models.put("fullname", user.getFullname());

				String content = FreeMarkerUtils.render(configUtil.getForgetPasswordTemplateRoot(), "forgetpassword.ftl", models);
				JavaMailUtils.sendMail(user.getEmail(), "密码找回", content);
				res = 0;
			} catch (Exception ex) {
				ex.printStackTrace();
				res = 4;// 发送邮件失败
			}
		}

		return JSON.toJSONString(res);
	}

	@RequestMapping(value = "/forget")
	public String forgetPassword(HttpServletRequest request) {
		return "forgetpassword.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/{token}/resetpassword", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String postResetPassword(@PathVariable("token") String token, String username, String password,ModelMap map) {
		if (token != null) {
			token = token.replace('-', '/');
		}
		try {
			String forgetMailKey = configUtil.getForgetPasswordKey();
			long limitTime = configUtil.getForgetuserPasswordTimeLimit();

			token = TripleDesCoder.decrypt(token, forgetMailKey);
			String strTime = token.substring(0, token.indexOf(':'));
			String user = token.substring(token.indexOf(':') + 1);
			// 验证时间
			long sendTime = Long.valueOf(strTime);
			long total = (System.currentTimeMillis() - sendTime) / 1000;
			
			map.put("username", username);
			map.put("password", password);
			if (!user.equals(username)) {
				return "2"; // 用户不匹配
			}
			if (total > limitTime) {
				return "1"; // 超时
			} else {
				privilegeBaseApiService.resetUserPassword(username, password);
				return "0"; // 修改成功
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "-1"; // 异常
		}
	}
	
	@RequestMapping(value = "/{token}/resetpassword", method = RequestMethod.GET)
	public String resetPassword(@PathVariable("token") String token, ModelMap model) {
		if (token != null) {
			token = token.replace('-', '/');
		}
		try {
			// token=URLDecoder.decode(token, "UTF-8");
			String forgetMailKey = configUtil.getForgetPasswordKey();
			long limitTime = configUtil.getForgetuserPasswordTimeLimit();

			token = TripleDesCoder.decrypt(token, forgetMailKey);
			String strTime = token.substring(0, token.indexOf(':'));
			// String user = token.substring(token.indexOf(':') + 1);
			// 验证时间
			long sendTime = Long.valueOf(strTime);
			long total = (System.currentTimeMillis() - sendTime) / 1000;
			if (total > limitTime) {
				model.put("state", 1);
			} else {
				model.put("state", 0);
				model.put("token", token);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
		return "modifyPwd.ftl";
	}
	@RequestMapping("/modify")
	public String modify(){
		return "modifyPwd.ftl";
	}
	
	@RequestMapping("/login")
	public String login(ModelMap map,HttpServletRequest request1) throws UnsupportedEncodingException {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		map.put("service", request.getParameter("service"));
		map.put("casUrl",configUtil.getCasServerUrl());
		return "login.ftl";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password,String code,String service ,String rememberpw, HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
		HttpSession session = request.getSession();

		map.put("service", request.getParameter("service"));
		map.put("casUrl",configUtil.getCasServerUrl());
		
		final CaptchaServiceSingleton captachService = CaptchaServiceSingleton.getInstance();
			map.addAttribute("username", username);
			map.addAttribute("code", code);
			map.addAttribute("password", password);
		if (!captachService.validateCaptchaResponse(code, session, VlidatCodeKeyLogin)) {
			map.addAttribute("error", "验证码不正确.");
			return "login.ftl";
		}
		if (StringUtils.isBlank(service)) {
			service = RequestUtils.getClientUrl("/");
		}

		String ticketUrl = CasClientUtils.getCasTicketUrl(username, password, service);
		// TGC
		if (StringUtils.isNotBlank(ticketUrl)) {
			String[] items = ticketUrl.split("/");
			map.put("service", service);
			map.put("castgc", items[items.length - 1]);
			map.put("ticketUrl", ticketUrl);
			// 跳转九河网登录验证
			return "login_validate.ftl";
		} else {
			map.addAttribute("error", "用户名与密码不匹配.");
			return "login.ftl";
		}
		// ST
		/*
		if (ticketUrl != null && ticketUrl.trim().length() > 0) {
			String ticket = CasClientUtils.getLoginTicket(ticketUrl, service);
			//TODO  Danny 验证登录的用户是否是代理商的终端用户，同时验证域名是否这个代理商下的  
			//1 验证是否是终端用户
			//2 验证终端用户的所属代理商是否是这个域名下的 
			// 两种情况都要满足.--danny
			if (ticket != null && ticket.trim().length() > 0) {
				request.getSession().setAttribute("casTicketUrl", ticketUrl);
				String url = service + "?ticket=" + ticket;
				response.sendRedirect(url);
				return null;
			} else {
				map.addAttribute("error", "登录状态已过期.");
			}
		} else {
			map.addAttribute("error", "用户名与密码不匹配.");
		}
		return "login.ftl";
		*/
	}
	
	@RequestMapping("/login_success")
	public String loginSuccessRedirect() {
		return "login_success.ftl";
	}
	
	@ResponseBody
	@RequestMapping("/validcodeLogin")
	public void validcodeImagesLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CaptchaServiceSingleton.getInstance().writeCaptchaImage(request, response, VlidatCodeKeyLogin);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendmobilecode", method = RequestMethod.POST, produces = MIME_JSON) 
	public String sendMobileCode (String mobile) throws I9heException {
		User user = privilegeBaseApiService.getUserByValidatedMobile(mobile);
		if (user == null) {
			return new JsonMessage(1, "该手机号码不存在或未验证").toJSONString();
		}
		String code = new Random().nextInt(900000) + 100000 + "";
		ThreadContextHolder.getSession().setAttribute(MOBILE_VALIDATE_CODE, code);
		ThreadContextHolder.getSession().setAttribute(MOBILE_VALIDATE_PHONE_NUMBER, mobile);
		mobileLoginSmsSender.send(mobile, code);
		return new JsonMessage(0, "").toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobilelogin", method = RequestMethod.POST, produces = MIME_JSON) 
	public String mobileLogin (String mobile, String code) throws I9heException {
		String sCode = (String) ThreadContextHolder.getSession().getAttribute(MOBILE_VALIDATE_CODE);
		String sMobile = (String) ThreadContextHolder.getSession().getAttribute(MOBILE_VALIDATE_PHONE_NUMBER);
		ThreadContextHolder.getSession().removeAttribute(MOBILE_VALIDATE_CODE);
		ThreadContextHolder.getSession().removeAttribute(MOBILE_VALIDATE_PHONE_NUMBER);
		if (!StringUtils.equals(sCode, code)) {
			return new JsonMessage(1, "手机验证码不正确").toJSONString();
		}
		if (!StringUtils.equals(mobile, sMobile)) {
			return new JsonMessage(1, "手机验证码不匹配").toJSONString();
		}
		User user = privilegeBaseApiService.getUserByValidatedMobile(mobile);
		if (user == null) {
			return new JsonMessage(1, "该手机号码不存在或未验证").toJSONString();
		} else {
			ThreadContextHolder.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
			return new JsonMessage(0, "").toJSONString();
		}
	}
	
	@RequestMapping(value = "/casLoginCheck", produces = "text/html;charset=utf-8")
	public String casLoginCheck(Boolean setuser, ModelMap map) throws IOException {
		if (SessionUtil.getSessionUser() == null) {
			String url = configUtil.getCasServerUrl();
			url += url.contains("?") ? "&" : "?";
			url += "service=" + URLEncoder.encode(RequestUtils.getClientUrl("/casLoginCheck.do?setuser=true"), "utf-8");
			return "redirect:" + url;
		}
		if (setuser != null) {
			map.put("setuser", setuser);
		}
		return "casLoginCheck.ftl";
	}
	
	@RequestMapping(value = {"/s/{code}", "/about/{code}","/service/{code}","/idc/{code}"})
	public String view(@PathVariable("code") String code, ModelMap map){
		String content = websiteService.getWeisteContent(code);
		map.put("content", content);
		return "view/static.ftl";
	}
}
