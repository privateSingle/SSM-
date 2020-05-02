package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasTongji;

@Mapper
public interface RmasTongjiDao {

    @Select("select * from rmas_tongji t where t.type = #{id}")
    RmasTongji getById(String type);

    @Delete("delete from rmas_tongji")
    int delete();

//    @Delete("delete from rmas_tongji where id = #{id}")
//    int delete(Long id);

    int update(RmasTongji rmasTongji);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_tongji(type, January, February, March, April, May, June, July, August, September, October, November, December, createTime, updateTime) values(#{type}, #{January}, #{February}, #{March}, #{April}, #{May}, #{June}, #{July}, #{August}, #{September}, #{October}, #{November}, #{December}, #{createTime}, #{updateTime})")
    int save(RmasTongji rmasTongji);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasTongji> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
