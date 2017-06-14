package com.i9he.m2b.model;

import java.io.Serializable;

public class Category implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 5996576757393455247L;

	/**
     * 
     */
    private Integer id;

    /**
     * 分类名
     */
    private String name;

    /**
     * 该分类的爸爸
     */
    private Integer parentId;

    /**
     * 
     */
    private String catDesc;

    /**
     * 避免递归查询
     */
    private String structure;
    
    /**
     * 分类等级
     * */
    private Integer catLV;
    
    private Integer sort;
    
    private Integer isShow;
    
    public Integer getSort() {
        return sort;
    }
    public void setSort(Integer sort) {
        this.sort = sort;
    }
    
    public Integer getIsShow() {
        return isShow;
    }
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }
    
    /**
     */
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
    public String getName() {
        return name;
    }

    /**
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     */
    public String getCatDesc() {
        return catDesc;
    }

    /**
     */
    public void setCatDesc(String catDesc) {
        this.catDesc = catDesc == null ? null : catDesc.trim();
    }

    /**
     */
    public String getStructure() {
        return structure;
    }

    /**
     */
    public void setStructure(String structure) {
        this.structure = structure == null ? null : structure.trim();
    }
    
    /**
     */
    public Integer getcatLV() {
        return catLV;
    }

    /**
     */
    public void setcatLV(Integer catLV) {
        this.catLV = catLV;
    }

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Category [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", parentId=");
		builder.append(parentId);
		builder.append(", catDesc=");
		builder.append(catDesc);
		builder.append(", structure=");
		builder.append(structure);
		builder.append(", sort=");
		builder.append(sort);
		builder.append(", isShow=");
		builder.append(isShow);
		builder.append("]");
		return builder.toString();
	}
    
}