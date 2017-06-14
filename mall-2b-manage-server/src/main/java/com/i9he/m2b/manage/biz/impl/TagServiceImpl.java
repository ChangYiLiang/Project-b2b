package com.i9he.m2b.manage.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Transformer;
import org.apache.commons.collections.TransformerUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heAssert;
import com.i9he.common.exception.I9heException;
import com.i9he.common.util.PropertyTransformer;
import com.i9he.m2b.manage.biz.ITagService;
import com.i9he.m2b.manage.model.TagMappingGoodsViewModel;
import com.i9he.m2b.manage.utils.SessionUtil;
import com.i9he.m2b.manage.utils.SimpleLogger;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.mapper.TagCategoryMapper;
import com.i9he.m2b.mapper.TagCategoryMappingMapper;
import com.i9he.m2b.mapper.TagMapper;
import com.i9he.m2b.mapper.TagMappingMapper;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TagCategory;
import com.i9he.m2b.model.TagMapping;
import com.i9he.m2b.model.search.GoodsSearchModel;
import com.i9he.m2b.model.search.TagMappingSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;

@Service
public class TagServiceImpl implements ITagService {
	
	private static final Logger logger = Logger.getLogger(TagServiceImpl.class);

	@Autowired
	private TagMapper tagMapper;
	@Autowired
	private TagCategoryMapper tagCategoryMapper;
	@Autowired
	private TagCategoryMappingMapper tagCategoryMappingMapper;
	@Autowired
	private TagMappingMapper tagMappingMapper;
	
	@Autowired
	private Goods2bMapper goodsMapper;

	@Override
	@SimpleLogger("添加Tags")
	public Integer addTag(Tag tag) throws I9heException {
		tag.setCreateTime(new Date());
		tag.setCreateUserId(SessionUtil.getSessionUser().getId());
		return tagMapper.insertSelective(tag);
	}

	@Override
	@SimpleLogger("查询Tags")
	public List<Tag> searchTags(TagSearchModel searchModel) throws I9heException {
		RowBounds rb = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		List<Tag> list = tagMapper.selectBySearchModel(searchModel, rb);
		int total = tagMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		return list;
	}

	@Override
	@SimpleLogger("获取Tags")
	public Tag getTag(Integer id) throws I9heException {
		return tagMapper.selectByPrimaryKey(id);
	}

	@Override
	@SimpleLogger("更新Tags")
	public Integer updateTag(Tag tag) throws I9heException {
		return tagMapper.updateByPrimaryKeySelective(tag);
	}

	@Override
	@SimpleLogger("获取指定分类的Tags")
	public List<Tag> getTagsByCategory(Integer categoryId) throws I9heException {
		return tagMapper.selectByCategoryId(categoryId);
	}

	@Override
	@SimpleLogger("删除Tag")
	public Integer deleteTag(Integer tagId) throws I9heException {
		TagMappingSearchModel searchModel = new TagMappingSearchModel();
		searchModel.setTagId(tagId);
		int count = tagMappingMapper.selectCountBySearchModel(searchModel);
		I9heAssert.assertEquals(0, count, "该Tag已分配商品/文章");
		
		return tagMapper.deleteByPrimaryKey(tagId);
	}

	@Override
	@SimpleLogger("添加Tags分类")
	public Integer addCategory(TagCategory category) throws I9heException {
		category.setCreateTime(new Date());
		category.setCreateUserId(SessionUtil.getSessionUser().getId());
		return tagCategoryMapper.insertSelective(category);
	}

	@Override
	@SimpleLogger("获取所有Tags分类")
	public List<TagCategory> getCategories() throws I9heException {
		return tagCategoryMapper.selectAll();
	}

	@Override
	@SimpleLogger("获取Tags分类")
	public TagCategory getCategory(Integer id) throws I9heException {
		return tagCategoryMapper.selectByPrimaryKey(id);
	}

	@Override
	@SimpleLogger("更新Tags分类")
	public Integer updateCategory(TagCategory category) throws I9heException {
		return tagCategoryMapper.updateByPrimaryKeySelective(category);
	}

	@Override
	@SimpleLogger("保存分类包含的Tags")
	public Integer saveTagCategoryMapping(Integer categoryId, List<Integer> tags) {
		int count = tagCategoryMappingMapper.batchDeleteNotIn(categoryId, tags);
		if (tags != null && tags.size() > 0) {
			count += tagCategoryMappingMapper.batchReplaceInto(categoryId, tags);
		}
		return count;
	}

	@Override
	@SimpleLogger("删除Tags分类")
	public Integer deleteCategory(Integer categoryId) throws I9heException {
		List<Tag> tags = tagMapper.selectByCategoryId(categoryId);
		I9heAssert.assertNotFalse(CollectionUtils.isEmpty(tags), "该分类有Tag/关键字");
		return tagCategoryMapper.deleteByPrimaryKey(categoryId);
	}

	@Override
	@SimpleLogger("获取商品/文章映射")
	public List<TagMapping> searchTagMapping(TagMappingSearchModel searchModel) throws I9heException {
		if (B2BConstants.TAG_MAPPING_TYPE_GOODS.equals(searchModel.getType()) && StringUtils.isNotBlank(searchModel.getKeyword())) {
			GoodsSearchModel tempModel = new GoodsSearchModel();
			tempModel.setKeyword(searchModel.getKeyword());
			List<Integer> goodsId = goodsMapper.selectGoodsIdByKeyword(tempModel);
			Collection<String> targetList = CollectionUtils.collect(goodsId, TransformerUtils.stringValueTransformer());
			searchModel.setTargetList(targetList);
		}
		
		RowBounds rb = new RowBounds(searchModel.getOffset(), searchModel.getLimit());
		int total = tagMappingMapper.selectCountBySearchModel(searchModel);
		searchModel.setTotal(total);
		List<TagMapping> list = tagMappingMapper.selectBySearchModel(searchModel, rb);
		CollectionUtils.transform(list, new TagMappingTransformer());
		return list;
	}

	@Override
	@SimpleLogger("添加商品/文章映射")
	public Integer addTagMapping(List<TagMapping> mappings) throws I9heException {
		for (TagMapping item : mappings) {
			item.setCreateTime(new Date());
			item.setCreateUserId(SessionUtil.getSessionUser().getId());
		}
		int count = 0;
		if (mappings != null && mappings.size() > 0) {
			count = tagMappingMapper.batchInsertIgnore(mappings);
		}
		return count;
	}

	@Override
	@SimpleLogger("删除商品/文章映射")
	public Integer deleteTagMapping(Integer tagId, List<Integer> id) throws I9heException {
		return tagMappingMapper.batchDelete(tagId, id);
	}

	private class TagMappingTransformer implements Transformer {
		
		private TagMapping transformToGoods(TagMapping mapping) {
			try {
				TagMappingGoodsViewModel model = new TagMappingGoodsViewModel();
				PropertyUtils.copyProperties(model, mapping);
				Integer id = Integer.valueOf(model.getTargetId());
				Goods goods = goodsMapper.selectByPrimaryKey(id);
				if (goods != null) {
					model.setGoodsName(goods.getGoodsName());
					model.setGoodsPrice(goods.getGoodsPrice());
				}
				return model;
			} catch (Exception e) {
				logger.error("转换TagMapping失败", e);
				return mapping;
			}
		}

		public Object transform(Object obj) {
			TagMapping mapping = (TagMapping) obj;
			if (B2BConstants.TAG_MAPPING_TYPE_GOODS.equals(mapping.getType())) {
				return transformToGoods(mapping);
			}
			return mapping;
		}
		
	}
	
}
