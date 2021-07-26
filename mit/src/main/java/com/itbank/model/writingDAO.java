package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface writingDAO {

	@Insert("insert into writing(scope, wr, writer, img, pdidx)"
			+ "VALUES(#{scope}, #{wr}, #{writer}, #{img}, #{pdidx})")
	int insert(writingDTO dto);

	@Select("select * from writing where pdidx = #{idx}")
	List<writingDTO> getreplylist(@Param("idx") int idx);
	
	@Select("select * from writing where idx = #{idx}")
	writingDTO getreplyone(@Param("idx") int idx);

	@Update("update writing set wr = #{wr}, scope = #{scope} where idx = #{idx}")
	int modifyreply(writingDTO dto);
	
	@Update("update writing set wr = #{wr}, scope = #{scope}, img = #{img} where idx = #{idx}")
	int modifyimgreply(writingDTO dto);

	@Delete("delete from writing where idx = #{idx}")
	int deletereply(@Param("idx") int idx);


}
