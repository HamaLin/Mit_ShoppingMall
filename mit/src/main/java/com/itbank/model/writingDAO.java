package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface writingDAO {

	@Insert("insert into writing(scope, wr, writer, img, pdidx)"
			+ "VALUES(#{scope}, #{wr}, #{writer}, #{img}, #{pdidx})")
	int insert(writingDTO dto);

	@Select("select * from writing where pdidx = #{idx}")
	List<writingDTO> getreplylist(@Param("idx") int idx);

}
