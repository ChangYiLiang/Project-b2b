package com.i9he.m2b.model;

import java.io.Serializable;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class TruDatacenter implements Serializable {
   
    private Integer id;
    private String no;
    private String name;
    private String truname;
    private Integer city;
    private String comment;
    private Integer goodsId;
    private static final long serialVersionUID = 1L;

    public String getTruname() {
        return truname;
    }

    public void setTruname(String truname) {
        this.truname = truname == null ? null : truname.trim();
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
    
    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TruDatacenter [id=");
		builder.append(id);
		builder.append(", no=");
		builder.append(no);
		builder.append(", name=");
		builder.append(name);
		builder.append(", truname=");
		builder.append(truname);
		builder.append(", city=");
		builder.append(city);
		builder.append(", comment=");
		builder.append(comment);
		builder.append("]");
		return builder.toString();
	}
    
}