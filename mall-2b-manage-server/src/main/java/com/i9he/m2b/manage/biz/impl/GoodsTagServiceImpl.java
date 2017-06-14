package com.i9he.m2b.manage.biz.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IGoodsTagService;
import com.i9he.m2b.mapper.GoodsTag2bMapper;
import com.i9he.m2b.model.Goodstag;

@Service("goodstagService")
public class GoodsTagServiceImpl implements IGoodsTagService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private GoodsTag2bMapper goodstagMapper;
	
	@Override
	public List<Goodstag> getallitemtype() throws I9heException {
		List<Goodstag> goodstag;
		try {
			goodstag = goodstagMapper.getallitemtype();
			return goodstag;
		} catch (Exception e) {
			logger.error("查询配件类型出现异常");
			throw new I9heException("查询配件类型出现异常", e);
		}
	}
	
	@Override
	public int insert(Goodstag record)throws I9heException{
		int goodstag;
		try {
			goodstag = goodstagMapper.insert(record);
			return goodstag;
		} catch (Exception e) {
			logger.error("插入配件分类异常");
			throw new I9heException("插入配件分类异常", e);
		}
	}
	
	@Override
	public int insertSelective(Goodstag record)throws I9heException{
		int goodstag;
		try {
			goodstag = goodstagMapper.insertSelective(record);
			return goodstag;
		} catch (Exception e) {
			logger.error("插入配件分类异常");
			throw new I9heException("插入配件分类异常", e);
		}
	}
	
	@Override
	public int updateByPrimaryKeySelective(Goodstag record)throws I9heException{
		int goodstag;
		try {
			goodstag = goodstagMapper.updateByPrimaryKeySelective(record);
			return goodstag;
		} catch (Exception e) {
			logger.error("修改配件分类异常");
			throw new I9heException("修改配件分类异常", e);
		}
	}
	
	@Override
	public List<Goodstag> getalltagtype(Integer id)throws I9heException{
		List goodstag;
		try {
			goodstag = goodstagMapper.getalltagtype(id);
			return goodstag;
		} catch (Exception e) {
			logger.error("查询商品tag异常");
			throw new I9heException("查询商品tag异常", e);
		}
	}
	
	@Override
	public List<Goodstag> getIdtag(Integer id)throws I9heException{
		List goodstag;
		try {
			goodstag = goodstagMapper.getIdtag(id);
			return goodstag;
		} catch (Exception e) {
			logger.error("查询商品tag异常");
			throw new I9heException("查询商品tag异常", e);
		}
	}
	
	@Override
	public int updateshow(Integer id,Integer isShow)throws I9heException{
		int goodstag;
		try {
			goodstag = goodstagMapper.updateshow(id,isShow);
			return goodstag;
		} catch (Exception e) {
			logger.error("修改显示异常");
			throw new I9heException("修改显示异常", e);
		}
	}
	
	@Override
	public Goodstag selectByPrimaryKey2(Integer id)throws I9heException{
		Goodstag goodstag;
		try {
			goodstag = goodstagMapper.selectByPrimaryKey2(id);
			return goodstag;
		} catch (Exception e) {
			logger.error("修改显示异常");
			throw new I9heException("修改显示异常", e);
		} 
	}
	
	
	
}