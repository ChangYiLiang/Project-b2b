package com.i9he.m2b.manage.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.DateUtil;
import com.i9he.m2b.manage.biz.ICategoryService;
import com.i9he.m2b.manage.biz.IGoodsItemService;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.manage.biz.IItemService;
import com.i9he.m2b.manage.biz.IItemcategoryService;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.manage.utils.ItemViewModel;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsItem;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ItemSearchModel;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

/**
 * 主界面及登录验证相关的控制器
 */
@Controller
@RequestMapping("/controller/goods")
public class ItemsController {
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
	private IItemcategoryService itemscategoryService;
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/items", produces = "text/plain;charset=UTF-8")
	public String toGetAllGoods(String visitedModule, String visitedResource, HttpServletRequest request, ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(), visitedModule, visitedResource);
		List<Item> items = itemsService.getallitem();
		List<Goods> goods = goodsService.getAllGoods();
		int id = 23;
		GoodsItem demo = goodsitemService.selectByPrimaryKey(id);
		List<Itemcategory> itemcategory = itemscategoryService.getallitemtype();

		List<Category> cat = categoryService.getallcategory();
		map.put("itemcategory", itemcategory);
		map.put("goods", goods);
		map.put("user", user);
		map.put("menus", menus);
		map.put("items", items);
		return "goods/items.ftl";
	}

	@RequestMapping(value = "/updateitems", produces = "text/plain;charset=UTF-8")
	public String updateitems(String visitedModule, String visitedResource, HttpServletRequest request, ModelMap map, Integer id) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(), visitedModule, visitedResource);
		Item info = itemsService.selectByPrimaryKey(id);
		List<Itemcategory> itemcategory = itemscategoryService.getallitemtype();
		map.put("itemcategory", itemcategory);
		map.put("user", user);
		map.put("menus", menus);
		map.put("info", info);
		String title = info.getTitle();
		return "goods/updateitems.ftl";
	}

	/**
	 * 修改配件价格
	 * 
	 * @throws I9heException
	 * */

//	@RequestMapping(value = "/updateitemsprice", produces = "text/plain;charset=UTF-8")
//	public String toupdateitemsprice(String visitedModule, String visitedResource, HttpServletRequest request, ModelMap map, Integer goodsId, Integer itemId) throws I9heException {
//		// return JSON.toJSONString(info).toString();
//		User user = SessionUtil.getSessionUser(request);
//		String menus = privilegeBaseApiService.getModuleTree(user.getId(), visitedModule, visitedResource);
//		Item info0 = itemsService.selectByPrimaryKey(itemId);
//		Goods info1 = goodsService.selectByPrimaryKey(goodsId);
//		GoodsDetail info2 = goodsdetailService.selectPrice(goodsId, itemId);
//		System.out.print("我是茶" + info2);
//		if (info2 == null) {
//			map.put("user", user);
//			map.put("menus", menus);
//			return "mall-admin/updateError.ftl";
//		} else {
//			map.put("user", user);
//			map.put("menus", menus);
//			map.put("info0", info0);
//			map.put("info1", info1);
//			map.put("info2", info2);
//			System.out.print("我是茶s" + info2);
//			return "goods/updateitemprice.ftl";
//		}
//	}

	/**
	 * 添加配件
	 * 
	 * @throws I9heException
	 * */

	@ResponseBody
	@RequestMapping(value = "additems", produces = "text/plain;charset=UTF-8")
	public String toadditems(Item item) throws I9heException {
		item.setCreatedDate(DateUtil.getSysDate());
		itemsService.insert(item);
		return ConstantUtil.Success;
	}

	/**
	 * 删除配件
	 * 
	 * @throws I9heException
	 * */

	@ResponseBody
	@RequestMapping(value = "deleteitems", produces = "text/plain;charset=UTF-8")
	public String todeleteitems(Integer id) throws I9heException {
		itemsService.deleteByPrimaryKey(id);
		return ConstantUtil.Success;
	}

	/**
	 * 查询配件
	 * 
	 * @throws I9heException
	 * */

	@ResponseBody
	@RequestMapping(value = "seleteitems", produces = "text/plain;charset=UTF-8")
	public String toseleteitems(Integer id) throws I9heException {
		Item end = itemsService.selectByPrimaryKey(id);
		return ConstantUtil.Success;
	}

	/**
	 * 更新配件
	 * 
	 * @throws I9heException
	 * */
	@ResponseBody
	@RequestMapping(value = "toupdateitems", produces = "text/plain;charset=UTF-8")
	public String toupdateitems(Item item) throws I9heException {
		item.setCreatedDate(DateUtil.getSysDate());
		itemsService.updateByPrimaryKey(item);
		return ConstantUtil.Success;
	}

	/**
	 * 绑定配件1
	 * 
	 * @throws I9heException
	 * */
	@ResponseBody
	@RequestMapping(value = "binditems", produces = "text/plain;charset=UTF-8")
	public String tobinditems(GoodsItem record) throws I9heException {
		goodsitemService.insert(record);
		return ConstantUtil.Success;
	}

	/**
	 * 绑定配件2
	 * 
	 * @throws I9heException
	 * */
	@ResponseBody
	@RequestMapping(value = "binditems2", produces = "text/plain;charset=UTF-8")
	public String tobinditems2(GoodsItem record) throws I9heException {
		goodsitemService.insert(record);
		return ConstantUtil.Success;
	}

	/**
	 * 检查配件是否已经绑定
	 * 
	 * @throws I9heException
	 * */
	@ResponseBody
	@RequestMapping(value = "checkitem", produces = "text/plain;charset=UTF-8")
	public String tocheckitem(Integer goodsId, Integer itemId) throws I9heException {
		GoodsItem check = goodsitemService.CheckItemBind(goodsId, itemId);
		if (check == null) {
			return ConstantUtil.Fail;
		} else {
			return ConstantUtil.Success;
		}
	}

	/**
	 * 插入价格表
	 * 
	 * @throws I9heException
	 * */

//	@ResponseBody
//	@RequestMapping(value = "addgoodsdetail2", produces = "text/plain;charset=UTF-8")
//	public String toaddgoodsdetail2(GoodsDetail record) throws I9heException {
//		// Goods.setAddDate(DateUtil.getSysDate());
//		goodsdetailService.insert(record);
//		return ConstantUtil.Success;
//	}

	/**
	 * 修改配件价格表
	 * 
	 * @throws I9heException
	 * */

//	@ResponseBody
//	@RequestMapping(value = "updateitemsprice2", produces = "text/plain;charset=UTF-8")
//	public String toupdateitemsprice2(GoodsDetail record) throws I9heException {
//		int goodsdetail = goodsdetailService.updatePrice(record);
//		System.out.print("我是茶s" + goodsdetail);
//		return ConstantUtil.Success;
//	}

	/**
	 * 获取某个类型的配件
	 * 
	 * @throws I9heException
	 * */

	@ResponseBody
	@RequestMapping(value = "getitemType", produces = "text/plain;charset=UTF-8")
	public String togetitemType(Integer id) throws I9heException {
		List<Item> item = itemsService.getitemType(id);
		return JSON.toJSONString(item).toString();
	}

	/**
	 * 不是例子
	 * 
	 * @throws I9heException
	 * */

	@ResponseBody
	@RequestMapping(value = "demo", produces = "text/plain;charset=UTF-8")
	public String todemo(Integer goodsId) throws I9heException {
		List<GoodsItem> itemsID = goodsitemService.selectItemKey(goodsId);
		List<ItemViewModel> model = new ArrayList<ItemViewModel>();
		for (GoodsItem goodsitem : itemsID) {
			Item item = null;
			item = itemsService.selectByPrimaryKey(goodsitem.getItemId());
			model.add(new ItemViewModel(item));
		}
		return JSON.toJSONString(model).toString();
	}

	@ResponseBody
	@RequestMapping(value = "/itemlist", produces = "application/json;charset=utf-8")
	public String itemlist(ItemSearchModel model) throws I9heException {
		List<Item> item = itemsService.getItem(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", item);
		map.put("iTotalRecords", model.getTotal());
		map.put("iTotalDisplayRecords", model.getTotal());
		return JSON.toJSONString(map).toString();
	}

}
