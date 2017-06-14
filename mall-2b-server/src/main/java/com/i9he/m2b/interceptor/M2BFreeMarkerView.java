package com.i9he.m2b.interceptor;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasig.cas.client.util.CommonUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.RequestUtils;
import com.i9he.m2b.biz.IBalancesService;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.MessageService;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.Cart;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.search.MessageSearchModel;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SysConstant;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.m2b.util.UserForMessageTypeIds;
import com.i9he.ord.model.OrderSearchModel;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.model.User;

import freemarker.ext.servlet.IncludePage;

public class M2BFreeMarkerView extends FreeMarkerView {

	private IOrderBaseApiServcie orderBaseApiServcie;

	private IBalancesService balancesService;

	private ICartService cartService;
	
	private MessageService messageService;
	
	private ICategoryService categoryService;
	
	private IGoodsService goodsService;
	
	private final String EXPORT_KEY = getClass().getName() + ".ExportKey";

	@Override
	protected void initServletContext(ServletContext servletContext) throws BeansException {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		orderBaseApiServcie = ctx.getBean(IOrderBaseApiServcie.class);
		balancesService = ctx.getBean(IBalancesService.class);
		cartService = ctx.getBean(ICartService.class);
		messageService = ctx.getBean(MessageService.class);
		categoryService = ctx.getBean(ICategoryService.class);
		goodsService = ctx.getBean(IGoodsService.class);
		
		super.initServletContext(servletContext);
	}

	@Override
	protected void applyContentType(HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "POST, GET");
		response.addHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
		super.applyContentType(response);
	}
	
	

	@Override
	protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request) throws Exception {
		// 防止自请求多次执行
		if (model.get(EXPORT_KEY) != null) {
			return;
		}
		
		User user = SessionUtil.getSessionUser(request);
		
		Long ordercount = 0L;
		Balances balances = null;
		Integer cartCount = 0;
		Integer messageCount = 0;
		Integer unCommentCount = 0;
		List<Cart> cartuser = null;
		BigDecimal cartsum = null;
		Integer cartlong = 0;
		Map catlist = getdata();
		
		try {
			if (user != null) {
				OrderSearchModel orderSearchModel = new OrderSearchModel();
				orderSearchModel.setUserId(user.getId());
				orderSearchModel.setIsDelete(false);
				balances = balancesService.getBalancesByUserid(user.getId());
				cartCount = cartService.getCartCount(user.getId());
				ordercount = orderBaseApiServcie.getOrderCount(orderSearchModel);
				messageCount = messageService.messageCount(this.getMessageModel());
				unCommentCount = this.getUnCommentCount(user.getId());
				cartuser = getcart();
				cartsum  = getcartsum();
				cartlong = getcartlong();
			}
		} catch (Exception e) {
			logger.error("获取登录用户数据出错", e);
		}

		model.put("ordercount", ordercount);
		model.put("balances", balances);
		model.put("cartcount", cartCount);
		model.put("unCommentCount", unCommentCount);
		model.put("messageCount", messageCount);
		model.put("cartuser", cartuser);
		model.put("cartsum", cartsum);
		model.put("cartlong", cartlong);

		model.put("user", user);
		model.put("type2map", JSON.toJSONString(SysConstant.wrap(SysConstant.ORDER_TYPE2_MAP)));
		model.put("statemap", JSON.toJSONString(SysConstant.wrap(SysConstant.ORDER_STATUS_MAP)));
		model.put("busitype", JSON.toJSONString(SysConstant.wrap(SysConstant.SERVICE_TYPE)));
		model.put("busistate", JSON.toJSONString(SysConstant.wrap(SysConstant.SERVICE_STATE)));
		model.put("CLIENT_GENDER_MAP", SysConstant.CLIENT_GENDER_MAP);

		model.put("url", constructServiceUrl(request, null));
		
		// BasePath
		String basePath = RequestUtils.getClientUrl(request, "");
		//basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		//basePath += request.getContextPath();
		model.put("BasePath", basePath);
		
		model.put("catlist", catlist);
		model.put("include", new IncludePage(request, ThreadContextHolder.getHttpResponse()));
		model.put(EXPORT_KEY, true);
		super.exposeHelpers(model, request);
	}

	private Integer getUnCommentCount(Integer userId) throws I9heException {
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.setUserId(userId);
		searchModel.setState(7);//已收货
		searchModel.setIsComment(0);//待评价
		Integer count = orderBaseApiServcie.getB2BOrderCount(searchModel);
		return count;
	}

	protected final String constructServiceUrl(final HttpServletRequest request, final HttpServletResponse response) {
		

		// return CommonUtils.constructServiceUrl(request, response,
		// this.service, this.serverName, this.artifactParameterName,
		// this.encodeServiceUrl);
		String currentPage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getRequestURI() + (CommonUtils.isNotBlank(request.getQueryString()) ? ("?" + request.getQueryString()) : "");
		String ticket = request.getParameter("ticket");
		// 去掉参数中所有ticket相关的部分
		currentPage = currentPage.replace("%3Fticket%3D" + ticket, "");
		currentPage = currentPage.replace("&ticket=" + ticket, "");
		currentPage = currentPage.replace("?ticket=" + ticket, "");
		currentPage = currentPage.replace("&service=", "?service");
		return currentPage;
	}
	
	private MessageSearchModel getMessageModel(){
		Integer userId = SessionUtil.getSessionUser().getId();
		MessageSearchModel mm = new MessageSearchModel();
		mm.setIsRead((byte)0);
		mm.setUserId(userId);
		mm.setIsReceive((byte)1);
		return mm;
	}
	
	private List<Cart> getcart() throws I9heException{
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Cart> cart = cartService.ListCartByUserId(userId);
		return cart;
	}
	private BigDecimal getcartsum() throws I9heException{
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Cart> cart = cartService.ListCartByUserId(userId);
		BigDecimal sum = cartService.getAllPrice(userId);
		return sum;
	}
	private int getcartlong() throws I9heException{
		Integer userId = SessionUtil.getSessionUser().getId();
		List<Cart> cart = cartService.ListCartByUserId(userId);
		int l  = cart.size();
		return l;
	}
	private Map<String, Object> getdata() throws I9heException{
		List<Category> demo = categoryService.getmaxcat();
		Map<String, Object> map1  = new HashMap<String, Object>();
		for (Category category : demo) {
			List<Category> catsecondlist = categoryService.getsecondcat(category.getId());
			String name = category.getName();
			Map<String, Object> map2  = new HashMap<String, Object>();
			for(Category category2 : catsecondlist){
				List<Goods> goodslist = goodsService.getGoodsByCategoryId(category2.getId());
				String name2   = category2.getName();
				map2.put(name2, goodslist);
			}
			map1.put(name, map2);
		}
		return map1;
	}
	
}
