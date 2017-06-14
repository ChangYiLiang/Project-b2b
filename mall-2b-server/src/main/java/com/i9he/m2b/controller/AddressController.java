package com.i9he.m2b.controller;

import static com.i9he.m2b.util.SysConstant.wrap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.remoting.exchange.Request;
import com.alibaba.fastjson.JSON;
import com.i9he.common.config.ParaConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.search.AddressSerachModel;
import com.i9he.m2b.util.ConstantUtil;
import com.i9he.m2b.util.MallErroCode;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.Region;
import com.i9he.privilege.model.User;

/**
 * 主界面及登录验证相关的控制器
 */
@Security
@Controller
@RequestMapping("/address")
public class AddressController {

	public static final Logger logger = Logger.getLogger("com.i9he.mall");

	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	/**
	 * 我的地址
	 * @throws I9heException
	 */
	@RequestMapping(value = "myaddress")
	public String toMyaddress(ModelMap map) throws I9heException {
		User user = SessionUtil.getSessionUser();
		List<Address> address = privilegeBaseApiService.getAddressByUserId(user.getId());
		map.put("myaddress", address);
		map.put("addressCounts", address.size());
		map.put("addressMAX", ParaConstants.MAXADDRESSNUMBER);
		return "2buser/myaddress.ftl";
	}
	
	@RequestMapping(value = "addaddress", method = RequestMethod.GET)
	public String addaddress(ModelMap map) throws I9heException {
		
		return "2buser/myaddressAdd.ftl";
	}
	
	// 获得所有省级单位
	@RequestMapping(value = "/getprovince", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String threelinkage() throws I9heException {
		List<Region> regions = privilegeBaseApiService.getprovince();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}

	// 根据父级查找下级城市
	@RequestMapping(value = "/city", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getCity(String parentId) throws I9heException {
		List<Region> regions = privilegeBaseApiService.getCity(parentId);
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (int i = 0; i < regions.size(); i++) {
			map.put(regions.get(i).getId(), regions.get(i).getRegionName());
		}
		return JSON.toJSONString(wrap(map)).toString();
	}

	@ResponseBody
	@RequestMapping(value = "/addaddress", produces = "application/json;charset=UTF-8")
	public String creatAddress(HttpServletRequest request, String address1, String address2, String address3, Address address) throws I9heException {
		User user = SessionUtil.getSessionUser(request);
		address.setUserId(user.getId());
		address.setRegionStructure(address1 + "-" + address2 + "-" + address3);
		Long atotal = privilegeBaseApiService.getTotalAddressByUserid(user.getId());
		if (atotal >= ParaConstants.MAXADDRESSNUMBER) {
			return JSON.toJSONString(false);
		}

		if (privilegeBaseApiService.creatAddress(address1, address2, address3, address, user.getId(), atotal)) {
			return JSON.toJSONString(true);
		}
		return JSON.toJSONString(false);
	}

	@ResponseBody
	@RequestMapping(value = "deleteaddress", produces = "text/plain;charset=UTF-8")
	public String deleteAddress(Integer id) throws I9heException {
		try {
			Address address = privilegeBaseApiService.getAddrressById(id);
			if(null != address){
				if(address.getUserId().equals(SessionUtil.getSessionUser().getId())){
					int result = privilegeBaseApiService.deleteAddress(id);
					return JSON.toJSONString(result>0);
				}else{
					return JSON.toJSONString(false);
				}
			}else{
				return JSON.toJSONString(false);
			}
		} catch (I9heException e) {
			throw new I9heException(MallErroCode.MALL_ADDRESS_DELECT_ERRO, "删除地址id" + id + "出现异常", e);
		}
	}

	/***设置默认地址*/
	@ResponseBody
	@RequestMapping(value = "setMainAddress", produces = "text/plain;charset=UTF-8")
	public String setMainAddress(Integer id) throws I9heException {
			Address address = privilegeBaseApiService.getAddrressById(id);
			if(null != address){
				if(address.getUserId().equals(SessionUtil.getSessionUser().getId())){
					Boolean result = privilegeBaseApiService.setAddressDef(id);
					
					return JSON.toJSONString(result);
				}else{
					return JSON.toJSONString(false);
				}
			}else{
				return JSON.toJSONString(false);
			}
	}

	@RequestMapping(value = "editaddress" , method=RequestMethod.GET)
	public String editAddress(Integer id, ModelMap map) throws I9heException {
		Address address = privilegeBaseApiService.getAddrressById(id);
		String regionStructure = address.getRegionStructure();
		String region [] = regionStructure.split("--");
		AddressSerachModel addressModel = new AddressSerachModel();
		addressModel.setProvince(region [0]);
		addressModel.setCity(region [1]);
		addressModel.setCounty(region [2]);
		
		map.put("addressModel", addressModel);
		map.put("address", address);
		return "2buser/myaddressEdit.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "editaddress", produces = "text/plain;charset=UTF-8")
	public String saveAddress(Integer id, Address address, String address1, String address2, String address3) throws I9heException {
		User user = SessionUtil.getSessionUser();
		address.setId(id);
		address.setUserId(user.getId());
		address.setRegionStructure(address1 + "-" + address2 + "-" + address3);
		Long atotal = privilegeBaseApiService.getTotalAddressByUserid(user.getId());
		if (privilegeBaseApiService.saveAddress(address1, address2, address3, address, user.getId(), atotal)) {
			return JSON.toJSONString(true);
		}
		return JSON.toJSONString(false);
	}
}
