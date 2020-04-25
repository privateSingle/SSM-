package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasStudentThings;

@Mapper
public interface RmasStudentThingsDao {

    @Select("select * from rmas_student_things t where t.id = #{id}")
    RmasStudentThings getById(Long id);

    @Delete("delete from rmas_student_things where id = #{id}")
    int delete(Long id);

    int update(RmasStudentThings rmasStudentThings);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_student_things(title, context, stuName, birthday, imgUrl, createTime, updateTime) values(#{title}, #{context}, #{stuName}, #{birthday}, #{imgUrl}, #{createTime}, #{updateTime})")
    int save(RmasStudentThings rmasStudentThings);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasStudentThings> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
