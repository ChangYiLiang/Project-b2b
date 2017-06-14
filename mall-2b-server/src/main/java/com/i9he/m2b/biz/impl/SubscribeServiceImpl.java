package com.i9he.m2b.biz.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.ISubscribeService;
import com.i9he.m2b.mapper.SubscribeMapper;
import com.i9he.m2b.mapper.TagCategoryMapper;
import com.i9he.m2b.mapper.TagMapper;
import com.i9he.m2b.model.Subscribe;
import com.i9he.m2b.model.Tag;
import com.i9he.m2b.model.TagCategory;
import com.i9he.m2b.util.SessionUtil;

@Service("SubscribeService")
public class SubscribeServiceImpl implements ISubscribeService{

	private static Logger logger = LoggerFactory.getLogger("com.i9he.com");
	
	@Autowired
	public SubscribeMapper subscribeMapper;
	@Autowired
	public TagCategoryMapper tagCategoryMapper;
	@Autowired
	public TagMapper tagMapper;
	
	@Override
	public List<Subscribe> getSubscribeByUser() throws I9heException {
		try{
			Integer userId = SessionUtil.getSessionUserID();
			List<Subscribe> subscribe = subscribeMapper.selectByUserId(userId);
			return subscribe;
		}catch(Exception e){
			logger.error("查询订阅异常");
			throw new I9heException("查询订阅异常",e);
		}
		
	}

	@Override
	public List<TagCategory> getAllTags() throws I9heException {
		try{
			List<TagCategory> tagCategorys = tagCategoryMapper.selectAll();
			if(tagCategorys != null){
				for(TagCategory tagc:tagCategorys){
					List<Tag> tags = tagMapper.selectByCategoryId(tagc.getId());
					tagc.setTags(tags);
				}
			}
			return tagCategorys;
		}catch(Exception e){
			logger.error("查询订阅异常");
			throw new I9heException("查询订阅异常",e);
		}
		
	}

	@Override
	public Integer addSubscribe(Integer tagId) throws I9heException {
		try{
			Integer userId = SessionUtil.getSessionUserID();
			List<Subscribe> listsub = subscribeMapper.selectByUserId(userId);
			if(listsub != null){
				if(listsub.size() >= 5){
					return 0;
				}
			}
			Subscribe subscribe = new Subscribe();
			subscribe.setUserId(userId);
			subscribe.setTagId(tagId);
			subscribe.setCreatedDate(new Date());
			Integer res = subscribeMapper.insertSelective(subscribe);
			return res;
		}catch(Exception e){
			logger.error("添加订阅异常");
			throw new I9heException("添加订阅异常",e);
		}
		
	}

	@Override
	public Integer deleteSubscribe(Integer tagId) throws I9heException {
		try{
			Integer userId = SessionUtil.getSessionUserID();
			Integer res = subscribeMapper.deleteByTagId(tagId,userId);
			return res;
		}catch(Exception e){
			logger.error("删除订阅异常");
			throw new I9heException("删除订阅异常",e);
		}
		
	}
	
}
