package com.i9he.m2b.biz.model;

import java.math.BigDecimal;
import java.util.List;

import com.i9he.m2b.model.Cart;


public class CartViewModel {
	private Integer id;
	
	private String goodsName;
	
	private String config;
	
	private List<String> orderCofig;
	
	private Integer serviceId;
	
	private Integer goodnum;
	
	private Integer cycle;
	
	private BigDecimal price;
	
	private BigDecimal allprice;
	
	private Integer isIdc;
	
	private String img;
	
	private BigDecimal expressfee;
	
	public BigDecimal getExpressfee() {
		return expressfee;
	}

	public void setExpressfee(BigDecimal expressfee) {
		this.expressfee = expressfee;
	}

	public CartViewModel() {
		super();
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIsIdc() {
		return isIdc;
	}

	public void setIsIdc(Integer isIdc) {
		this.isIdc = isIdc;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public List<String> getOrderCofig() {
		return orderCofig;
	}

	public void setOrderCofig(List<String> orderCofig) {
		this.orderCofig = orderCofig;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getGoodnum() {
		return goodnum;
	}

	public void setGoodnum(Integer goodnum) {
		this.goodnum = goodnum;
	}

	public Integer getCycle() {
		return cycle;
	}

	public void setCycle(Integer cycle) {
		this.cycle = cycle;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getAllprice() {
		return allprice;
	}

	public void setAllprice(BigDecimal allprice) {
		this.allprice = allprice;
	}

	public CartViewModel(Cart cart) {
		this.id= cart.getId();
		this.serviceId = cart.getServiceId();
		this.goodnum = cart.getGoodsNum();
		this.cycle = cart.getCycle();
		this.price = cart.getPrice();
		this.allprice = cart.getAllprice();
		this.isIdc = cart.getIsIdc();
	}
	
}
