package com.i9he.m2b.manage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IAreaService;
import com.i9he.m2b.manage.biz.IGoodsGalleryService;
import com.i9he.m2b.manage.biz.ITrustService;
import com.i9he.m2b.manage.biz.ITrusteeshipService;
import com.i9he.m2b.manage.utils.ConstantUtil;
import com.i9he.m2b.mapper.Balances2bMapper;
import com.i9he.m2b.mapper.FestLogMapper;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.GoodsGalleryMapper;
import com.i9he.m2b.mapper.SuggestMapper;
import com.i9he.m2b.model.Area;
import com.i9he.m2b.model.Balances;
import com.i9he.m2b.model.FestLog;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsGallery;
import com.i9he.m2b.model.Goodstag;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.Suggest;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TruDatacenter;
import com.i9he.m2b.model.Trusteeship;
import com.i9he.m2b.model.search.GoodsGallerySearchModel;
import com.i9he.m2b.model.search.ItemSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;
import com.i9he.m2b.model.search.TrusteeshipSearchModel;


@Controller
@RequestMapping("/controller/goodsgallery")
public class GoodsGalleryController {
	
	@Autowired
	private GoodsGalleryMapper goodsgallerymapper;
	@Autowired
	private Goods2bMapper goods2bmapper;
	@Autowired
	private IGoodsGalleryService GoodsGalleryService;

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";
		
	@RequestMapping("/list")
	public String main(ModelMap map) {
		List<Goods> list = goods2bmapper.getOnlyGoods();
		map.put("list", list);
		return "goodsgallery/list.ftl";
	}
	
	@ResponseBody
	@RequestMapping(value ="addgallery",produces="text/plain;charset=UTF-8")
	public String addgallery(GoodsGallery record) throws I9heException{
		
		String url = record.getImgurl();
		String imgurl = url.substring(2,url.length()-2);
		String[] str = imgurl.split("\",\"");
		for(int i=0;i<str.length;i++){
			record.setImgurl(str[i]);
			goodsgallerymapper.insertSelective(record);
		}
		return ConstantUtil.Success;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/gallerylist", produces = "application/json;charset=utf-8")
	public String gallerylist(GoodsGallerySearchModel searchModel) throws I9heException {
		List<GoodsGallery> list = GoodsGalleryService.GetSearchDate(searchModel);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", list);
		map.put("iTotalRecords", searchModel.getTotal());
		map.put("iTotalDisplayRecords", searchModel.getTotal());
		return JSON.toJSONString(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value ="delgallery",produces="text/plain;charset=UTF-8")
	public String delgallery(GoodsGallery record) throws I9heException{
		goodsgallerymapper.DeleteGallery(record.getId());
		return ConstantUtil.Success;
	}
	
	
}