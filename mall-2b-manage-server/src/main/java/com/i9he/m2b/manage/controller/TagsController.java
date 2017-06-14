package com.i9he.m2b.manage.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
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
import com.i9he.common.util.PropertyTransformer;
import com.i9he.log.api.utils.LogUtils;
import com.i9he.m2b.manage.biz.ITagService;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TagCategory;
import com.i9he.m2b.model.TagMapping;
import com.i9he.m2b.model.search.TagMappingSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;

@Controller
@RequestMapping("/controller/tags")
public class TagsController extends AbstractController {

	private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm";

	@Autowired
	private ITagService tagService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@RequestMapping("/list")
	public String list() throws I9heException {
		tagService.getCategories();
		return "tags/list.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = MIME_JSON)
	public String list(TagSearchModel searchModel) throws I9heException {
		List<Tag> list = tagService.searchTags(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, searchModel.getTotal()), DATE_FORMAT);
	}

	@RequestMapping(value = "/create_tag", method = RequestMethod.GET)
	public String createTag(ModelMap map) throws I9heException {
		return "tags/create_tag.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/create_tag", method = RequestMethod.POST, produces = MIME_JSON)
	public String createTag(Tag tag) throws I9heException {
		tagService.addTag(tag);
		LogUtils.writeLog("tag0", String.format("创建标签:%s [id: %d]", tag.getName(), tag.getId()));
		return JSON.toJSONString(true);
	}

	@RequestMapping(value = "/edit_tag", method = RequestMethod.GET)
	public String editTag(Integer id, ModelMap map) throws I9heException {
		Tag tag = tagService.getTag(id);
		map.put("tag", tag);
		return "tags/edit_tag.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/edit_tag", method = RequestMethod.POST, produces = MIME_JSON)
	public String editTag(Integer id, Tag tag) throws I9heException {
		tag.setRemark(StringUtils.defaultString(tag.getRemark()));
		tagService.updateTag(tag);
		LogUtils.writeLog("tag1", String.format("修改标签:%s [id: %d]", tag.getName(), tag.getId()));
		return JSON.toJSONString(true);
	}

	@ResponseBody
	@RequestMapping(value = "/del_tag", method = RequestMethod.POST, produces = MIME_JSON)
	public String deleteTag(Integer id) throws I9heException {
		tagService.deleteTag(id);
		LogUtils.writeLog("tag2", String.format("删除Tag[id:%d]", id));
		return JSON.toJSONString(true);
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category() {
		return "tags/category.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/category", method = RequestMethod.POST, produces = MIME_JSON)
	public String category(Integer pageNo) throws I9heException {
		List<TagCategory> list = tagService.getCategories();
		return JSON.toJSONStringWithDateFormat(wrapDataTable(list, 0), DATE_FORMAT);
	}

	@RequestMapping(value = "/create_category", method = RequestMethod.GET)
	public String createCategory(ModelMap map) throws I9heException {
		return "tags/create_category.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/create_category", method = RequestMethod.POST, produces = MIME_JSON)
	public String createCategory(TagCategory category) throws I9heException {
		tagService.addCategory(category);
		LogUtils.writeLog("tag0", String.format("创建标签分类:%s [id: %d]", category.getName(), category.getId()));
		return JSON.toJSONString(true);
	}

	@RequestMapping(value = "/edit_category", method = RequestMethod.GET)
	public String editCategory(Integer id, ModelMap map) throws I9heException {
		TagCategory category = tagService.getCategory(id);
		map.put("category", category);
		return "tags/edit_category.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/edit_category", method = RequestMethod.POST, produces = MIME_JSON)
	public String editCategory(Integer id, TagCategory category) throws I9heException {
		category.setRemark(StringUtils.defaultString(category.getRemark()));
		tagService.updateCategory(category);
		LogUtils.writeLog("tag1", String.format("修改标签分类:%s [id: %d]", category.getName(), category.getId()));
		return JSON.toJSONString(true);
	}

	@RequestMapping(value = "/category_tags", method = RequestMethod.GET)
	public String categoryTags(Integer id, ModelMap map) throws I9heException {
		TagSearchModel searchModel = new TagSearchModel();
		List<Tag> allTags = tagService.searchTags(searchModel);
		List<Tag> tags = tagService.getTagsByCategory(id);
		TagCategory category = tagService.getCategory(id);

		map.put("category", category);
		map.put("allTags", allTags);
		map.put("tags", CollectionUtils.collect(tags, new PropertyTransformer("id")));
		return "tags/category_tags.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/save_category_tags", method = RequestMethod.POST, produces = MIME_JSON)
	public String saveCategoryTags(Integer categoryId, HttpServletRequest request) throws I9heException {
		String[] params = request.getParameterValues("tagId");
		List<Integer> tags = new ArrayList<Integer>();
		if (params != null) {
			for (String p : params) {
				tags.add(Integer.valueOf(p));
			}
		}
		Integer count = tagService.saveTagCategoryMapping(categoryId, tags);
		if (count > 0) {
			String strTags = StringUtils.join(tags, ",");
			LogUtils.writeLog("tag1", String.format("更新Tag分类映射[id:%d] [tags:%s]", categoryId, strTags));
		}
		return JSON.toJSONString(true);
	}

	@ResponseBody
	@RequestMapping(value = "/del_category", method = RequestMethod.POST, produces = MIME_JSON)
	public String deleteCategory(Integer id) throws I9heException {
		tagService.deleteCategory(id);
		LogUtils.writeLog("tag2", String.format("删除Tag分类[id:%d]", id));
		return JSON.toJSONString(true);
	}

	@RequestMapping("/mappings")
	public String tagMapping(Integer id, ModelMap map) throws I9heException {
		Tag tag = tagService.getTag(id);
		map.put("tag", tag);
		return "tags/mappings.ftl";
	}

	@ResponseBody
	@RequestMapping(value = "/mappings", method = RequestMethod.POST, produces = MIME_JSON)
	public String tagMapping(TagMappingSearchModel searchModel) throws I9heException {
		List<TagMapping> items = tagService.searchTagMapping(searchModel);
		return JSON.toJSONStringWithDateFormat(wrapDataTable(items, searchModel.getTotal()), DATE_FORMAT);
	}
	
	@ResponseBody
	@RequestMapping(value = "/create_mapping", method = RequestMethod.POST, produces = MIME_JSON)
	public String createMapping(Integer tagId, Byte type, HttpServletRequest request) throws I9heException {
		String[] values = request.getParameterValues("targetId");
		if (values != null && values.length > 0) {
			List<TagMapping> mappings = new ArrayList<TagMapping>();
			for (String val : values) {
				TagMapping mapping = new TagMapping();
				mapping.setTagId(tagId);
				mapping.setType(type);
				mapping.setTargetId(val);
				mappings.add(mapping);
			}
			tagService.addTagMapping(mappings);
			String info = String.format("添加商品/关键字映射[tagId:%d], [target:%s]", tagId, StringUtils.join(values, ","));
			LogUtils.writeLog("tag3", info);
		}
		return JSON.toJSONString(true);
	}
	
	@ResponseBody
	@RequestMapping(value = "/del_mapping", method = RequestMethod.POST, produces = MIME_JSON)
	public String deleteMapping(Integer tagId, HttpServletRequest request) throws I9heException {
		String[] values = request.getParameterValues("id");
		List<Integer> idList = new ArrayList<Integer>();
		if (values != null) {
			for (String val : values) {
				idList.add(Integer.valueOf(val));
			}
		}
		tagService.deleteTagMapping(tagId, idList);
		String info = String.format("删除商品/关键字映射[tagId:%d], [id:%s]", tagId, StringUtils.join(idList, ","));
		LogUtils.writeLog("tag4", info);
		return JSON.toJSONString(true);
	}

	

}
