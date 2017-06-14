package com.i9he.m2b.manage.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.DateUtil;
import com.i9he.m2b.manage.biz.ICategoryService;
import com.i9he.m2b.manage.biz.IExpressfeeService;
import com.i9he.m2b.manage.biz.IGoodsItemService;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.manage.biz.IGoodsTagService;
import com.i9he.m2b.manage.biz.IItemService;
import com.i9he.m2b.manage.biz.IItemcategoryService;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.GoodsItem2bMapper;
import com.i9he.m2b.mapper.GoodsTag2bMapper;
import com.i9he.m2b.mapper.Item2bMapper;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.ExpressfeeTemplate;
import com.i9he.m2b.model.ExpressfeeTemplateEX;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.GoodsItem;
import com.i9he.m2b.model.Goodstag;
import com.i9he.m2b.model.Invoices;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ExpressfeeTemplateSearchModel;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.model.search.InvoiceSearchModel;

/**
 *主界面及登录验证相关的控制器 
 */
@Controller
@RequestMapping("/controller/goods")
public class GoodsController extends AbstractController{
	//private static Logger logger = LoggerFactory.getLogger(MallController.class);

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IItemService itemsService;
	@Resource
	private IGoodsItemService goodsitemService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IItemcategoryService itemscategoryService;
	@Autowired
	private IGoodsTagService goodstagService;
	@Autowired
	private GoodsItem2bMapper goodsitemmapper;
	@Autowired
	private Item2bMapper item2bmapper;
	@Autowired
	private Goods2bMapper goodsmapper;
	@Autowired
	private GoodsTag2bMapper goodstagmapper;
	@Autowired
	private IExpressfeeService expressfeeService;

	@RequestMapping(value="/goods" ,produces="text/plain;charset=UTF-8")
	public String toGetAllGoods(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		List<Goods> goods  = goodsService.getAllGoods();
		List<Category> cat = categoryService.getallcategory();
		map.put("cat", cat);
        map.put("user", user);
        map.put("menus", menus);
        map.put("goods", goods);
		return "goods/goods.ftl"; 
	}
	
	@RequestMapping(value="/addgoodsall" ,produces="text/plain;charset=UTF-8")
	public String toaddgoodsall(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		List<Goods> goods  = goodsService.getAllGoods();
		List<Category> cat = categoryService.getallcategory();
		List<Itemcategory> itemcategory = itemscategoryService.getallitemtype();
		map.put("cat", cat);
        map.put("user", user);
        map.put("menus", menus);
        map.put("goods", goods);
        map.put("itemcategory", itemcategory);
		return "goods/goodsadd.ftl"; 
	}
	
	@RequestMapping(value="/updategoods" ,produces="text/plain;charset=UTF-8")
	public String toupdategoods(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Goods info = goodsService.selectByPrimaryKey(id);
		int itemId = 0;
		List<Category> cat = categoryService.getallcategory();
		map.put("cat", cat);
		map.put("info", info);
        map.put("user", user);
        map.put("menus", menus);
		return "goods/updategoods.ftl"; 
	}
	
	/**
	 * 查看具体的绑定情况
	 * */
	@RequestMapping(value="/bindinfo" ,produces="text/plain;charset=UTF-8")
	public String tobindinfo(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Goods goods    = goodsService.selectByPrimaryKey(id);
		int categoryid = goods.getCategoryId();
		Category cat   = categoryService.selectByPrimaryKey(categoryid);
		String catname = cat.getName();
		List<Goods> goodstype= goodsService.getGoodsByType(categoryid);
		List<Goods> goodscat = goodsService.getGoodsByCategoryId(categoryid);
		List<GoodsItem> itemsID = goodsitemService.selectItemKey2(id);
		Map<String, Object> mapp  = new HashMap<String, Object>();
		for (GoodsItem goodsitem : itemsID) {
			Item item = itemsService.selectByPrimaryKey(goodsitem.getItemId());
			int itemtype = item.getItemType();
			Itemcategory type  = itemscategoryService.selectByPrimaryKey(itemtype);
			if(type!=null){
				String typename = type.getTypeName();
				int typeid      = type.getId();
				List<Item> list = itemsService.getjoinitem2(id, typeid);
				mapp.put(typename,list);
			}
		}
		//System.out.println("我是茶"+mapp);
		map.put("mapp", mapp);
		map.put("goods",goods);
		map.put("user", user);
		map.put("menus", menus);
		return "goods/bindinfo.ftl"; 
	}
	
	/**
	 * 删除商品
	 * */
	
	@ResponseBody
	@RequestMapping(value ="deletegoods",produces="text/plain;charset=UTF-8")
	public String todeletegoods(Goods record){
		goodsService.deleteGoods(record);
		return ConstantUtil.Success;
	}
	
	/**
	 * 插入商品
	 * */
	@ResponseBody
	@RequestMapping(value ="/addgoods",produces="text/plain;charset=UTF-8")
	public String toaddgoods(Goods record) throws IOException{
		String goodsimg = record.getGoodsImg();
		String str[]    = goodsimg.split(",");
		String img      = str[0].substring(2,str[0].length()-1);
		String test     = str[1].substring(1,str[1].length()-2);
		record.setGoodsImg(img);
		record.setGoodsTest(test);
		goodsService.insert(record);
		
//		for (int i = 0; i < itemname.length; i++ ) {
//        	Item I = new Item();
//            I.setItemType(itemType[i]);
//            I.setPrice(itemprice[i]);
//            I.setTitle(itemname[i]);
//            item2bmapper.insertSelective(I);
//        }
		
		return ConstantUtil.Success;
	}
	
	/**
	 * 插入价格表
	 * @throws I9heException 
	 * */
	
//	@ResponseBody
//	@RequestMapping(value ="addgoodsdetail",produces="text/plain;charset=UTF-8")
//	public String toaddgoodsdetail(GoodsDetail record) throws I9heException{
//		//Goods.setAddDate(DateUtil.getSysDate());
//		goodsdetailService.insert(record);
//		return ConstantUtil.Success;
//	}
	
	/**
	 * 修改商品
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="toupdategoods",produces="text/plain;charset=UTF-8")
	public String updategoods(Goods record){
		Goods goods = goodsService.selectByPrimaryKey(record.getId());
		System.out.println(goods);
		if(record.getGoodsImg()!=""){
			String goodsimg = record.getGoodsImg();
			String img      = goodsimg.substring(2,goodsimg.length()-2);
			record.setGoodsImg(img);
		}
		if(record.getGoodsTest()!=""){
			String goodstest= record.getGoodsTest();
			String test     = goodstest.substring(2,goodstest.length()-2);
			record.setGoodsTest(test);
		}
		if(record.getGoodsImg()==""){
			record.setGoodsImg(goods.getGoodsImg());
		}
		if(record.getGoodsTest()==""){
			record.setGoodsTest(goods.getGoodsTest());
		}
		goodsService.updateByPrimaryKeySelective(record);
		return ConstantUtil.Success;
	}
	
	/**
	 * 检验是否已经被添加
	 * @throws I9heException 
	 * */
//	@ResponseBody
//	@RequestMapping(value ="checkgoods",produces="text/plain;charset=UTF-8")
//	public String tocheckgoods(Integer goodsId,Integer itemId) throws I9heException{
//		GoodsDetail check = goodsdetailService.selectPrice(goodsId,itemId);
//		System.out.print("我是茶s"+check);
//		if(check==null){
//			return ConstantUtil.Fail;
//		}else{
//			return ConstantUtil.Success;
//		}
//	}
	
	
	/**
	 * 修改配件价格表
	 * @throws I9heException 
	 * */
	
//	@ResponseBody
//	@RequestMapping(value ="toupdategoodsdetail",produces="text/plain;charset=UTF-8")
//	public String updategoodsdetail(GoodsDetail record) throws I9heException{
//		int goodsdetail = goodsdetailService.updatePrice(record);
//		System.out.print("我是茶s"+goodsdetail);
//		return ConstantUtil.Success;
//	}
	
	/**
	 * 绑定与解除配件
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="toupdategoodsitem",produces="text/plain;charset=UTF-8")
	public String toupdategoodsitem(Integer goodsId,Integer itemId,Integer isShow) throws I9heException{
		int goodsitem = goodsitemService.updatebind(goodsId,itemId,isShow);
		return ConstantUtil.Success;
	}
	
	/**
	 * 修改配件排序
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="toupdatesort",produces="text/plain;charset=UTF-8")
	public String toupdatesort(Integer goodsId,Integer itemId,Integer sort) throws I9heException{
		int goodsitem = goodsitemService.updatesort(goodsId,itemId,sort);
		return ConstantUtil.Success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/goodslist", produces = "application/json;charset=utf-8")
	public String goodslist(GoodsSearchModel model) throws I9heException {
		//model.setIfIdc(true);
		List<Goods> goods  = goodsService.getGoods(model);
		goodsService.checkIfBindExpressfee(goods);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", goods);
		map.put("iTotalRecords", model.getTotal());
		map.put("iTotalDisplayRecords", model.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
	/**
	 * 插入价格表
	 * @throws I9heException 
	 * */
	
	@ResponseBody
	@RequestMapping(value ="addgoodstag",produces="text/plain;charset=UTF-8")
	public String toaddgoodstag(Goodstag record) throws I9heException{
		goodstagService.insert(record);
		return ConstantUtil.Success;
	}
	
	@ResponseBody
	@RequestMapping(value ="updateshow",produces="text/plain;charset=UTF-8")
	public String toupdateshow(Integer id,Integer isShow) throws I9heException{
		goodstagService.updateshow(id,isShow);
		return ConstantUtil.Success;
	}
	
	@ResponseBody
	@RequestMapping(value ="updategoodstag2",produces="text/plain;charset=UTF-8")
	public String updategoodstag2(Goodstag record) throws I9heException{
		goodstagService.updateByPrimaryKeySelective(record);
		return ConstantUtil.Success;
	}
	
	
	@RequestMapping(value="/goodstaglist" ,produces="text/plain;charset=UTF-8")
	public String togoodstaglist(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Goods goods  = goodsService.selectByPrimaryKey(id);
		List<Goodstag> goodstag = goodstagService.getalltagtype(id);
		map.put("goods", goods);
		map.put("goodstag", goodstag);
		map.put("user", user);
		map.put("menus", menus);
		return "goods/goodstagbind.ftl"; 
	}
	
	@RequestMapping(value="/goodstagupdate" ,produces="text/plain;charset=UTF-8")
	public String togoodstagupdate(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource); 
		Goodstag goodstag = goodstagService.selectByPrimaryKey2(id);
		int goodsid  = goodstag.getGoodsId();
		Goods goods  = goodsService.selectByPrimaryKey(goodsid);
		map.put("goods", goods);
		map.put("goodstag", goodstag);
		map.put("user", user);
		map.put("menus", menus);
		return "goods/goodstagupdate.ftl"; 
	}
	
	@RequestMapping(value="/insertlist" ,produces="text/plain;charset=UTF-8")
	public String insertlist(Byte[] itemType,String[] itemname,BigDecimal[] itemprice,Integer[] goodsId) throws I9heException{
		int len= itemname.length;
		Item I = new Item();
		//生成配件
        for (int i = 0; i < itemname.length; i++ ) {
        	I.setItemType(itemType[i]);
        	I.setTitle(itemname[i]);
        	I.setPrice(itemprice[i]);
        	I.setCreatedDate(DateUtil.getSysDate());
        	I.setBrandId(0);
        	I.setCategoryId(0);
        	item2bmapper.insertSelective(I);
        }
        List<Item> Desclog = item2bmapper.getDesclog(len);
        //绑定配件
        GoodsItem GI = new GoodsItem();
        for (Item item : Desclog) {
			GI.setGoodsId(goodsId[0]);
			GI.setItemId(item.getId());
			goodsitemmapper.insertSelective(GI);
		}
        return "redirect:bindinfo.do?id="+goodsId[0]; 
	}
	
	//批量插入绑定配件
	@RequestMapping(value="/addlist" ,produces="text/plain;charset=UTF-8")
	public String toaddlist(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Goods goods    = goodsService.selectByPrimaryKey(id);
		List<Itemcategory> itemcategory = itemscategoryService.getallitemtype();
		map.put("itemcategory", itemcategory);
		map.put("goods",goods);
		map.put("user", user);
		map.put("menus", menus);
		return "goods/addlist.ftl";
	}
	
	//复制商品
	@ResponseBody
	@RequestMapping(value ="copygoods",produces="text/plain;charset=UTF-8")
	public String copygoods(Integer id) throws I9heException{
		Goods G = new Goods();
		Item I = new Item();
		GoodsItem GI = new GoodsItem();
		Goodstag GT = new Goodstag();

		//复制商品
		Goods goods = goodsService.selectByPrimaryKey(id);
		G.setGoodsName(goods.getGoodsName()+"-复制");
		G.setSecondTitle(goods.getSecondTitle());
		G.setGoodsPrice(goods.getGoodsPrice());
		G.setCategoryId(goods.getCategoryId());
		G.setIsBuy(goods.getIsBuy());
		G.setIfIdc(goods.getIfIdc());
		G.setGoodsDesc(goods.getGoodsDesc());
		G.setGoodsImg(goods.getGoodsImg());
		G.setGoodsTest(goods.getGoodsTest());
		G.setIftrust(goods.getIftrust());
		G.setSort(goods.getSort());
		G.setGoodsType(goods.getGoodsType());
		goodsmapper.insertSelective(G);
		
		//获取新插入商品ID
		int maxid = goodsmapper.getmax();
		
		//复制配件
		List<GoodsItem> goodsitem = goodsitemmapper.selectItemKey(id);
		int len = goodsitem.size();
		for(GoodsItem gi:goodsitem){
			Item item = item2bmapper.selectByPrimaryKey(gi.getItemId());
			I.setItemType(item.getItemType());
        	I.setTitle(item.getTitle());
        	I.setPrice(item.getPrice());
        	I.setCreatedDate(DateUtil.getSysDate());
        	I.setBrandId(0);
        	I.setCategoryId(0);
        	item2bmapper.insertSelective(I);
		}
		//复制参数
		List<Goodstag> goodstag = goodstagmapper.getalltagtype(id);
		for(Goodstag moon:goodstag){
			GT.setGoodsId(maxid);
			GT.setGoodsAttr(moon.getGoodsAttr());
			GT.setGoodsTag(moon.getGoodsTag());
			GT.setIsShow(moon.getIsShow());
			GT.setSort(moon.getSort());
			goodstagService.insertSelective(GT);
		}
		//复制关联
		List<Item> itemlog = item2bmapper.getDesclog(len);
		for (Item item : itemlog) {
			GI.setGoodsId(maxid);
			GI.setItemId(item.getId());
			GI.setSort(item.getSort());
			goodsitemmapper.insertSelective(GI);
		}
		return ConstantUtil.Success;
	}
	
	@ResponseBody
	@RequestMapping(value ="addjsfile",produces="text/plain;charset=UTF-8")
	public String addjsfile(Goods record) throws I9heException{
		
		String url = record.getJsfile();
		String jsurl = url.substring(2,url.length()-2);
		record.setJsfile(jsurl);
		goodsService.updateByPrimaryKeySelective(record);
		return ConstantUtil.Success;
		
	}
	
	@RequestMapping(value="/bindexpressfee")
	public String bindExpressfee(Integer id,ModelMap map){
		List<String> expressName = expressfeeService.getAllExpressName();
		
		map.put("expressList", expressName);
		map.put("goodsId", id);
		return "expressfee/binding.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bindexpressfee", method = RequestMethod.POST ,produces ="application/json;charset=utf-8")
	public String bindExpressfee(ExpressfeeTemplateSearchModel searchModel) throws I9heException {
		List<ExpressfeeTemplate> templates = expressfeeService.getTemplate(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(templates, searchModel), "yyyy-MM-dd HH:mm");
	}
	
	@ResponseBody
	@RequestMapping(value="/tobindexpressfee")
	public String toBindExpressfee(Integer goodsId,Integer templateId){
		int res = expressfeeService.bindExpressfee(goodsId,templateId);
		return JSON.toJSONString(res>0);
	}
	
	@RequestMapping(value="/expressfee")
	public String expressfeeDetail(Integer id,ModelMap map){
		ExpressfeeTemplateEX template = expressfeeService.getTemplateBygoodsId(id);
		map.put("goodsId", id);
		map.put("template", template);
		return "expressfee/detail.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value="/removebind",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public String removeBind(Integer goodsId){
		int res = expressfeeService.removeBind(goodsId);
		return JSON.toJSONString(res>0);
	}
}
