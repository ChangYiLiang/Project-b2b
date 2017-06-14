package com.i9he.m2b.biz.impl;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IGoodsItemService;
import com.i9he.m2b.mapper.GoodsItem2bMapper;
import com.i9he.m2b.mapper.Item2bMapper;
import com.i9he.m2b.model.GoodsItem;
import com.nr.comm.util.Calculations;

@Service("GoodsItemService")
public class GoodsItemServiceImpl implements IGoodsItemService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private Item2bMapper itemMapper;
	
	@Autowired
	private GoodsItem2bMapper goodsitemMapper;
	
	@Override
	public int insert(GoodsItem record){
		return goodsitemMapper.insert(record); 
	}
	
	@Override
	public GoodsItem selectByPrimaryKey(Integer goodsId){
		return goodsitemMapper.selectByPrimaryKey(goodsId); 
	}
	
	@Override
	public List<GoodsItem> selectItemKey(Integer goodsId){
		return goodsitemMapper.selectItemKey(goodsId);
	}
	
	@Override
	public List<GoodsItem> selectItemKey2(Integer goodsId){
		return goodsitemMapper.selectItemKey2(goodsId);
	}
	
	@Override
	public GoodsItem CheckItemBind(Integer goodsId,Integer itemId){
		return goodsitemMapper.CheckItemBind(goodsId,itemId);
	}
	
	@Override
	public int updateByPrimaryKeySelective(GoodsItem record){
		return goodsitemMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int updatebind(Integer goodsId,Integer itemId,Integer isShow){
		return goodsitemMapper.updatebind(goodsId,itemId,isShow);
	}
	
}