package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TagCategory;
import com.i9he.m2b.model.TagMapping;
import com.i9he.m2b.model.search.TagMappingSearchModel;
import com.i9he.m2b.model.search.TagSearchModel;

public interface ITagService {

	/**
	 * 添加Tags
	 * 
	 * @param tag
	 * @return
	 */
	public Integer addTag(Tag tag) throws I9heException;

	/**
	 * 获取Tags
	 * 
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Tag getTag(Integer id) throws I9heException;

	/**
	 * 更新Tags
	 * 
	 * @param tag
	 * @return
	 * @throws I9heException
	 */
	public Integer updateTag(Tag tag) throws I9heException;

	/**
	 * 查询Tags
	 * 
	 * @param searchModel
	 * @return
	 */
	public List<Tag> searchTags(TagSearchModel searchModel) throws I9heException;

	/**
	 * 获取分类的所有Tags
	 * 
	 * @param categoryId
	 * @return
	 * @throws I9heException
	 */
	public List<Tag> getTagsByCategory(Integer categoryId) throws I9heException;

	/**
	 * 删除Tag
	 * 
	 * @param tagId
	 * @return
	 * @throws I9heException
	 */
	public Integer deleteTag(Integer tagId) throws I9heException;

	/**
	 * 添加分类
	 * 
	 * @param category
	 * @return
	 */
	public Integer addCategory(TagCategory category) throws I9heException;

	/**
	 * 获取分类
	 * 
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public TagCategory getCategory(Integer id) throws I9heException;

	/**
	 * 修改分类
	 * 
	 * @param category
	 * @return
	 * @throws I9heException
	 */
	public Integer updateCategory(TagCategory category) throws I9heException;

	/**
	 * 获取所有分类
	 * 
	 * @return
	 */
	public List<TagCategory> getCategories() throws I9heException;

	/**
	 * 保存Tag分类映射
	 * 
	 * @param categoryId
	 * @param tags
	 * @return
	 */
	public Integer saveTagCategoryMapping(Integer categoryId, List<Integer> tags);

	/**
	 * 删除Tag分类
	 * 
	 * @param tagId
	 * @return
	 * @throws I9heException
	 */
	public Integer deleteCategory(Integer categoryId) throws I9heException;

	/**
	 * 获取商品/文章映射
	 * 
	 * @param tagId
	 * @return
	 * @throws I9heException
	 */
	public List<TagMapping> searchTagMapping(TagMappingSearchModel searchModel) throws I9heException;

	/**
	 * 保存商品/文章映射
	 * 
	 * @param tagId
	 * @param mappings
	 * @return
	 * @throws I9heException
	 */
	public Integer addTagMapping(List<TagMapping> mappings) throws I9heException;

	/**
	 * 删除商品/文章映射
	 * 
	 * @param mappings
	 * @return
	 * @throws I9heException
	 */
	public Integer deleteTagMapping(Integer tagId, List<Integer> id) throws I9heException;
}
