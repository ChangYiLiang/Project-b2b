package com.i9he.m2b.model;

import java.io.Serializable;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Trusteeship implements Serializable {

	private Integer id;
	
	private Integer userId;

	private Integer goodsId;
	
	private Integer area;

	private String trustName;

	private String comment;
	
	private Integer orderId;
	
	private Integer trustId;
	
	private String goodsName;
	
	private String name;
	
	private static final long serialVersionUID = 1L;
	
	public Integer getTrustId() {
		return trustId;
	}
	public void setTrustId(Integer trustId) {
		this.trustId = trustId;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName == null ? null : goodsName.trim();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}
	
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getArea() {
		return area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public String getTrustName() {
		return trustName;
	}

	public void setTrustName(String trustName) {
		this.trustName = trustName == null ? null : trustName.trim();
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment == null ? null : comment.trim();
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Trusteeship [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", goodsId=");
		builder.append(goodsId);
		builder.append(", area=");
		builder.append(area);
		builder.append(", trustName=");
		builder.append(trustName);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", orderId=");
		builder.append(orderId);
		builder.append(", trustId=");
		builder.append(trustId);
		builder.append(", goodsName=");
		builder.append(goodsName);
		builder.append(", name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}
	
}