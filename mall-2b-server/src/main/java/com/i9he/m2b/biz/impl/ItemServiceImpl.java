package com.i9he.m2b.biz.impl;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IItemService;
import com.i9he.m2b.mapper.Item2bMapper;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.search.ItemSearchModel;
import com.i9he.m2b.util.MallErroCode;
import com.nr.comm.util.Calculations;

@Service("itemService")
public class ItemServiceImpl implements IItemService {

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private Item2bMapper itemMapper;
	
	@Override
	public Item selectItemByItemId(Integer ItemId) throws I9heException {
		Item item;
		try {
			item = itemMapper.selectByPrimaryKey(ItemId);
			return item;
		} catch (Exception e) {
			logger.error("查询配件id["+ItemId+"]出现异常");
			throw new I9heException(MallErroCode.MALL_ITEM_SELECT_ERRO, "查询配件id["+ItemId+"]出现异常", e);
		}
	}

	@Override
	public double getTotalPrice(String id) throws I9heException {
		try {
			if(id==null){
				throw new I9heException(MallErroCode.MALL_PARA_ERRO, "参数异常");
			}
			double total=0;
			String[] idss =id.split(";");
			for(String ids : idss){
				Item item = itemMapper.selectByPrimaryKey(Integer.parseInt(ids));
				total=Calculations.add(total, item.getPrice().doubleValue());
			}
			return total;
		} catch (Exception e) {
			logger.error("根据配件id列["+id+"]获取硬件总价异常");
			throw new I9heException(MallErroCode.MALL_PRICE_ERRO,"根据配件id列["+id+"]获取硬件总价异常", e);
		}
	}

    
	@Override
	public List<Item> getallitem()throws I9heException {
		List<Item> item;
		try {
			item = itemMapper.getallitem();
			return (List<Item>) item;
		} catch (Exception e) {
			logger.error("查询配件出现异常", e);
			throw new I9heException("", "查询配件出现异常", e);
		}
	}
	
	
	@Override
	public int insert(Item record)throws I9heException {
		int item;
		try {
			item = itemMapper.insert(record);
			return item;
		} catch (Exception e) {
			logger.error("更新配件id["+record+"]出现异常", e);
			throw new I9heException("", "更新配件id["+record+"]出现异常", e);
		}
	}
	
	@Override
	public int deleteByPrimaryKey(Integer id)throws I9heException {
		int item;
		try {
			item = itemMapper.deleteByPrimaryKey(id);
			return item;
		} catch (Exception e) {
			logger.error("更新配件id["+id+"]出现异常", e);
			throw new I9heException("", "更新配件id["+id+"]出现异常", e);
		}
	}
	
	@Override
	public Item selectByPrimaryKey(Integer id) throws I9heException {
		Item item;
		try {
			item = itemMapper.selectByPrimaryKey(id);
			return item;
		} catch (Exception e) {
			logger.error("查询配件id["+id+"]出现异常", e);
			throw new I9heException("", "查询配件id["+id+"]出现异常", e);
		}
	}
	
	@Override
	public int updateByPrimaryKey(Item record) throws I9heException {
		int item;
		try {
			item = itemMapper.updateByPrimaryKey(record);
			return item;
		} catch (Exception e) {
			logger.error("更新配件id["+record+"]出现异常", e);
			throw new I9heException("", "更新配件id["+record+"]出现异常", e);
		}
	}
	
	@Override
	public List<Item> getitemType(Integer id) throws I9heException {
		List<Item> item;
		try {
			item = itemMapper.getitemType(id);
			return item;
		} catch (Exception e) {
			logger.error("查询配件id["+id+"]出现异常", e);
			throw new I9heException("", "查询配件id["+id+"]出现异常", e);
		}
	}
	
	@Override
	public List<Item> getItem(ItemSearchModel model) throws I9heException{
		try{
			int count = itemMapper.getItemCount(model);
			List<Item> list = itemMapper.getItem(model);
			model.setTotal(count);
			return list;
		}catch(Exception e){
			logger.error("获取配件列表异常", e);
			throw new I9heException("获取配件列表异常", e);
		}
	}
	
	@Override
	public List<Item> getjoinitem(Integer goodsId,Integer itemType) throws I9heException{
		try{
			List<Item> list = itemMapper.getjoinitem(goodsId,itemType);
			return list;
		}catch(Exception e){
			logger.error("获取配件列表异常", e);
			throw new I9heException("获取配件列表异常", e);
		}
	}
	
	@Override
	public List<Item> getjoinitem2(Integer goodsId,Integer itemType) throws I9heException{
		try{
			List<Item> list = itemMapper.getjoinitem2(goodsId,itemType);
			return list;
		}catch(Exception e){
			logger.error("获取配件列表异常", e);
			throw new I9heException("获取配件列表异常", e);
		}
	}
	
}
