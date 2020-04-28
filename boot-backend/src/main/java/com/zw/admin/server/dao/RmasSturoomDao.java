package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasSturoom;

@Mapper
public interface RmasSturoomDao {

    @Select("select * from rmas_sturoom t where t.id = #{id}")
    RmasSturoom getById(Long id);

    @Delete("delete from rmas_sturoom where id = #{id}")
    int delete(Long id);

    int update(RmasSturoom rmasSturoom);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_sturoom(title, floor, people, status, content, createTime, updateTime) values(#{title}, #{floor}, #{people}, #{status}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasSturoom rmasSturoom);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasSturoom> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
