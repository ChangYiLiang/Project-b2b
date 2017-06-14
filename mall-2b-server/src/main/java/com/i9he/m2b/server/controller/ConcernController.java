package com.i9he.m2b.server.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.biz.IConcernService;
import com.i9he.m2b.interceptor.Security;
import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.search.ConcernSearchModel;
import com.i9he.m2b.util.PageUtil;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.privilege.model.User;

@Security
@Controller
@RequestMapping("/concern")
public class ConcernController {
	@Autowired
	private IConcernService concernService;

	@RequestMapping("/list")
	public String list(ModelMap map, ConcernSearchModel csm, HttpServletRequest request) {
		Integer userId = SessionUtil.getSessionUser().getId();
		if (csm.getPageNo() == null) {
			csm.setPageNo(1);
		}
		// 设置查询实体参数
		csm.setPageSize(6);
		csm.setUserId(userId);
		csm.setStatus((byte) 1);
		List<Concern> concernList = concernService.getConcernList(csm);
		int totalNum = csm.getTotal();
		// 分页工具类
		PageUtil pu = new PageUtil();
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		StringBuffer sb = new StringBuffer();
		map.addAttribute("pageNo", csm.getPageNo());
		map.addAttribute("pageCode", pu.getPageCode(csm.getPageNo(), totalNum, csm.getPageSize(), path, sb.toString()));
		map.addAttribute("concernList", concernList);
		map.addAttribute("totalPage", totalNum % csm.getPageSize() == 0 ? totalNum / csm.getPageSize() : totalNum / csm.getPageSize() + 1);
		return "concern/concern.ftl";
	}

	/**
	 * 取消关注
	 * 
	 * @param concernId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/cancelConcern")
	public String cancelConcern(String concernId) {
		concernService.cancelConcern(concernId);
		return "";
	}

	@ResponseBody
	@RequestMapping("/updateRemind")
	public String updateRemind(Concern concern) {
		Integer count = concernService.updateRemind(concern);
		return JSON.toJSONString(count);

	}

	/**
	 * 关注商品,需要传入商品Id,商品价格
	 * 
	 * @param concern
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/concernGoods")
	public String concernGoods(String goodsId, String goodsPrice, String expectPrice, String state) {

		User user = SessionUtil.getSessionUser();
		Concern concern = new Concern();
		concern.setGoodsId(Integer.parseInt(goodsId));
		concern.setPrice(BigDecimal.valueOf(Double.valueOf(goodsPrice)));
		if (expectPrice != null) {
			concern.setExpectPrice(BigDecimal.valueOf(Double.valueOf(expectPrice)));
		}
		concernService.addConcern(concern, state);
		return JSON.toJSONString(1);

	}

	@ResponseBody
	@RequestMapping("/isConcern")
	public String isConcern(Concern concern) {
		Concern concern1 = concernService.isConcern(concern);
		if (concern1 == null) {
			return JSON.toJSONString("0");
		} else {
			return JSON.toJSONString("1");
		}
	}

	@ResponseBody
	@RequestMapping("/isRemind")
	public String isRemind(Concern concern) {
		Concern concern1 = concernService.isRemind(concern);
		if (concern1 == null) {
			return JSON.toJSONString("0");
		} else {
			return JSON.toJSONString("1");
		}
	}
}
