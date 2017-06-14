package com.i9he.m2b.manage.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.mapper.Category2bMapper;
import com.i9he.m2b.mapper.ExpressfeeGoodsMapper;
import com.i9he.m2b.mapper.ExpressfeeTemplateMapper;
import com.i9he.m2b.mapper.ExpressfeeTypeMapper;
import com.i9he.m2b.mapper.Goods2bMapper;
import com.i9he.m2b.model.Goods;
import com.i9he.m2b.model.GoodsAllRank;
import com.i9he.m2b.model.GoodsRank;
import com.i9he.m2b.model.GoodsSellViewModel;
import com.i9he.m2b.model.OrderSalesVolume;
import com.i9he.m2b.model.search.GoodsSearchModel;

@Service("goodsService")
public class GoodsServiceImpl implements IGoodsService{

	private static Logger logger = LoggerFactory.getLogger(GoodsServiceImpl.class);
	
	@Autowired
	private Goods2bMapper goodsMapper;
	@Autowired
	private Category2bMapper categoryMapper;
	@Autowired
	private ExpressfeeGoodsMapper ExpressfeeGoodsMapper;
	
//	@Override
//	public Goods getGoodsByid(Integer Id) throws I9heException {
//		Goods goods;
//		try {
//			goods = goodsMapper.selectByPrimaryKey(Id);
//			return goods;
//		} catch (Exception e) {
//			logger.error("查询商品id["+Id+"]异常", e);
//			throw new I9heException("", "查询商品id["+Id+"]异常", e);
//		}
//	}

	@Override
	public List<Goods> getGoodsByParentId(Integer id) throws I9heException {
		List<Goods> goods= new ArrayList<Goods>();
		List<Integer> categoryId;
		try {
			categoryId =categoryMapper.selectIdByparentId(id);
			for(Integer id1:categoryId){
				Goods goods1 = goodsMapper.selectByPrimaryKey(id1);
				goods.add(goods1);
			}
			return goods;
		} catch (Exception e) {
			logger.error("查询类别["+id+"]异常", e);
			throw new I9heException("", "查询类别["+id+"]异常", e);
		}
	}

	@Override
	public List<Goods> getAllGoods(){
		// TODO Auto-generated method stub
		List<Goods> goods = goodsMapper.getAllGoods();
		return goods;
	}
	
	@Override
	public Goods deleteGoods(Goods record){
		// TODO Auto-generated method stub
		Goods goods = goodsMapper.deleteGoods(record);
		return goods;
	}
	
	@Override
	public int insert(Goods record){
		return goodsMapper.insertSelective(record); 
	}
	
	@Override
	public Goods selectByPrimaryKey(Integer id){
		return goodsMapper.selectByPrimaryKey(id); 
	}
	
	@Override
	public int updateByPrimaryKey(Goods record){
		return goodsMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int updateByPrimaryKeySelective(Goods record){
		return goodsMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public List<Goods> getGoodsByCategoryId(Integer id){
		return goodsMapper.getGoodsByCategoryId(id);
	}
	
	@Override
	public List<Goods> getGoodsByType(Integer id){
		return goodsMapper.getGoodsByType(id);
	}
	
	@Override
	public List<Goods> getGoods(GoodsSearchModel model) throws I9heException{
		try{
			int count = goodsMapper.getGoodsCount(model);
			List<Goods> list = goodsMapper.getGoods(model);
			model.setTotal(count);
			return list;
		}catch(Exception e){
			logger.error("获取商品列表异常", e);
			throw new I9heException("获取商品列表异常", e);
		}
	}

	@Override
	public Goods getGoodsByid(Integer id) throws I9heException {
		Goods goods;
		try {
			goods = goodsMapper.selectByPrimaryKey(id);
			return goods;
		} catch (Exception e) {
			logger.error("查询商品id["+id+"]异常");
			throw new I9heException("查询商品id["+id+"]异常", e);
		}
	}

	@Override
	public List<GoodsRank> getGoodsRankByM() {
		return goodsMapper.getGoodsRankByM();
	}

	@Override
	public List<GoodsRank> getGoodsRankByQ() {
		return goodsMapper.getGoodsRankByQ();
	}

	@Override
	public List<GoodsSellViewModel> getListGoodsSell() {
		return goodsMapper.getListGoodsSell();
	}

	@Override
	public List<GoodsAllRank> getGoodsAllRank() {
		return goodsMapper.getGoodsAllRank();
	}

	@Override
	public List<GoodsRank> getGoodsRankByY() {
		return goodsMapper.getGoodsRankByY();
	}

	@Override
	public List<OrderSalesVolume> getOrderSalesVolume() {
		return goodsMapper.getOrderSalesVolume();
	}

	@Override
	public void checkIfBindExpressfee(List<Goods> goods) {
		for(Goods gs:goods){
			Integer res = ExpressfeeGoodsMapper.selectExistByGoodsId(gs.getId());
			if(res>0){
				gs.setIsBindExpressfee(1);
			}else{
				gs.setIsBindExpressfee(0);
			}
		}
	}
	
}
