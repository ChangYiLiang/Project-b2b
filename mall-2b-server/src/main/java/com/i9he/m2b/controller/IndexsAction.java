package com.i9he.m2b.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.lang.StringUtils;
import org.jasig.cas.client.util.CommonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xmlpull.v1.builder.XmlSerializable;

import com.i9he.common.cas.client.restful.CasClientUtils;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.RequestUtils;
import com.i9he.m2b.biz.IAuthenticationService;
import com.i9he.m2b.biz.IBalancesService;
import com.i9he.m2b.biz.IConcernService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.IUserExpandService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.BonusMapper;
import com.i9he.m2b.model.Authentication;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.Bonus;
import com.i9he.m2b.model.Message;
import com.i9he.m2b.model.UserExpand;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.search.UserCenterCountsModel;
import com.i9he.m2b.util.ConfigUtil;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.StringUtil;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Login;
import com.i9he.privilege.model.User;
import com.nr.comm.util.DateUtil;

/**
 * 主界面及登录验证相关的控制器
 */
@Security
@Controller
@RequestMapping("/controller")
public class IndexsAction {

	private static Logger logger = LoggerFactory.getLogger(IndexsAction.class);

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private ConfigUtil configUtil;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Resource
	private IBalancesService balancesService;
	@Autowired
	private BonusMapper bonusMapper;
	@Autowired
	private Balances2bMapper balancesMapper;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IConcernService concernService;
	
	@Autowired
	private IWalletService walletService;
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private IUserExpandService userExpandService;
	
	@Autowired
	private IAuthenticationService authenticationService;
	// @Autowired
	// private IBusinessBaseApiService businessBaseApiService;
	// @Autowired
	// private IAssetsBaseApiService assetsBaseApiService;

	@RequestMapping("/register")
	public String loginRegister(HttpServletRequest request) {
		return "register.ftl";
	}

	@RequestMapping("/main")
	public String main(String visitedModule, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		return "main.ftl";
	}

	@Security(validate = false)
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		String ticketUrl = (String) ThreadContextHolder.getSession().getAttribute("casTicketUrl");
//		String redirectUrl;
//		if (StringUtils.isNotBlank(ticketUrl)) {
//			CasClientUtils.logout(ticketUrl);
//			redirectUrl = "/";
//		} else {
//			String serviceUtl = RequestUtils.getClientUrl("");
//			redirectUrl = CommonUtils.constructRedirectUrl(configUtil.getCasServerUrl() + "/logout", "service", serviceUtl, false, false);
//		}
		
		String serviceUtl = RequestUtils.getClientUrl("");
		String redirectUrl = CommonUtils.constructRedirectUrl(configUtil.getCasServerUrl() + "/logout", "service", serviceUtl, false, false);

		User user = SessionUtil.getSessionUser(request);
		if (user != null) {
			Login logout = new Login();
			logout.setCreateDate(DateUtil.getSysDate());
			logout.setIsAdmin(user.getIsAdmin());
			logout.setLastLoginIp(request.getRemoteAddr());
			Byte a = 1;
			logout.setType(a);
			logout.setUserId(user.getId());
			logout.setUserType(user.getType());
			privilegeBaseApiService.insertLogout(logout);
		}
		SessionUtil.clearSession(request);

		return new ModelAndView("redirect:" + redirectUrl);
	}

	// @RequestMapping(value="getCode",method={RequestMethod.GET,RequestMethod.POST},produces="text/plain;charset=UTF-8")
	// public String sendEmailValidateCode(HttpServletRequest request ) throws
	// I9heException{
	// String email = request.getParameter("email");//获取email
	// String validateCode = request.getParameter("validateCode");
	// try {
	// privilegeBaseApiService.processActivate(email, validateCode);
	// } catch (I9heException e) {
	// logger.error(MallErroCode.MALL_EMAIL_VERIFY_ERRO);
	// throw new I9heException(MallErroCode.MALL_EMAIL_VERIFY_ERRO,
	// "邮箱"+email+"验证失败", e);
	// }//调用激活方法
	// return "redirect:"+configUtil.getCasServiceUrl();
	// }

	@ResponseBody
	@RequestMapping(value = "/verificationCode", produces = "text/plain;charset=UTF-8")
	public String verificationCode(String email, String validcode, HttpServletRequest request) throws I9heException {
		if (privilegeBaseApiService.processActivate(email, validcode)) {
			User user = privilegeBaseApiService.getUserByLogin(email);
			request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}

	@ResponseBody
	@RequestMapping(value = "/sendCode", produces = "text/plain;charset=UTF-8")
	public String sendCodeByEmail(String email, HttpServletRequest request) throws I9heException {
		if (privilegeBaseApiService.sendCodeByUserEmail(email)) {
			// User user = privilegeBaseApiService.getUserByLogin(email);
			// user.setUpdatedDate(DateUtil.getSysDate());
			// privilegeBaseApiService.updateUserById(user);
			// request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName,user);
			return ConstantUtil.Success;
		}
		return ConstantUtil.Fail;
	}

	@RequestMapping(value = "toUserCenter", produces = "text/plain;charset=UTF-8")
	public String toUserCenter(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int  id   = user.getId();
		List<Bonus> BonusOne   = bonusMapper.getBonusOne(id);
		int  size = BonusOne.size();
		//Balances balances = balancesService.getBalancesByUserid(user.getId());
		//初始化余额
		Wallet wallet2 = walletService.findByUserId();
		if(wallet2==null){
			Wallet wallet1 = new Wallet();
			wallet1.setMoney(new BigDecimal(0));
			wallet1.setErrorCount(0);
			wallet1.setErrorAll(5);
			wallet1.setUserId(id);
			wallet1.setCreateTime(new Date());
			walletService.insert(wallet1);
		}
		
		//节操币
		Balances ba = balancesMapper.selectByPrimaryKey(id);
		if(ba==null){
			Balances iba = new Balances();
			iba.setUserId(id);
			iba.setFestBalance(1000);
			balancesMapper.insert(iba);
		}
		if(ba!=null){
			map.put("fest", ba.getFestBalance());
		}
		
		UserCenterCountsModel count = orderService.getOrderStateCount();
		int count1 = concernService.concernCount();
		
		Authentication authentication =  authenticationService.findByUserId();
		if(authentication==null){
			map.put("vip", 0);
		}else{
			if(authentication.getStatus()!=1){
				map.put("vip", 0);
			}else{
				map.put("vip", 1);
				map.put("name", authentication.getName());
			}
		}
		Wallet wallet = walletService.findByUserId();
		if (wallet != null) {
			map.put("yue", wallet.getMoney());
		}
		UserExpand userExpand =	userExpandService.findById();
		if (userExpand != null) {
			if (userExpand.getUserImg() != null) {
				map.put("userImg",userExpand.getUserImg());//用户头像 
			}
		}
		
		map.put("count1", count1);
		map.put("orderCount", count);
		map.put("size", size);
		//map.put("balances", balances);
		map.put("user", user);
		return "2buser/Main2b.ftl";

	}

	@RequestMapping(value = "tocpassword", produces = "text/plain;charset=UTF-8")
	public String toChangePassword(HttpServletRequest request, ModelMap map) {
		return "user/cpassword.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/modifypassword", produces = "text/plain;charset=UTF-8")
	public String modifypassword(String oldpassword, String password, HttpServletRequest request) throws Exception {
		if (StringUtils.isEmpty(oldpassword) || StringUtils.isEmpty(password))
			return ConstantUtil.Fail;
		// 初始化用户、菜单
		User user = SessionUtil.getSessionUser(request);
		if (!user.getPassword().equals(StringUtil.makeMD5(oldpassword)))
			return ConstantUtil.Fail;
		User newUser = new User();
		newUser.setId(user.getId());
		newUser.setPassword(StringUtil.makeMD5(password));
		newUser.setOldPassword1(StringUtil.makeMD5(oldpassword));
		newUser.setUpdatedDate(new Date());
		newUser.setUpdatedBy(user.getUsername());
		privilegeBaseApiService.updateUserById(newUser);

		user.setPassword(newUser.getPassword());
		request.getSession().setAttribute(SessionUtil.SessionSystemLoginUserName, user);

		return ConstantUtil.Success;
	}

	/*@ResponseBody
	@RequestMapping(value = "/getOrderDataTables", produces = "application/json;charset=utf-8")
	public String getRoleDataTables(HttpServletRequest request, OrderSearchModel searchModel) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		searchModel.setUserId(user.getId());
		searchModel.setIsDelete(false);
		List<Order> list = orderBaseApiServcie.getOrderBySearch(searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		long count = orderBaseApiServcie.getOrderCount(searchModel);
		map.put("aaData", list);
		map.put("iTotalRecords", (int) count);
		map.put("iTotalDisplayRecords", (int) count);
		return JSON.toJSONString(map).toString();
	}*/

//	@RequestMapping(value = "toMyOrder", produces = "text/plain;charset=UTF-8")
//	public String toMyOrder(HttpServletRequest request, ModelMap map, OrderSearchModel searchModel) throws I9heException {
//		User user = SessionUtil.getSessionUser(request);
//		searchModel.setUserId(user.getId());
//		searchModel.setUserName(user.getNickName());
//		searchModel.setType1(1);
//		List<Order> list = orderBaseApiServcie.getB2BOrderBySearch(searchModel);
//		
//		map.put("orderList", list);
//		map.put("orderState", SysConstant.ORDER_STATUS_MAP);
//		return "order/orderlist.ftl";
//	}

//	@RequestMapping(value = "toMyBusiness", produces = "text/plain;charset=UTF-8")
//	public String toMyBusiness(HttpServletRequest request, ModelMap map) throws I9heException {
//		User user = SessionUtil.getSessionUser(request);
//		map.put("user", user);
//		OrderSearchModel orderSearchModel = new OrderSearchModel();
//		orderSearchModel.setUserId(user.getId());
//		try {
//			Balances balances = balancesService.getBalancesByUserid(user.getId());
//			map.put("balances", balances);
//			map.put("CLIENT_GENDER_MAP", SysConstant.CLIENT_GENDER_MAP);
//			// List<BusinessWithBLOBs>
//			// business=businessBaseApiService.getMybusiList(user.getId());
//			// map.put("businesslist", business);
//			return "user/myBusiness1.ftl";
//		} catch (I9heException e) {
//			logger.error("跳转我的业务页面异常");
//			throw new I9heException(MallErroCode.MALL_TO_MYBUSSINESS_ERRO, "跳转我的业务页面异常", e);
//		}
//	}

	// @RequestMapping(value="toMerchantBusiness",produces="text/plain;charset=UTF-8")
	// public String toMerchantBusiness(HttpServletRequest request,ModelMap map)
	// throws I9heException{
	// User user = SessionUtil.getSessionUser(request);
	// map.put("user", user);
	// String merchantNo = user.getMerchantNo();
	// BusinessSearchModel businessSearchModel = new BusinessSearchModel();
	// businessSearchModel.setMerchantNo(merchantNo);
	// //List<BusinessView>
	// business=businessBaseApiService.getBusiList(businessSearchModel);
	// //map.put("businesslist", business);
	// return "user/merchantBusiness.ftl";
	// }
	
	
}
