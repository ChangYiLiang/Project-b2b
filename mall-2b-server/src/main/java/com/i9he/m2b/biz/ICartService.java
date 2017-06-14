package com.i9he.m2b.biz;


import java.math.BigDecimal;
import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.model.PayViewModel;
import com.i9he.m2b.model.Cart;
import com.i9he.privilege.model.Address;
import com.i9he.privilege.model.User;

public interface ICartService {
	
	/**
	 * 根据用户ID获取购物车
	 * @param userId
	 * @return
	 * @throws I9heException
	 */
	public List<Cart> getCartByUserid(Integer userId )throws I9heException;
	/**
	 * 加入购物车
	 * @param cart
	 * @throws I9heException
	 */
	public Boolean insertCart(Cart cart)throws I9heException;
	/**
	 * 获取用户购物车可使用数量
	 * @return
	 * @throws I9heException
	 */
	public Integer getCartCount(Integer userId)throws I9heException;
	
	/**
	 * 更新购物车。
	 * @param cart
	 * @return
	 * @throws I9heException
	 */
	public int updateCart(Cart cart)throws I9heException;
	
	/**
	 * 根据id 查询购物车
	 * @param id
	 * @return
	 * @throws I9heException
	 */
	public Cart selectCartById(Integer id)throws I9heException;
	
	/**
	 * 批量生产订单
	 * @param cart
	 * @return
	 * @throws I9heException
	 */
//	public Integer getorderByCartList(List<Cart> cart,User user)throws I9heException;
	
	/**
	 * 根据用户名字获取在支付中的订单
	 * @param userId
	 * @return
	 * @throws I9heException
	 */
	public List<Cart> getListCartBy2(Integer userId)throws I9heException;
	/**
	 * 加入购物车
	 * @param id
	 * @return
	 * @throws I9heException
	 */
//	public Boolean creatBusCart(Integer id,Integer id1)throws I9heException;
	
	/***
	 * 批量生产订单测试
	 * @param cart
	 * @param user
	 * @param addressId 
	 * @return
	 * @throws I9heException
	 */
	Integer getorderByCartList2(List<Cart> cart, User user, Integer addressId)throws I9heException;
	
	
	public List<Cart> ListCartByUserId(Integer userId)throws I9heException;
	
	public BigDecimal getAllPrice(Integer userId)throws I9heException;
	
	public int deleteByPrimaryKey(Integer id)throws I9heException;
	
	/***
	 * 插入地址到订单地址表和订单表
	 * @param expressfee 
	 * @return
	 * @throws I9heException 
	 */
	public Integer updateOrderAddress(Address ad, Integer id) throws I9heException;
	
	/***
	 * 根据订单信息计算运费
	 * @return
	 */
	public BigDecimal getExpressfee(Integer goodsId, Integer number,Address address);
	
	/**
	 * 生成一个总单
	 * @return
	 * @throws I9heException 
	 **/
	public Integer GetAllOrder(BigDecimal expressfee,BigDecimal Allamount,Integer userId,Integer AddressId) throws I9heException;
	
	/**
	 * 生成一个发票
	 * @return
	 * @throws I9heException 
	 **/
	public Integer GetInvoice(Integer orderid,Integer userId,String header,String content,String remark,Integer zzId) throws I9heException;
	
	/**
	 * 绑定子单
	 * @return
	 * @throws I9heException 
	 **/
	public Integer GetBatchSon(Integer orderid,Integer batch,boolean flag) throws I9heException;
	
	/**
	 * 绑定托管地区记录表
	 * @return
	 * @throws I9heException 
	 **/
	public Integer GetTruArea(Integer userId,Integer goodsId,Integer area,Integer trustId,Integer orderId) throws I9heException;
	
}
