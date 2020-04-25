package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasExam;

@Mapper
public interface RmasExamDao {

    @Select("select * from rmas_exam t where t.id = #{id}")
    RmasExam getById(Long id);

    @Delete("delete from rmas_exam where id = #{id}")
    int delete(Long id);

    int update(RmasExam rmasExam);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_exam(examName, examDate, context, grade, term, createTime, updateTime) values(#{examName}, #{examDate}, #{context}, #{grade}, #{term}, #{createTime}, #{updateTime})")
    int save(RmasExam rmasExam);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasExam> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
