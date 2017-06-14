package com.i9he.m2b.server.controller;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.i9he.common.alipay.AlipayDirectModel;
import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.common.jdpay.JDPayModel;
import com.i9he.common.jdpay.JDPayQueryModel;
import com.i9he.common.util.DateUtil;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.BespokeMapper;
import com.i9he.m2b.mapper.BonusMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.SuggestMapper;
import com.i9he.m2b.mapper.UserBonusMapper;
import com.i9he.m2b.mapper.userBalance2bMapper;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.Bespoke;
import com.i9he.m2b.model.Bonus;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.Suggest;
import com.i9he.m2b.model.UserBonus;
import com.i9he.m2b.model.Wallet;
import com.i9he.m2b.model.userBalance;
import com.i9he.m2b.model.search.UserbalanceSearchModel;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MessageContentUtil;
import com.i9he.m2b.util.PathUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.ord.model.Order;
import com.i9he.privilege.model.User;

@Security
@Controller
@RequestMapping("/mark")
public class MarkController {
	@Autowired
	private ICategoryService categoryService;
	@Resource
	private IGoodsService goodsService;
	@Autowired
	private userBalance2bMapper userbalanceMapper;
	@Autowired
	private BonusMapper bonusMapper;
	@Autowired
	private UserBonusMapper userbonusMapper;
	@Autowired
	private FestLogMapper festlogMapper;
	@Autowired
	private IWalletService walletService;
	@Autowired
	private Balances2bMapper balancesMapper;
	@Autowired
	private SuggestMapper suggestmapper;
	@Autowired
	private BespokeMapper bespokemapper;
	@Autowired
	private MessageService messageService; 
	
	private static final Logger logger = Logger.getLogger(MarkController.class);
	
	//痕迹功能已废弃
	@RequestMapping(value = "usermark")
	public String toUserMark(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		Map<String, Object> mapgoods  = new HashMap<String, Object>();
		Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
        if (null==cookies) {
            System.out.println("没有cookie=========");
        } else {
            for(Cookie cookie : cookies){
            	String name = cookie.getName();
            	if(name.length()>9){
            		System.out.println("");
            	}else{
            		int goodsid = Integer.parseInt(cookie.getValue());
            		Goods goods = goodsService.selectByPrimaryKey(goodsid);
            		mapgoods.put(name, goods);
            	}  	
            }
        }
        System.out.println(mapgoods);
        map.put("mapgoods", mapgoods);
		return "mark/mark.ftl";
	}
	
	//充钱
	@RequestMapping(value = "usercharge")
	public String toUserCharge(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int    id = user.getId();
		List<userBalance> listt = userbalanceMapper.getallbyuser(id);//全部记录
		List<userBalance> listafter = userbalanceMapper.getAfterlog(id);//近半年记录
		List<userBalance> listbefore = userbalanceMapper.getBeforelog(id);//半年前记录
		map.put("list", listt);
		map.put("listafter", listafter);
		map.put("listbefore", listbefore);
		Wallet wallet = walletService.findByUserId();
		map.put("yue", wallet.getMoney());
		return "mark/charge.ftl";
	}
	
	//去充钱
	@RequestMapping(value = "tocharge")
	public String toCharge(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int    id = user.getId();
		map.put("user", user);
		return "mark/tocharge.ftl";
	}
	
	//选择充钱方式
	@RequestMapping(value = "chargetype")
	public String ChargeType(HttpServletRequest request, ModelMap map,BigDecimal money) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int    id = user.getId();
		BigDecimal pay = money;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String orderNo = sdf.format(new Date()) + "Charge"+id;

		userBalance ub = new userBalance();
		ub.setUserId(SessionUtil.getSessionUser().getId());
		ub.setMoney(money);
		ub.setChargeOrder(orderNo);
		ub.setChargeType(ConstantUtil.Charge_No);
		ub.setChargeSj(new Date());
		ub.setChargeLog("充值"+money+"未支付");
		userbalanceMapper.insertSelective(ub);
		logger.info("生成充值账单-未支付");
		int ChargeId = userbalanceMapper.GetMaxID(id);
		return "redirect:/mark/tochargetype.do?"+"ChargeId="+ChargeId;
		
	}
	
	//选择充钱方式
	@RequestMapping(value = "tochargetype")
	public String TuChargeType(HttpServletRequest request, ModelMap map,Integer ChargeId) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int    id = user.getId();
		userBalance ub = userbalanceMapper.selectByPrimaryKey(ChargeId);
		map.put("ChargeId", ChargeId);
		map.put("pay", ub.getMoney());
		map.put("user", user);
		return "mark/chargetype.ftl";
	}
	
	
	//充钱明细-注:这个页面纯属多余只为了满足他们的2B要求
	@RequestMapping(value = "userchargeinfo")
	public String toUserChargeInfo(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int    id = user.getId();
		List<userBalance> listt = userbalanceMapper.getallbyuser(id);//全部记录
		map.put("list", listt);
		Wallet wallet = walletService.findByUserId();
		map.put("yue", wallet.getMoney());
		return "mark/chargeinfo.ftl";
	}
	
	
	//节操券
	@RequestMapping(value = "userbonus")
	public String toUserBonus(HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		int  id   = user.getId();
		List<Bonus> BonusOne   = bonusMapper.getBonusOne(id);
		List<Bonus> BonusTwo   = bonusMapper.getBonusTwo(id);
		List<Bonus> BonusThree = bonusMapper.getBonusThree(id);
		List<Bonus> Bonusget   = bonusMapper.cangetbonus();
		map.put("BonusOne", BonusOne);
		map.put("BonusTwo", BonusTwo);
		map.put("BonusThree", BonusThree);
		map.put("Bonusget", Bonusget);
		return "mark/bonus.ftl";
	}
	
	//节操币
	@RequestMapping(value = "userfest")
	public String toUserFest(HttpServletRequest request, ModelMap map) throws I9heException {
		List<FestLog> list = festlogMapper.getFestLogList(SessionUtil.getSessionUser(request).getId());
		List<FestLog> listadd = festlogMapper.getFestLogAdd(SessionUtil.getSessionUser(request).getId());
		List<FestLog> listcut = festlogMapper.getFestLogCut(SessionUtil.getSessionUser(request).getId());
		//节操币
		Balances ba = balancesMapper.selectByPrimaryKey(SessionUtil.getSessionUser().getId());
		if(ba==null){
			Balances iba = new Balances();
			iba.setUserId(SessionUtil.getSessionUser().getId());
			iba.setFestBalance(1000);
			balancesMapper.insert(iba);
		}
		if(ba!=null){
			map.put("fest", ba.getFestBalance());
		}
		map.put("list", list);
		map.put("listadd", listadd);
		map.put("listcut", listcut);
		return "mark/festinfo.ftl";
	}
	
	//节操币规则
	@RequestMapping(value = "festrule")
	public String toFestrule(HttpServletRequest request, ModelMap map) throws I9heException {
		return "mark/festrule.ftl";
	}
	
	//投诉建议
	@RequestMapping(value = "suggest")
	public String tosuggest(HttpServletRequest request, ModelMap map) throws I9heException {
		return "mark/suggest.ftl";
	}
	
	//预约上门
	@RequestMapping(value = "bespoke")
	public String tobespoke(HttpServletRequest request, ModelMap map) throws I9heException {
		List<Bespoke> list = bespokemapper.getlogbyuser(SessionUtil.getSessionUser().getId());
		map.put("list", list);
		return "mark/bespoke.ftl";
	}
	
	//预约上门详情
	@RequestMapping(value = "bespokeinfo")
	public String tobespokeinfo(Integer id, ModelMap map) throws I9heException {
		Bespoke list = bespokemapper.selectByPrimaryKey(id);
		map.put("list", list);
		return "mark/bespokeinfo.ftl";
	}
	
	//推荐返利
	@RequestMapping(value = "usergroom")
	public String tousergroom(HttpServletRequest request,ModelMap map) throws I9heException {
		return "mark/usergroom.ftl";
	}
	
//	@RequestMapping(value ="/toAlipay")
//	public String toAlipay(BigDecimal money, RedirectAttributes attrs,HttpServletRequest request) throws IOException {
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//		String orderNo = sdf.format(new Date()) + "chongzi_1";
//		AlipayDirectModel model = new AlipayDirectModel("会员充值", money, orderNo, B2BConstants.PAY_TYPE_CHARGE);
//		
//		userBalance ub = new userBalance();
//		ub.setUserId(SessionUtil.getSessionUser().getId());
//		ub.setMoney(money);
//		ub.setChargeOrder(orderNo);
//		ub.setChargeType(1);
//		ub.setChargeSj(new Date());
//		ub.setChargeLog("会员"+SessionUtil.getSessionUser().getId()+"于"+new Date()+"支付宝充值"+money+"未支付");
//		userbalanceMapper.insertSelective(ub);
//		logger.info("生成充值账单-未支付");
//		
//		//对应applicationContext-pay.xml 里面的充值回调id
//		model.setExtraCommonParam("chargeAlipayCallback");
//		attrs.addFlashAttribute(PayController.ALIPAY_DIRECT_MODEL, model);
//		logger.info("开始进入支付宝回调支付");
//		return "redirect:/pay/alipay.do";
//		
//	}
	
	@ResponseBody
	@RequestMapping(value ="adduserbonus", produces = "text/html;charset=utf-8")
	public String adduserbonus(Integer bonusId) throws IOException {
		Bonus p =  bonusMapper.checknum(bonusId);
		Bonus pp=  bonusMapper.selectByPrimaryKey(bonusId);
		if(p==null){
			bonusMapper.upgetnum(bonusId);
		}
		User user  = SessionUtil.getSessionUser();
		UserBonus ub = new UserBonus();
		int userId= user.getId();
		int k = userbonusMapper.getsum(userId, bonusId);
		if(k==pp.getCangetNum()){
			return JSON.toJSONString(false);
		}
		ub.setUserId(userId);
		ub.setBonusId(bonusId);
		userbonusMapper.insertSelective(ub);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/userbalancelist", produces = "text/html;charset=utf-8")
	public String userbalancelist(UserbalanceSearchModel model) throws I9heException {
		List<userBalance> userbalance  = userbalanceMapper.getUserbalance(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", userbalance);
		map.put("iTotalRecords", model.getTotal());
		map.put("iTotalDisplayRecords", model.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/exchangefest", produces = "text/html;charset=utf-8")
	public String exchangefest(Integer logNum ,HttpServletRequest request) throws I9heException {
		int userId = SessionUtil.getSessionUser().getId();
		Balances ba = balancesMapper.selectByPrimaryKey(SessionUtil.getSessionUser().getId());
		if(ba.getFestBalance()<logNum){
			return JSON.toJSONString(false);
		}
		else if(logNum<=0){
			return JSON.toJSONString(false);
		}
		else
		{
			int end = ba.getFestBalance()-logNum;//更新的节操币数量
			double money = logNum.doubleValue()/ConstantUtil.Rate_Of_Exchange;//可兑换的余额
			
			//修改增加用户余额
			Wallet wallet = new Wallet();
			Wallet wallet1 = walletService.findByUserId();
			wallet.setUserId(userId);
			wallet.setMoney(wallet1.getMoney().add(new BigDecimal(money)));
			walletService.updateByUserId(wallet);
			logger.info("增加用户"+userId+"余额"+money);
			//减少用户节操币
			Balances balances = new Balances();
			balances.setUserId(userId);
			balances.setFestBalance(end);
			balancesMapper.updateByPrimaryKeySelective(balances);
			logger.info("减少用户"+userId+"节操币"+logNum);
			//插入余额记录表
			userBalance UB = new userBalance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String orderNo = sdf.format(new Date()) + "Charge"+userId;
			UB.setUserId(userId);
			UB.setMoney(new BigDecimal(money));
			UB.setChargeSj(new Date());
			UB.setChargeOrder(orderNo);
			UB.setChargeType(4);
			UB.setChargeLog("充值"+money+"成功");
			userbalanceMapper.insertSelective(UB);
			//插入日志记录
			FestLog festlog = new FestLog();
			festlog.setUserId(userId);
			festlog.setLogNum(logNum);
			festlog.setLogTime(new Date());
			festlog.setLogDesc("兑换余额"+money+"减少节操币"+logNum);
			festlogMapper.insertSelective(festlog);
			MessageContentUtil util = new MessageContentUtil();
			//插入消息
			messageService.addMessage(PathUtil.getPath(request)+"mark/userfest.do", util.getJcbTitle1(logNum+""), util.getYue(logNum+"",money+""));
			logger.info("用户"+userId+"兑换余额"+money+"减少节操币"+logNum);
		}
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertsuggest", produces = "text/html;charset=utf-8")
	public String insertsuggest(Suggest record) throws I9heException {
		record.setUserId(SessionUtil.getSessionUser().getId());
		suggestmapper.insertSelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertbespoke", produces = "text/html;charset=utf-8")
	public String insertbespoke(Bespoke record) throws I9heException {
		record.setSubmitDate(DateUtil.getSysDate());
		record.setUserid(SessionUtil.getSessionUser().getId());
		bespokemapper.insertSelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatebespoke", produces = "text/html;charset=utf-8")
	public String updatebespoke(Bespoke record) throws I9heException {
		bespokemapper.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
	@RequestMapping("/toAlipay")
	public String toAlipay(Boolean qrMode, RedirectAttributes attrs,String ChargeId)
			throws IOException, NumberFormatException, I9heException {

		userBalance ub = userbalanceMapper.selectByPrimaryKey(Integer.parseInt(ChargeId));
		BigDecimal price = ub.getMoney();
		AlipayDirectModel model = new AlipayDirectModel("充值支付", price, ChargeId, B2BConstants.PAY_TYPE_CHARGE);
		model.setExtraCommonParam("payChargeCallback");
		attrs.addFlashAttribute(PayController.ALIPAY_DIRECT_MODEL, model);
		attrs.addFlashAttribute("QrMode", qrMode);
		return "redirect:/pay/alipay.do";
		
	}
	
	@RequestMapping("/wxpay")
	public String wxPay(RedirectAttributes attrs,String orderId){
		attrs.addFlashAttribute(PayController.WXPAY_MODEL, "CHARGE_"+orderId);
		return "redirect:/pay/wxpay.do";
	}

	@RequestMapping("/jdpay")
	public String jdpay(RedirectAttributes attrs, Integer orderId, String bank) throws I9heException {
		userBalance ub = userbalanceMapper.selectByPrimaryKey(orderId);
		JDPayModel jdpayModel = new JDPayModel(ub.getMoney(), bank, orderId.toString(), B2BConstants.PAY_TYPE_CHARGE);
		attrs.addFlashAttribute(PayController.JDPAY_MODEL, jdpayModel);
		return "redirect:/pay/jdpay.do";
	}
	
	@RequestMapping("/jdpay_query")
	public String jdpayQuery(RedirectAttributes attrs, String orderId) throws I9heException {
		JDPayQueryModel jdpayModel = new JDPayQueryModel(B2BConstants.PAY_TYPE_CHARGE, orderId);
		attrs.addFlashAttribute(PayController.JDPAY_QUERY_MODEL, jdpayModel);
		return "redirect:/pay/jdpay_query.do";
	}
	
	@ResponseBody
	@RequestMapping("/f5")
	public String state(userBalance record,HttpServletRequest request) throws NumberFormatException, I9heException {
		userBalance ub = userbalanceMapper.selectByPrimaryKey(record.getId());
		if(ub.getChargeType()==ConstantUtil.Charge_No){
			return JSON.toJSONString(false);
		}
		return JSON.toJSONString(true);
	}
	
}