package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface writingDAO {

	@Insert("insert into writing(email,password1,password2,scope,wr,writer)"
			+ "VALUES(#{email},#{password1},#{password2},#{scope},#{wr},#{writer})")
	int insert(writingDTO dto);

	@Select("select * from writing order by idx desc")
	List<writingDTO> select();

}
