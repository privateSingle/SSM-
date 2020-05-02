package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasGoback;

@Mapper
public interface RmasGobackDao {

    @Select("select * from rmas_goback t where t.id = #{id}")
    RmasGoback getById(Long id);

    @Delete("delete from rmas_goback where id = #{id}")
    int delete(Long id);

    int update(RmasGoback rmasGoback);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_goback(title, date, type, student, content, createTime, updateTime) values(#{title}, #{date}, #{type}, #{student}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasGoback rmasGoback);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasGoback> listAll();
    List<RmasGoback> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
