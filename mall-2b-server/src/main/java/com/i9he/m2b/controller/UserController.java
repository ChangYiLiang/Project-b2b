package com.i9he.m2b.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.common.sms.SmsSender;
import com.i9he.common.util.FreeMarkerUtils;
import com.i9he.common.util.JavaMailUtils;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IInvoicesService;
import com.i9he.m2b.biz.ISubscribeService;
import com.i9he.m2b.biz.IUserExpandService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.biz.model.InvoiceViewModel;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.InvoiceQualifed;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Subscribe;
import com.i9he.m2b.model.TagCategory;
import com.i9he.m2b.model.UserExpand;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.search.InvoiceSearchModel;
import com.i9he.m2b.server.biz.IinvoiceQuaService;
import com.i9he.m2b.server.form.JsonMessage;
import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.m2b.util.PageModel;
import com.i9he.m2b.util.PathUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.StringUtil;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.ord.model.Order;
import com.i9he.ord.model.OrderGoods;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Merchant;
import com.i9he.privilege.model.User;
import com.i9he.privilege.model.UserLogin;
import com.nr.comm.util.DateUtil;

/**
 * 主界面及登录验证相关的控制器
 */
@Security
@Controller
@RequestMapping("/controller/user")
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Resource
	private IinvoiceQuaService IinvoiceQuaService;
	@Resource
	private IWalletService walletService;
	@Resource(name = "mobileValidateSmsSender")
	private SmsSender smsSender;
	@Autowired
	private IInvoicesService invoicesService;
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private ConfigUtil config;
	@Autowired
	private IUserExpandService userExpandService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private ISubscribeService subscribeService; 
	
	private static final String MIME_JSON = "application/json;charset=utf-8";
	
	private final String USER_MOBILE_VALIDCODE = getClass().getName() + ".MobileValideCode";
	
	/**
	 * 个人信息
	 * @throws I9heException
	 */
	@RequestMapping(value = "/tomydata")
	public String toMyData(ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser();
		Merchant merchant = privilegeBaseApiService.getMerchantById(user.getMerchantNo());
		String merchantName = null;
		if(null != merchant){
			merchantName = merchant.getMailName();
		}
		map.put("merchantName", merchantName);
		UserExpand userExpand =	userExpandService.findById();
		map.put("userExpand",userExpand );
		
		return "2buser/myData.ftl";
	}
	
	/**
	 * 修改个人用户信息
	 * @throws I9heException
	 * @throws ParseException 
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/saveuser", produces = "application/json;charset=UTF-8")
	public String save(User fmuser,String birthday,String company,String job,  HttpServletRequest request) throws I9heException, ParseException {
		User user = new User();
		user.setId(SessionUtil.getSessionUser().getId());
		user.setGender(fmuser.getGender());
		user.setWechat(fmuser.getWechat());
		user.setQq(fmuser.getQq());
		// 只能修改未验证的手机号码
		if (!SessionUtil.getSessionUser().getIsValidatedMobile()) {
			user.setMobile(fmuser.getMobile());
		}
		user.setNickName(fmuser.getNickName());
		privilegeBaseApiService.updateUserById(user);
		User newUser = privilegeBaseApiService.getUserById(user.getId());
		request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, newUser);
		
		
		UserExpand userExpand =	userExpandService.findById();
		
		if(userExpand!=null){
			userExpand.setUserId(SessionUtil.getSessionUser().getId());
			userExpand.setBirthday(DateUtil.parseDate(birthday));
			userExpand.setJob(job);
			userExpand.setCompany(company);
			userExpandService.update(userExpand);
		}else{
			userExpand = new UserExpand();
			userExpand.setUserId(SessionUtil.getSessionUser().getId());
			userExpand.setBirthday(DateUtil.parseDate(birthday));
			userExpand.setJob(job);
			userExpand.setCompany(company);
			userExpand.setCreateTime(new Date());
			userExpandService.insert(userExpand);
		}
		
		return JSON.toJSONString("success").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/midifyuserimg",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String midifyUserImg(String img){
		UserExpand userExpand =	userExpandService.findById();
		if (userExpand!=null) {
			userExpand.setUserId(SessionUtil.getSessionUser().getId());
			userExpand.setUserImg(img);
			userExpandService.update(userExpand);
		} else {
			userExpand = new UserExpand();
			userExpand.setUserId(SessionUtil.getSessionUser().getId());
			userExpand.setUserImg(img);
			userExpand.setCreateTime(new Date());
			userExpandService.insert(userExpand);
		}
		return JSON.toJSONString(true);
	}
	
	/***
	 * 安全设置
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "security")
	public String toSecurity(ModelMap map) {
		Wallet wallet = walletService.findByUserId();
		String isPayPassword = "false";
		if(null != wallet){
			if(null != wallet.getPassword() && !"".equals(wallet.getPassword())){
				isPayPassword = "true";
			}
		}
		map.put("isPayPassword", isPayPassword);
		
		return "security/security.ftl";
	}
	
	//修改密码
	@RequestMapping(value = "cpassword")
	public String tochangePassword(ModelMap map) {
	
		return "security/modifyPassword.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/modifypassword", produces = "text/plain;charset=UTF-8")
	public String modifypassword(String oldpassword, String password, HttpServletRequest request) throws Exception {
		if (StringUtils.isEmpty(oldpassword) || StringUtils.isEmpty(password))
			return JSON.toJSONString(false).toString();
		// 初始化用户、菜单
		User user = SessionUtil.getSessionUser(request);
		if (!user.getPassword().equals(StringUtil.makeMD5(oldpassword)))
			return JSON.toJSONString(false).toString();
		User newUser = new User();
		newUser.setId(user.getId());
		newUser.setPassword(StringUtil.makeMD5(password));
		newUser.setOldPassword1(StringUtil.makeMD5(oldpassword));
		newUser.setUpdatedDate(new Date());
		newUser.setUpdatedBy(user.getUsername());
		privilegeBaseApiService.updateUserById(newUser);

		user.setPassword(newUser.getPassword());
		request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);

		return JSON.toJSONString(true).toString();
	}
	
	@RequestMapping(value = "validateemail")
	public String validateemail(ModelMap map) {
		
		return "security/validateEmail.ftl";
	}
	
//	/***校验邮箱验证码*/
//	@ResponseBody
//	@RequestMapping(value = "/verificationCode", produces = "text/plain;charset=UTF-8")
//	public String verificationCode(String email, String validcode, HttpServletRequest request) throws I9heException {
//		if (privilegeBaseApiService.processActivate(email, validcode)) {
//			User user = privilegeBaseApiService.getUserByLogin(email);
//			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
//			//发消息
//			MessageContentUtil util = new MessageContentUtil();
//			messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("300"), util.getEamilValidate());
//			
//			Integer userId = SessionUtil.getSessionUser().getId();
//			messageService.updateBalances(userId, 300);
//			messageService.addLog(userId, 300, "完成邮箱验证赠送300节操币");
//			return JSON.toJSONString(true);
//		}
//		return JSON.toJSONString(false);
//	}
	
	/***校验邮箱验证码*/
	@RequestMapping(value = "/verificationCode")
	public String verificationCode(String email, String validcode, HttpServletRequest request) throws I9heException {
		if (privilegeBaseApiService.processActivate(email, validcode)) {
			User user = privilegeBaseApiService.getUserByLogin(email);
			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
			//发消息
			MessageContentUtil util = new MessageContentUtil();
			messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("300"), util.getEamilValidate());
			
			Integer userId = SessionUtil.getSessionUser().getId();
			messageService.updateBalances(userId, 300);
			messageService.addLog(userId, 300, "完成邮箱验证赠送300节操币");
			return "security/success.ftl";
		}
		return "security/fail.ftl";
	}
	
	/***发送邮箱验证码*/
	@ResponseBody
	@RequestMapping(value = "sendCode", produces = "text/plain;charset=UTF-8")
	public String sendCodeByEmail(String email, HttpServletRequest request) throws I9heException {
		Boolean result = false;
		if (privilegeBaseApiService.isEmail(email)) {
			User user = SessionUtil.getSessionUser();
			user.setCookieToken(StringUtil.randomGenerate());
			Map<String, Object> model = new HashMap<String, Object>();

			model.put("username", user.getUsername());
			model.put("validateCode", user.getCookieToken());
			model.put("email",email );
			String content = FreeMarkerUtils.render("classpath:/config/validateemail", "validateEmail.ftl", model);
			JavaMailUtils.sendMail(user.getEmail(), "九河用户邮箱校验", content);
			privilegeBaseApiService.updateUserById(user);
			result = true;
		}
		if (result) {
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}
	
	@RequestMapping(value = "getCode.do", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String sendEmailValidateCode(HttpServletRequest request) throws I9heException {
		String email = request.getParameter("email");// 获取email
		String validateCode = request.getParameter("validateCode");

		try {
			logger.info(email+"进入邮箱验证");
			if(privilegeBaseApiService.processActivate(email, validateCode)){
				User user = privilegeBaseApiService.getUserByLogin(email);
				request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName,user);
				logger.info(email+"验证成功");
				return "success.ftl";
			}
			logger.info(email+"验证失败");
			return "404.ftl";
		} catch (I9heException e) {
			logger.error("邮箱验证异常");
			throw new I9heException("邮箱验证异常", "邮箱"+email+"验证失败", e);
		}// 调用激活方法
	}
	
	@RequestMapping(value = "/validatemobile")
	public String validatemobile(ModelMap map, RedirectAttributes attrs) {
		if (SessionUtil.getSessionUser().getIsValidatedMobile()) {
			attrs.addFlashAttribute("message", "您的手机号码已验证");
			return "redirect:tomydata.do";
		}
		return "security/validateMobile.ftl";
	}
	
	@RequestMapping(value = "/validatemobile", method = RequestMethod.POST)
	public String validatemobile(String validCode, RedirectAttributes attrs,HttpServletRequest request) throws I9heException {
		String sValidCodeCode = (String) ThreadContextHolder.getSession().getAttribute(USER_MOBILE_VALIDCODE);
		ThreadContextHolder.getSession().removeAttribute(USER_MOBILE_VALIDCODE);
		if (ObjectUtils.equals(validCode, sValidCodeCode)) {
			User user = SessionUtil.getSessionUser();
			user.setIsValidatedMobile(true);
			privilegeBaseApiService.updateUserById(user);
			SessionUtil.getSessionUser().setIsValidatedMobile(true);
			attrs.addFlashAttribute("message", "验证成功");
			//发送消息
			MessageContentUtil util = new MessageContentUtil();
			messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("500"), util.getPhoneValidate());
			
			messageService.updateBalances(user.getId(), 500);
			messageService.addLog(user.getId(), 500, "完成手机验证赠送500节操币");
			
			return "redirect:tomydata.do";
		} else {
			attrs.addFlashAttribute("error", "验证码不正确");
			return "redirect:validatemobile.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendsmsvalidcode", method = RequestMethod.POST, produces = "application/json;charset=utf-8") 
	public String sendSmsValidCode() throws I9heException {
		try {
			String mobile = SessionUtil.getSessionUser().getMobile();
			User user = privilegeBaseApiService.getUserByValidatedMobile(mobile);
			if (user != null) {
				return new JsonMessage(1, "改手机号码已被注册").toJSONString();
			}
			
			if (StringUtils.isBlank(mobile)) {
				return new JsonMessage(1, "请先填写手机号码").toJSONString();
			}
			String validCode = new Random().nextInt(9000) + 1000 + "";
			ThreadContextHolder.getSession().setAttribute(USER_MOBILE_VALIDCODE, validCode);
			logger.info("发送手机验证短信到:" + mobile + "验证码: " + validCode);
			boolean res = smsSender.send(mobile, validCode);
			if (res) {
				return new JsonMessage(0, "").toJSONString();
			} else {
				return new JsonMessage(1, "发送验证码失败,请检查手机号码是否正确").toJSONString();
			}
		} catch (Exception e) {
			return new JsonMessage(2, "发送手机验证码异常[" + e.getMessage() + "]").toJSONString();
		}
	}
	
	//设置支付密码
	@RequestMapping(value = "paypassword")
	public String paypassword(ModelMap map) {
		return "security/payPassword.ftl";
	}
	//修改支付密码
	@RequestMapping(value = "editpaypassword")
	public String editPayPassword(ModelMap map) {
		return "security/editPayPassword.ftl";
	}
	@ResponseBody
	@RequestMapping(value="/paypassword",produces = "application/json;charset=UTF-8")
	public String setPayPassword(String password,String payPassword,Integer type){
		if (StringUtils.isEmpty(password) || StringUtils.isEmpty(payPassword)){
			return JSON.toJSONString("fail");
		}
		User user = SessionUtil.getSessionUser();
		if (!user.getPassword().equals(StringUtil.makeMD5(password))){
			return JSON.toJSONString("passwordError");
		}
		Wallet wallet = new Wallet();
		wallet.setUserId(user.getId());
		wallet.setPassword(StringUtil.makeMD5(payPassword));
		walletService.updateByUser(wallet);
		//type=1修改密码，type=0设置密码
		if(type == 1){
			return JSON.toJSONString("editSuccess");
		}
		return JSON.toJSONString("success");
	}
	
	//增票资质跳转
	@RequestMapping(value = "invoicequalified")
	public String invoiceQualified(ModelMap map) {
		
		return "2buser/invoiceQualified.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "invoicequalifed")
	public String invoicequalifed(InvoiceQualifed  invoiceQualifed) throws I9heException{
		Integer result = IinvoiceQuaService.insertInvoiceQualifed(invoiceQualifed);
		return JSON.toJSONString(result>0);
	}
	
	@RequestMapping(value = "invoicelist")
	public String invoiceList(ModelMap map,InvoiceSearchModel invoiceSearchModel) throws I9heException {
		invoiceSearchModel.setPageSize(5);//设置页大小为5
		int userId = SessionUtil.getSessionUserID();
		invoiceSearchModel.setUserId(userId);
		if(invoiceSearchModel.getPageNo() == null){
			invoiceSearchModel.setPageNo(1);
		}
		List<Invoices> invoices	= invoicesService.selectByUserId(invoiceSearchModel);
		List<InvoiceViewModel> InvoiceView = new ArrayList<InvoiceViewModel>();
		
		if(invoices != null&&invoices.size()>0){
			for(Invoices in:invoices ){
				InvoiceViewModel invoiceViewModel = new InvoiceViewModel();
				invoiceViewModel.setType(in.getType());
				invoiceViewModel.setState(in.getState());
				Order order = orderBaseApiServcie.getOrderById(in.getOrderId());
				List<Order> orderList = orderBaseApiServcie.getOrderListByBatch(in.getOrderId());
				User user = privilegeBaseApiService.getUserById(order.getUserId());
				order.setUserName(user.getUsername());
				if(null != orderList && orderList.size()>0){
					for(Order ord:orderList){
						OrderGoods ordGoods = orderBaseApiServcie.getOrderGoodsByOrderId(ord.getId());
						Goods g = goodsService.getGoodsByid(ordGoods.getGoodsId());
						ord.setGoodsName(g.getGoodsName());
						ord.setGoodsImg(g.getGoodsImg());
						ord.setGoodsId(g.getId());
						ord.setCount(ordGoods.getCount());
					}
					order.setOrderType(1);//购物车单
					order.setOrderList(orderList);
				}else{
					OrderGoods orderGoods = orderBaseApiServcie.getOrderGoodsByOrderId(in.getOrderId());
					Goods good = goodsService.getGoodsByid(orderGoods.getGoodsId());
					order.setGoodsName(good.getGoodsName());
					order.setGoodsImg(good.getGoodsImg());
					order.setGoodsId(good.getId());
					order.setCount(orderGoods.getCount());
					order.setOrderType(0);//普通单
				}
				invoiceViewModel.setOrder(order);
				InvoiceView.add(invoiceViewModel);
			}
		}
		PageModel page = invoicesService.getPageModel(invoiceSearchModel);
		
		map.put("page", page);
		map.put("invoiceList", InvoiceView);
		return "2buser/invoiceList.ftl";
	}
	
	//我的订阅
	@RequestMapping(value="/subscribe")
	public String Subscribe(ModelMap map) throws I9heException{
		List<Subscribe> subscribe = subscribeService.getSubscribeByUser();
		List<TagCategory> TagCategorys = subscribeService.getAllTags();
		map.put("TagCategorys", TagCategorys);
		map.put("subscribes", subscribe);
		return "subscribe/mysubscribe.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/delsubscribe",method = RequestMethod.POST, produces = MIME_JSON)
	public String deleteSubscribe(Integer tagId) throws I9heException{
		Integer res = subscribeService.deleteSubscribe(tagId);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value="/addsubscribe",method = RequestMethod.POST, produces = MIME_JSON)
	public String addSubscribe(Integer tagId) throws I9heException{
		Integer res = subscribeService.addSubscribe(tagId);
		return JSON.toJSONString(res>0);
	}
	
	//帐号绑定
		@RequestMapping("/oauth")
		public String oauth(ModelMap map) throws I9heException {
			List<UserLogin> logins = privilegeBaseApiService.getLogins(SessionUtil.getSessionUserID());
			Map<String, String> loginTypes = new HashMap<String, String>();
			for (UserLogin userLogin : logins) {
				loginTypes.put(StringUtils.defaultString(userLogin.getType()), userLogin.getLoginName());
			}
			map.put("loginTypes", loginTypes);
			map.put("casUrl", config.getCasServerUrl());
			return "security/oauth.ftl";
		}
		
		@ResponseBody
		@RequestMapping(value = "/unbindoauth", method = RequestMethod.POST, produces = MIME_JSON)
		public String unbindoauth(String type, ModelMap map) throws I9heException {
			int userId = SessionUtil.getSessionUserID();
			privilegeBaseApiService.deleteLogin(userId, type);
			return JSON.toJSONString(true);
		}
		@RequestMapping("/qqCheck")
		public String qqCheck(HttpServletRequest request ){
			int userId = SessionUtil.getSessionUserID();
			UserExpand userExpand = userExpandService.findById();
			//没有创建
			if(userExpand==null){
				userExpand = new UserExpand();
				userExpand.setUserId(userId);
				userExpand.setCreateTime(new Date());
				userExpandService.insert(userExpand);
			}
			//等于0给节操币 
			if(userExpand.getQqjcb()==0){
				MessageContentUtil util = new MessageContentUtil();
				messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle("200"), util.getQQ());
				//增加节操币
				userExpand.setQqjcb(1);
				userExpandService.update(userExpand);
				
				messageService.updateBalances(userId, 200);
				messageService.addLog(userId, 200, "完成QQ绑定赠送200节操币");
			}
			return "redirect:/controller/user/oauth.do?type=qqauth20";
		}
}
