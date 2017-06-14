package com.i9he.m2b.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Itemcategory implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4364605604626846449L;

	/**
     * 
     */
    private Integer id;

    /**
     * 
     */
    private String typeName;

    /**
     * 外键
     */
    private Integer ifIdc;
    
    /**
     * 属性
     * */
    private String typeAttr;
    
    /**
     * 是否显示
     * */
    private Integer isShow;
    
    private Integer sort;
    
    public Integer getSort() {
        return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * get set 后面第一个字母要大写，不然json解析不出来，鸡巴
     * */
    public Integer getId() {
        return id;
    }

    /**
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    /**
     */
    public Integer getIfIdc() {
        return ifIdc;
    }

    /**
     */
    public void setIfIdc(Integer ifIdc) {
        this.ifIdc = ifIdc;
    }
    
    /**
     */
    public String getTypeAttr() {
        return typeAttr;
    }

    /**
     */
    public void setTypeAttr(String typeAttr) {
        this.typeAttr = typeAttr == null ? null : typeAttr.trim();
    }
    
    public Integer getIsShow() {
        return isShow;
    }

    /**
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Itemcategory [id=");
		builder.append(id);
		builder.append(", typeName=");
		builder.append(typeName);
		builder.append(", ifIdc=");
		builder.append(ifIdc);
		builder.append(", typeAttr=");
		builder.append(typeAttr);
		builder.append(", isShow=");
		builder.append(isShow);
		builder.append(", sort=");
		builder.append(sort);
		builder.append("]");
		return builder.toString();
	}
    
}