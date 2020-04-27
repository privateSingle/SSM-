package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasRoom;

@Mapper
public interface RmasRoomDao {

    @Select("select * from rmas_room t where t.id = #{id}")
    RmasRoom getById(Long id);

    @Delete("delete from rmas_room where id = #{id}")
    int delete(Long id);

    int update(RmasRoom rmasRoom);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_room(title, floor, door, num, content, createTime, updateTime) values(#{title}, #{floor}, #{door}, #{num}, #{content}, #{createTime}, #{updateTime})")
    int save(RmasRoom rmasRoom);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasRoom> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
