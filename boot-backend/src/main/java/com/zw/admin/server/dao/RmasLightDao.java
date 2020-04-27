package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasLight;

@Mapper
public interface RmasLightDao {

    @Select("select * from rmas_light t where t.id = #{id}")
    RmasLight getById(Long id);

    @Delete("delete from rmas_light where id = #{id}")
    int delete(Long id);

    int update(RmasLight rmasLight);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_light(title, date, type, room, content, createTime, updateTime) values(#{title}, #{date}, #{type}, #{room}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasLight rmasLight);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasLight> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
