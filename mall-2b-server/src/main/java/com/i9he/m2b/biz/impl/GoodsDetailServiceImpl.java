package com.i9he.m2b.biz.impl;

import java.math.BigDecimal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IGoodsDetailService;
import com.i9he.m2b.mapper.GoodsDetail2bMapper;
import com.i9he.m2b.model.GoodsDetail;
import com.i9he.m2b.util.MallErroCode;
import com.nr.comm.util.Calculations;

@Service("goodsDetailService")
public class GoodsDetailServiceImpl implements IGoodsDetailService{

	private static Logger logger = LoggerFactory.getLogger("com.i9he.mall");
	
	@Autowired
	private GoodsDetail2bMapper goodsDetail2bMapper;

	@Override
	public BigDecimal getAmountByItemIdandOrder(Integer orderCycle ,Integer ItemId,Integer goodsId) throws I9heException {
		try {
			return goodsDetail2bMapper.getpriceByItemId(orderCycle, ItemId,goodsId);
		} catch (Exception e) {
			logger.error("根据订购周期"+orderCycle+"配件ID"+ItemId+"商品id"+goodsId+"查询价格出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "根据订购周期"+orderCycle+"配件ID"+ItemId+"商品id"+goodsId+"查询价格出现异常", e);
		}
	}
	
	@Override
	public BigDecimal getAmountByGoodsId(Integer orderCycle,Integer goodsId)throws I9heException{
		try {
			return goodsDetail2bMapper.getpriceByGoodsId(orderCycle, goodsId);
		} catch (Exception e) {
			logger.error("根据订购周期"+orderCycle+"配件ID"+goodsId+"查询价格出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "根据订购周期"+orderCycle+"商品id"+goodsId+"查询价格出现异常", e);
		}
	}	

	@Override
	@Transactional
	public double getAllItemAmount(String id,Integer oc,Integer goodsId) throws I9heException {
		try {
			if(id==null){
				throw new I9heException(MallErroCode.MALL_PARA_ERRO, "参数异常");
			}
			double total=0;
			String[] idss =id.split(";");
			for(String ids : idss){
				total=Calculations.add(total, getAmountByItemIdandOrder(oc,Integer.parseInt(ids),goodsId).doubleValue());
			}
			return total;
		} catch (Exception e) {
			logger.error("根据配件id列["+id+"]获取总价异常");
			throw new I9heException(MallErroCode.MALL_PRICE_ERRO,"根据配件id列["+id+"]获取总价异常", e);
		}
	}
	
	@Override
	public GoodsDetail selectByPrimaryKey(Integer goodsId)throws I9heException{
		try {
			return goodsDetail2bMapper.selectByPrimaryKey(goodsId);
		} catch (Exception e) {
			logger.error("根据商品ID"+goodsId+"查询信息出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "根据商品ID"+goodsId+"查询信息出现异常", e);
		}
	}
	
	@Override
	public int updateByPrimaryKeySelective(GoodsDetail record)throws I9heException{
		try {
			return goodsDetail2bMapper.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			logger.error("修改配件价格列表出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "修改配件价格列表出现异常", e);
		}
	}
	
	@Override
	public int insert(GoodsDetail record)throws I9heException{
		try {
			return goodsDetail2bMapper.insert(record);
		} catch (Exception e) {
			logger.error("插入配件价格出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "插入配件价格出现异常", e);
		}
	}
	
	@Override
	public GoodsDetail selectPrice(Integer goodsId,Integer itemId)throws I9heException{
		try {
			return goodsDetail2bMapper.selectPrice(goodsId,itemId);
		} catch (Exception e) {
			logger.error("查询配件价格出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "查询配件价格出现异常", e);
		}
	}
	
	@Override
	public int updatePrice(GoodsDetail record)throws I9heException{
		try {
			return goodsDetail2bMapper.updatePrice(record);
		} catch (Exception e) {
			logger.error("修改配件价格出现异常");
			throw new I9heException(MallErroCode.MALL_GOODS_SELECT_ERRO, "修改配件价格出现异常", e);
		}
	}

}
