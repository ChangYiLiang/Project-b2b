package com.i9he.m2b.manage.controller;

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
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.ICategoryService;
import com.i9he.m2b.manage.biz.IItemcategoryService;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.model.Category;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.search.ItemcategorySearchModel;


/**
 *主界面及登录验证相关的控制器 
 */
@Controller
@RequestMapping("/controller/goods")
public class CategoryController {
	//private static Logger logger = LoggerFactory.getLogger(MallController.class);

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Resource
	private IItemcategoryService itemscategoryService;
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value="/category" ,produces="text/plain;charset=UTF-8")
	public String toGetAllCategory(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		List<Category> cat = categoryService.getallcategory();
		int num = categoryService.getmax();
        map.put("user", user);
        map.put("menus", menus);
        map.put("cat", cat);
		return "goods/category.ftl"; 
	}
	
	@RequestMapping(value="/updatecategory" ,produces="text/plain;charset=UTF-8")
	public String toUpdateCategory(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Category cat = categoryService.selectByPrimaryKey(id);
		List<Category> catt = categoryService.getallcategory();
        map.put("user", user);
        map.put("menus", menus);
        map.put("catt", catt);
        map.put("cat", cat);
		return "goods/updatecategory.ftl"; 
	}
	
	@RequestMapping(value="/itemcategory" ,produces="text/plain;charset=UTF-8")
	public String toGetAllItemCategory(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,ItemcategorySearchModel model) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		List<Itemcategory> itemcategory = itemscategoryService.getallitemtype();
		List<Itemcategory> itemcategory2 = itemscategoryService.getItemcategory2(model);
        map.put("user", user);
        map.put("menus", menus);
		return "goods/itemcategory.ftl"; 
	}
	
	@RequestMapping(value="/updateitemcategory" ,produces="text/plain;charset=UTF-8")
	public String toUpdateItemCategory(String visitedModule,String visitedResource,HttpServletRequest request,ModelMap map,Integer id) throws I9heException{
		User user = SessionUtil.getSessionUser(request);
		String menus = privilegeBaseApiService.getModuleTree(user.getId(),visitedModule,visitedResource);
		Itemcategory itemcategory = itemscategoryService.selectByPrimaryKey2(id);
		map.put("cat", itemcategory);
        map.put("user", user);
        map.put("menus", menus);
		return "goods/updateitemcategory.ftl"; 
	}
	
	/**
	 * 添加配件
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="addcategory",produces="text/plain;charset=UTF-8")
	public String toaddcategory(Category category) throws I9heException{
		Category cat = categoryService.selectByPrimaryKey(category.getParentId());
		String L = "s";
		int num = categoryService.getmax()+1;
		if(category.getParentId() == 0){
			String F = L+'-'+num;
			int cnt=0,start=0; 
			while(start!=F.length()){ 
				int i = F.indexOf("-",start); 
				if(i!=-1) 
				{ 
				    cnt++; 
				    start=i+1; 
				} 
				else {
					break; 
				} 
			}
			category.setcatLV(cnt);
			category.setStructure(F);
		}else{
			String R = cat.getStructure();
			String F = R+'-'+num;
			int cnt=0,start=0;
			while(start!=F.length()){ 
				int i = F.indexOf("-",start); 
				if(i!=-1) 
				{ 
				    cnt++; 
				    start=i+1; 
				} 
				else {
					break; 
				} 
			}
			category.setcatLV(cnt);
			category.setStructure(F);
		}
		categoryService.insertSelective(category);
		return ConstantUtil.Success;
	}
	
	/**
	 * 修改配件
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="upcategory",produces="text/plain;charset=UTF-8")
	public String toupcategory(Category category) throws I9heException{
		Category cat = categoryService.selectByPrimaryKey(category.getParentId());
		String L = "s";
		int num = category.getId();
		if(category.getParentId() == 0){
			String F = L+'-'+num;
			int cnt=0,start=0; 
			while(start!=F.length()){ 
				int i = F.indexOf("-",start); 
				if(i!=-1) 
				{ 
				    cnt++; 
				    start=i+1; 
				} 
				else {
					break; 
				} 
			}
			category.setcatLV(cnt);
			category.setStructure(F);
		}else{
			String R = cat.getStructure();
			String F = R+'-'+num;
			int cnt=0,start=0;
			while(start!=F.length()){ 
				int i = F.indexOf("-",start); 
				if(i!=-1) 
				{ 
				    cnt++; 
				    start=i+1; 
				} 
				else {
					break; 
				} 
			}
			category.setcatLV(cnt);
			category.setStructure(F);
		}
		categoryService.updateByPrimaryKeySelective(category);
		return ConstantUtil.Success;
	}
	
	/**
	 * 添加配件类型
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="additemcategory",produces="text/plain;charset=UTF-8")
	public String toadditemcategory(Itemcategory itemcategory) throws I9heException{
		itemscategoryService.insertSelective(itemcategory);
		return ConstantUtil.Success;
	}
	
	/**
	 * 修改配件类型
	 * @throws I9heException 
	 * */
	@ResponseBody
	@RequestMapping(value ="upitemcategory",produces="text/plain;charset=UTF-8")
	public String toupitemcategory(Itemcategory itemcategory) throws I9heException{
		itemscategoryService.updateByPrimaryKeySelective(itemcategory);
		return ConstantUtil.Success;
	}
	
	@ResponseBody
	@RequestMapping(value ="/itemcategorylist2", produces = "application/json;charset=utf-8")
	public String toitemcategorylist2(ItemcategorySearchModel model) throws I9heException {
		List<Itemcategory> itemcategory2 = itemscategoryService.getItemcategory2(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", itemcategory2);
		map.put("iTotalRecords", model.getTotal());
		map.put("iTotalDisplayRecords", model.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
}