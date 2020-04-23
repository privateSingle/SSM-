package com.zw.admin.server.dao;

import com.zw.admin.server.model.Wzapply;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface WzapplyDao {

    @Select("select * from wzapply t where t.id = #{id}")
    Wzapply getById(Long id);

    @Delete("delete from wzapply where id = #{id}")
    int delete(Long id);

    int update(Wzapply wzapply);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into wzapply(wztype, wzaddress, wzprice, wzbigprice, wznum) values(#{wztype}, #{wzaddress}, #{wzprice}, #{wzbigprice}, #{wznum})")
    int save(Wzapply wzapply);
    
    int count(@Param("params") Map<String, Object> params);

    List<Wzapply> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
