package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasSheshi;

@Mapper
public interface RmasSheshiDao {

    @Select("select * from rmas_sheshi t where t.id = #{id}")
    RmasSheshi getById(Long id);

    @Delete("delete from rmas_sheshi where id = #{id}")
    int delete(Long id);

    int update(RmasSheshi rmasSheshi);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_sheshi(title, bxDate, bxUser, tell, content, createTime, updateTime, status) values(#{title}, #{bxDate}, #{bxUser}, #{tell}, #{content}, #{createTime}, #{updateTime}, #{status})")
    int save(RmasSheshi rmasSheshi);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasSheshi> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
