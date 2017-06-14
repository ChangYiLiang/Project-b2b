package com.i9he.m2b.manage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IBonusService;
import com.i9he.m2b.mapper.UserBonusMapper;
import com.i9he.m2b.model.Bonus;
import com.i9he.m2b.model.GoodsItem;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Itemcategory;
import com.i9he.m2b.model.UserBonus;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
import com.i9he.privilege.model.User;

@Controller
@RequestMapping("/controller/bonus")
public class BonusController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";

	@Autowired
	private IBonusService bonusService;
	@Autowired
	private UserBonusMapper userbounsMapper;
	@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;

	@RequestMapping("/bonus")
	public String bonus(ModelMap map) throws I9heException {
		List<Bonus> bonus = bonusService.getallbonus();
		map.put("bonus",bonus);
		return "bonus/bonus.ftl";
	}
	
	@RequestMapping("/updatebonus")
	public String updatebonus(ModelMap map,Integer id) throws I9heException {
		Bonus bonus = bonusService.selectByPrimaryKey(id);
		map.put("bonus",bonus);
		return "bonus/updatebonus.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/addbonus", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String addBonus(Bonus record) throws I9heException {
		bonusService.insertSelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/upbonus", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String upBonus(Bonus record) throws I9heException {
		bonusService.updateByPrimaryKeySelective(record);
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendbonus")
	public String sendBonus(Integer id) throws I9heException {
		List<User> list = privilegeBaseApiService.getAllNoadminUser();
		UserBonus ub = new UserBonus();
		//批量发送节操券
		for (User user : list) {
			ub.setBonusId(id);
			ub.setUserId(user.getId());
			userbounsMapper.insertSelective(ub);
		}
		//修改是否可以发送节操券状态
		Bonus b = new Bonus();
		b.setCangetNum(0);
		b.setTypeId(id);
		bonusService.updateByPrimaryKeySelective(b);
		//返回标记
		return JSON.toJSONString(true);
	}

}