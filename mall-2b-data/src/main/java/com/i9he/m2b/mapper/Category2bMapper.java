package com.i9he.m2b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Category;

public interface Category2bMapper {
 
    int deleteByPrimaryKey(Integer id);
    
    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    /**
     * 根据父类ID获取对应的ID
     */
    public List<Integer> selectIdByparentId(@Param("parentId")Integer id);
    
    /**
     * 获取所有当前分类哈希排序
     * @return
     * */
    public List<Category> getallcategory();
    
    /**
     * 获取最大值
     * @return
     * */
    public int getmax();
    
    /**
     * 获取所有一级分类
     * @return
     * */
    public List<Category> getmaxcat();
    
    /**
     * 根据一级分类获取二级分类
     * @return
     * */
    public List<Category> getsecondcat(Integer id);
    
}