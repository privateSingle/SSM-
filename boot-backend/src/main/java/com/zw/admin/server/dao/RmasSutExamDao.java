package com.zw.admin.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zw.admin.server.model.RmasSutExam;

@Mapper
public interface RmasSutExamDao {

    @Select("select * from rmas_sut_exam t where t.id = #{id}")
    RmasSutExam getById(Long id);

    @Delete("delete from rmas_sut_exam where id = #{id}")
    int delete(Long id);

    int update(RmasSutExam rmasSutExam);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into rmas_sut_exam(examId, examName, examDate, grade, term, stuId, stuName, yuwen, yuwenJc, yuwenyd, yuwenZw, shuxue, shuxueXz, shuxueJs, english, sipin, zf, context, createTime, updateTime) values(#{examId}, #{examName}, #{examDate}, #{grade}, #{term}, #{stuId}, #{stuName}, #{yuwen}, #{yuwenJc}, #{yuwenyd}, #{yuwenZw}, #{shuxue}, #{shuxueXz}, #{shuxueJs}, #{english}, #{sipin}, #{zf}, #{context}, #{createTime}, #{updateTime})")
    int save(RmasSutExam rmasSutExam);
    
    int count(@Param("params") Map<String, Object> params);

    List<RmasSutExam> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
