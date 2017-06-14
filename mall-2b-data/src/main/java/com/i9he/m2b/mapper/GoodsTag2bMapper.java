package com.i9he.m2b.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.i9he.m2b.model.Goodstag;

public interface GoodsTag2bMapper {
   
    int insert(Goodstag record);

    int insertSelective(Goodstag record);

    Goodstag selectByPrimaryKey(Integer id);
    
    Goodstag selectByPrimaryKey2(Integer id);

    int updateByPrimaryKeySelective(Goodstag record);

    int updateByPrimaryKey(Goodstag record);
    
    /**
     * 获取所有当前配件类型
     * @return
     * */
    public List<Goodstag> getallitemtype();
    
    public List<Goodstag> getalltagtype(Integer id);

    public int updateshow(@Param("id")Integer id,@Param("isShow")Integer isShow);
    
    public List<Goodstag> getIdtag(Integer id);
    
}