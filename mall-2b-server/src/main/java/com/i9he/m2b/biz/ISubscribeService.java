package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.TagCategory;

public interface ISubscribeService {
	
	public List<com.i9he.m2b.model.Subscribe> getSubscribeByUser() throws I9heException;
	
	/***
	 * 获取所有标签分类 
	 * @return
	 * @throws I9heException 
	 */
	public List<TagCategory> getAllTags() throws I9heException;

	/***
	 * 添加订阅
	 * @param tagId
	 * @return
	 * @throws I9heException 
	 */
	public Integer addSubscribe(Integer tagId) throws I9heException;

	/***
	 * 删除订阅
	 * @param tagId
	 * @return
	 * @throws I9heException 
	 */
	public Integer deleteSubscribe(Integer tagId) throws I9heException;

}
