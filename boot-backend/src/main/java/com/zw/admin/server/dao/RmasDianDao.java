package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasDian;

@Mapper
public interface RmasDianDao {

    @Select("select * from rmas_dian t where t.id = #{id}")
    RmasDian getById(Long id);

    @Delete("delete from rmas_dian where id = #{id}")
    int delete(Long id);

    int update(RmasDian rmasDian);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_dian(title, date, type, amt, content, createTime, updateTime) values(#{title}, #{date}, #{type}, #{amt}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasDian rmasDian);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasDian> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
