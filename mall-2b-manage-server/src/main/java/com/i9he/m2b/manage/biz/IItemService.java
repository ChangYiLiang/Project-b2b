package com.i9he.m2b.manage.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Item;
import com.i9he.m2b.model.search.ItemSearchModel;


/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public interface IItemService {
	
	/**
	 * 根据配件ID获取配件
	 * @param ItemId
	 * @return
	 * @throws I9heException
	 */
	public Item selectItemByItemId(Integer ItemId)throws I9heException;
	
	/**
	 * 根据配件id的list 遍历算出价格 
	 * @param listItemId
	 * @return
	 */
	public double getTotalPrice(String id)throws I9heException;
	
//	/**
//	 * 根据orderId 获取配件列表
//	 * @return
//	 * @throws I9heException
//	 */
//	public List<Item> getOrderItem(Integer orderId)throws I9heException;
	
	/**
	 * 获取配件列表
	 * @return
	 * @throws I9heException
	 */
	public List<Item> getallitem() throws I9heException;
	
	/**
	 * 插入配件
	 * @return
	 * @throws I9heException
	 */
	int insert(Item record) throws I9heException;

	/**
	 * 删除配件
	 * @return
	 * @throws I9heException
	 */
	int deleteByPrimaryKey(Integer id) throws I9heException;
	
	/**
	 * 找到某个配件
	 * @return
	 * @throws I9heException
	 */
	public Item selectByPrimaryKey(Integer id) throws I9heException;
	
	/**
	 * 修改某个配件
	 * @return
	 * @throws I9heException 
	 * */
	int updateByPrimaryKey(Item record) throws I9heException;
	
	/**
	 * 获取某个类型的配件
	 * @return
	 * @throws I9heException 
	 * */
	public List<Item> getitemType(Integer id) throws I9heException;
	
	/**
	 * 联表查询配件参数列表
	 * @return
	 * @throws I9heException
	 * */
	
	public List<Item> getjoinitem(Integer goodsId,Integer itemType) throws I9heException;
	
	
	/**
	 * 联表查询配件参数绑定情况
	 * @return
	 * @throws I9heException
	 * */
	
	public List<Item> getjoinitem2(Integer goodsId,Integer itemType) throws I9heException;
	
	
	public List<Item> getItem(ItemSearchModel model) throws I9heException;

}
