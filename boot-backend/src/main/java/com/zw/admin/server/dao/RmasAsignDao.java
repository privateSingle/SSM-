package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasAsign;

@Mapper
public interface RmasAsignDao {

    @Select("select * from rmas_asign t where t.id = #{id}")
    RmasAsign getById(Long id);

    @Delete("delete from rmas_asign where id = #{id}")
    int delete(Long id);

    int update(RmasAsign rmasAsign);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_asign(title, date, room, student, content, createTime, updateTime) values(#{title}, #{date}, #{room}, #{student}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasAsign rmasAsign);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasAsign> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
