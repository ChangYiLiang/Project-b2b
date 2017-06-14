package com.i9he.m2b.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.config.FinanCanstants;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ICartService;
import com.i9he.m2b.biz.ICategoryService;
import com.i9he.m2b.biz.ICommentService;
import com.i9he.m2b.biz.IGoodsItemService;
import com.i9he.m2b.biz.IGoodsService;
import com.i9he.m2b.biz.IGoodsTagService;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.biz.IItemcategoryService;
import com.i9he.m2b.biz.IOrderService;
import com.i9he.m2b.biz.impl.SyUrlService;
import com.i9he.m2b.biz.model.PageModel;
import com.i9he.m2b.mapper.GoodsGalleryMapper;
import com.i9he.m2b.mapper.PromotionMapper;
import com.i9he.m2b.mapper.TruDatacenterMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Comment;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.GoodsItem;
import com.i9he.m2b.model.Goodstag;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.Promotion;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.server.biz.IAreaService;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.SysConstant;
import com.i9he.m2b.util.ThreadContextHolder;
import com.i9he.ord.model.Order;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
import com.nr.comm.util.DateUtil;
/**
 * 主界面及登录验证相关的控制器
 */

@Controller
@RequestMapping({ "/", "/i9he" })
public class IdcController {
	
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IItemService itemsService;
	@Resource
	private ICommentService commentService;
	@Resource
	private IGoodsItemService goodsitemService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IItemcategoryService itemscategoryService;
	@Autowired
	private IGoodsTagService goodstagService;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private ICartService cartService;
	@Autowired
	private IAreaService areaService;
	@Autowired
	private SyUrlService syUrlService;
	@Autowired
	private IOrderBaseApiServcie orderBaseApiServcie;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private GoodsGalleryMapper goodsgallerymapper;
	@Autowired
	private PromotionMapper promotionmapper;
	@Autowired
	private TruDatacenterMapper trustmapper;
	/*
	@RequestMapping("/idc")
	public String main(String visitedModule, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		return "idcmain.ftl";
	}*/
	
	@RequestMapping({ "/index", "/2b" })
	public String tomain2b(String visitedModule, HttpServletResponse response, ModelMap map) throws I9heException {
		return "2bmain/main2b.ftl";
	}
	
	@RequestMapping("/2bcat")
	public String tomain2bcat(String visitedModule, HttpServletResponse response, ModelMap map) throws I9heException {
		return "2bmain/maincat2b.ftl";
	}
	
	@RequestMapping(value = "/mall/{id}")
	public String tofuwuqi(@PathVariable("id") Integer goodsId, Comment comment, ModelMap map) throws I9heException {
		return tofuwuqi2(goodsId, comment, map);
	}
	
	@RequestMapping(value = "/fuwuqi")
	public String tofuwuqi2(Integer goodsId, Comment comment, ModelMap map) throws I9heException {
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		
		comment.setGoodsId(goodsId);
		//设置cookie
		String name  = "Id"+goodsId;
		String value = goodsId.toString();
		Cookie cookie = new Cookie(name.trim(), value.trim());
        cookie.setMaxAge(24*3600*30);// 设置为30day
        cookie.setPath("/");
        response.addCookie(cookie);
        
        //获取商品相册只针对单独售卖商品
        List<GoodsGallery> Gallery = goodsgallerymapper.GetGoodsGallery(goodsId);
        map.put("Gallery",Gallery);
        
        //托管区域
        List<Area> area=areaService.getallArea();
        map.put("area", area);
		
		Goods goods    = goodsService.selectByPrimaryKey(goodsId);
		
		//判断是否为IDC商品
		if(goods.getIfIdc()==false){
			//System.out.println("IDC");
			return "redirect:/trust/"+goodsId+".html";
		}
		
		int categoryid = goods.getCategoryId();
		List<Comment> commentt = commentService.getAllComment(comment);
		
		List<Goodstag> goodstag = goodstagService.getIdtag(goodsId);
		
		//商品活动促销
		List<Promotion> pro = promotionmapper.GetTitle(categoryid);
		map.put("pro", pro);

		Category cat   = categoryService.selectByPrimaryKey(categoryid);
		String catname = cat.getName();
		
		//获取父级分类
		Category parcat= categoryService.selectByPrimaryKey(cat.getParentId());
		map.put("parName", parcat.getName());
		
		List<Goods> goodstype= goodsService.getGoodsByType(categoryid);
		List<Goods> goodscat = goodsService.getGoodsByCategoryId(categoryid);
		List<GoodsItem> itemsID = goodsitemService.selectItemKey(goodsId);
		Map<String, Object> mapp  = new LinkedHashMap<String, Object>();
		TreeMap<Integer, Integer> demo= new TreeMap<Integer, Integer>();
		
		for (GoodsItem goodsitem : itemsID) {
			Item item = itemsService.selectByPrimaryKey(goodsitem.getItemId());
			int itemtype = item.getItemType();
			Itemcategory type  = itemscategoryService.selectByPrimaryKey(itemtype);
			if(type!=null){
				int typeid      = type.getId();
				int sortid      = type.getSort();
				demo.put(sortid, typeid);
			}
		}
		// HashMap(无序), LinkedHashMap(有序)
		for(Map.Entry<Integer, Integer> entry : demo.entrySet()){ 
			Itemcategory type  = itemscategoryService.selectByPrimaryKey(entry.getValue());
			String typename = type.getTypeName();
			List<Item> list = itemsService.getjoinitem(goodsId, entry.getValue());
			mapp.put(typename, list);
		}
		
		//调取商品评论api接口
		comment.setIsReply(true);
		List<Comment> comments = commentService.getAllComment(comment);
		List<Goods> allGoods = goodsService.getAllGoods();
		Map<String,String> goodsMap = new HashMap<String,String>();
		for(Goods good : allGoods){
			goodsMap.put(good.getId().toString(), good.getGoodsName());
		}
		//设置用户名
		for(Comment com:comments){
			User user = privilegeBaseApiService.getUserById(com.getUserId());
			StringBuilder sb = new StringBuilder();
			sb.append(user.getUsername().substring(0,1));
			sb.append("*****");
			sb.append(user.getUsername().substring(user.getUsername().length()-1));
			com.setUserName(sb.toString());
			com.setSex(user.getGender()+"");
		}
		//设置分页信息
		PageModel page = new PageModel();
		//好评评价
		if(comment.getOverallComment()!=null){
			//好评评价设为2
			if(comment.getOverallComment() == 2){
				map.put("overComment", 2);
			}
			else if(comment.getOverallComment() == 1){
				map.put("overComment", 1);
			}
			else if(comment.getOverallComment() == 0){
				map.put("overComment", 0);
			}
		}
		//有图评价
		if(comment.getPhoto()!=null){
			map.put("photo", true);
		}
		//当前页码
		if(comment.getPageNo() == 0){
			page.setPageNo(1);
		}else{
			page.setPageNo(comment.getPageNo());
		}
		//总页码数
		Integer count = commentService.getAllCount(comment);
		page.setPageCount(count);
		//查询评价总数
		Comment counts = commentService.getAllCounts(comment);
		
		map.put("counts", counts);
		map.put("page", page);
		map.put("goodsMap", goodsMap);
		map.put("overallComment", SysConstant.GOODS_COMMENT_MAP);
		map.put("comments", comments);
				
		int len = mapp.size();
		map.put("len", len);
		map.put("mapp", mapp);
		map.put("commentt", commentt);
		map.put("goodstag", goodstag);
		map.put("goodstype", goodstype);
		map.put("goodscat", goodscat);
		map.put("goods", goods);
		map.put("catname", catname);
		return "2bmain/fuwuqi.ftl";

	}
	
	@RequestMapping(value ="/trust/{id}")
	public String totrust2(@PathVariable("id") Integer goodsId,Comment comment, ModelMap map) throws I9heException {
		return this.totrust(goodsId, comment, map);
	}
	
	@RequestMapping(value ="/trust")
	public String totrust(Integer goodsId,Comment comment,ModelMap map) throws I9heException {
		
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		//设置cookie
		String name  = "Id"+goodsId;
		String value = goodsId.toString();
		Cookie cookie = new Cookie(name.trim(), value.trim());
        cookie.setMaxAge(24*3600*30);// 设置为30day
        cookie.setPath("/");
        response.addCookie(cookie);
        
        //获取商品相册之针对单独售卖商品
        List<GoodsGallery> Gallery = goodsgallerymapper.GetGoodsGallery(goodsId);
        map.put("Gallery",Gallery);
        
        //托管区域
        List<Area> area=areaService.getallArea();
        map.put("area", area);
		
		Goods goods    = goodsService.selectByPrimaryKey(goodsId);
		
		//判断是否为IDC商品
		if(goods.getIfIdc()==true){
			//System.out.println("FUWUQI");
			return "redirect:/mall/"+goodsId+".html";
		}
		
		int categoryid = goods.getCategoryId();
		List<Comment> commentt = commentService.getAllComment(comment);
		List<Goodstag> goodstag = goodstagService.getIdtag(goodsId);
		
		//商品活动促销
		List<Promotion> pro = promotionmapper.GetTitle(categoryid);
		map.put("pro", pro);

		Category cat   = categoryService.selectByPrimaryKey(categoryid);
		String catname = cat.getName();
		
		//获取父级分类
		Category parcat= categoryService.selectByPrimaryKey(cat.getParentId());
		map.put("parName", parcat.getName());
		
		List<Goods> goodstype= goodsService.getGoodsByType(categoryid);
		List<Goods> goodscat = goodsService.getGoodsByCategoryId(categoryid);
		List<GoodsItem> itemsID = goodsitemService.selectItemKey(goodsId);
		Map<String, Object> mapp  = new LinkedHashMap<String, Object>();
		TreeMap<Integer, Integer> demo= new TreeMap<Integer, Integer>();
		
		for (GoodsItem goodsitem : itemsID) {
			Item item = itemsService.selectByPrimaryKey(goodsitem.getItemId());
			int itemtype = item.getItemType();
			Itemcategory type  = itemscategoryService.selectByPrimaryKey(itemtype);
			if(type!=null){
				int typeid      = type.getId();
				int sortid      = type.getSort();
				demo.put(sortid, typeid);
			}
		}
		// HashMap(无序), LinkedHashMap(有序)
		for(Map.Entry<Integer, Integer> entry : demo.entrySet()){ 
			Itemcategory type  = itemscategoryService.selectByPrimaryKey(entry.getValue());
			String typename = type.getTypeName();
			List<Item> list = itemsService.getjoinitem(goodsId, entry.getValue());
			mapp.put(typename, list);
		}
		
		//调取商品评论api接口
		comment.setIsReply(true);
		comment.setGoodsId(goodsId);
		List<Comment> comments = commentService.getAllComment(comment);
		List<Goods> allGoods = goodsService.getAllGoods();
		Map<String,String> goodsMap = new HashMap<String,String>();
		for(Goods good : allGoods){
			goodsMap.put(good.getId().toString(), good.getGoodsName());
		}
		//设置用户名
		for(Comment com:comments){
			User user = privilegeBaseApiService.getUserById(com.getUserId());
			StringBuilder sb = new StringBuilder();
			sb.append(user.getUsername().substring(0,1));
			sb.append("*****");
			sb.append(user.getUsername().substring(user.getUsername().length()-1));
			com.setUserName(sb.toString());
			com.setSex(user.getGender()+"");
		}
		//设置分页信息
		PageModel page = new PageModel();
		//好评评价
		if(comment.getOverallComment()!=null){
			//好评评价设为2
			if(comment.getOverallComment() == 2){
				map.put("overComment", 2);
			}
			else if(comment.getOverallComment() == 1){
				map.put("overComment", 1);
			}
			else if(comment.getOverallComment() == 0){
				map.put("overComment", 0);
			}
		}
		//有图评价
		if(comment.getPhoto()!=null){
			map.put("photo", true);
		}
		//当前页码
		if(comment.getPageNo() == 0){
			page.setPageNo(1);
		}else{
			page.setPageNo(comment.getPageNo());
		}
		//总页码数
		Integer count = commentService.getAllCount(comment);
		page.setPageCount(count);
		//查询评价总数
		Comment counts = commentService.getAllCounts(comment);
		
		map.put("counts", counts);
		map.put("page", page);
		map.put("goodsMap", goodsMap);
		map.put("overallComment", SysConstant.GOODS_COMMENT_MAP);
		map.put("comments", comments);
				
		int len = mapp.size();
		map.put("len", len);
		map.put("mapp", mapp);
		map.put("commentt", commentt);
		map.put("goodstag", goodstag);
		map.put("goodstype", goodstype);
		map.put("goodscat", goodscat);
		map.put("goods", goods);
		map.put("catname", catname);
		map.put("loginUrl", syUrlService.loginUrl());
		map.put("registerUrl", syUrlService.registerUrl());
		return "2bmain/trust.ftl";

	}
	
	
	@RequestMapping("/search")
	public String search(GoodsSearchModel searchModel, ModelMap map) throws I9heException, IOException {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		if (request.getMethod().equals("GET")) {
			if (StringUtils.isNotBlank(searchModel.getKeyword())) {
				String keyword = searchModel.getKeyword();
				keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
				searchModel.setKeyword(keyword);
			}
		}
		List<Goods> goods = goodsService.getGoods(searchModel);
		map.put("searchModel", searchModel);
		map.put("goods", goods);
		map.put("keyword", searchModel.getKeyword());
		System.out.println(goods);
		if(goods.isEmpty()){
			return "defaultlist.ftl";
		}
		return "goodslist.ftl";
	}
	
	//插入人工询价订单
	@ResponseBody
	@RequestMapping(value = "/manpower", produces = "text/html;charset=utf-8")
	public String tumanpower(Goods goods) throws I9heException {
		User user = SessionUtil.getSessionUser();
		Goods gd = goodsService.selectByPrimaryKey(goods.getId());
		BigDecimal big = new BigDecimal(0);
		//创建订单参数
		Order setorder = new Order();
		setorder.setUserId(SessionUtil.getSessionUser().getId());
		setorder.setType1(1);
		setorder.setType2(4);
		setorder.setType3(0);
		setorder.setAmount(big);
		setorder.setOrigAmount(big);
		setorder.setExpressfee(big);
		setorder.setDiscount(big);
		setorder.setIsDelete(false);
		setorder.setOrderTime(DateUtil.getSysDate());
		setorder.setState(0);
		setorder.setIsComment(0);
		setorder.setCreatedDate(DateUtil.getSysDate());
		setorder.setUpdatedDate(DateUtil.getSysDate());
		//插入订单并返回订单ID
		int orderid = orderBaseApiServcie.createOrder(setorder);
		int goodid = goods.getId();
		int orderCycle = 0;
		int conunt = 1;
		//插入商品订单
		orderBaseApiServcie.setOrderGoods(orderid, goodid, orderCycle, conunt);
		//插入账单
		Order order = orderBaseApiServcie.getOrderById(orderid);
		orderService.insertFinancial(user, order, FinanCanstants.TYPE_ORDER);
		//返回结果
		return JSON.toJSONString(true);
	}
	
	//查询数据中心
	@ResponseBody
	@RequestMapping(value = "/datacenter", produces = "text/html;charset=utf-8")
	public String datacenter(Integer id) throws I9heException {
		return JSON.toJSONString(trustmapper.gettrucity(id)).toString();
	}
}