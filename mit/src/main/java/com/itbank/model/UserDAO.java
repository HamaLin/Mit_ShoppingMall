package com.itbank.model;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDAO {
	
	@Insert("insert into usertable (username, userbirth, usergender, userphone, usermail, userid, userpw)"
			+ " values (#{username}, #{userbirth}, #{usergender}, #{userphone}, #{usermail}, #{userid}, #{userpw})")
	int join(UserDTO dto);
	
	@Select("select * from usertable where userid = #{userid} and userpw = #{userpw}")
	UserDTO login(UserDTO dto);
	
//	@Update("update usertable set useraddress = #{useraddress}, usernick = #{usernick}, usermail = #{usermail}, userphone = #{userphone}, userimg = #{userimg} where userid = #{userid}")
//	int userModify_file(UserDTO dto);
	
	@Update("update usertable set useraddress = #{useraddress}, usernick = #{usernick}, usermail = #{usermail}, userphone = #{userphone}, userimg = #{userimg}  where userid = #{userid}")
	int userModify(UserDTO dto);
	
	@Delete("delete from usertable where userid = #{userid}")
	int userDelete(UserDTO dto);
	
	@Select("select count(*) from usertable where userid = #{userid}")
	int checkId(String userid);
	
	@Update("update usertable set userpw = #{userpw} where userid = #{userid}")
	int passwordModify(UserDTO dto);
	
	@Select("select count(*) from usertable where userid = #{userid} and usermail = #{usermail}")
	int findUser(UserDTO dto);
	
	@Select("select * from qnatable where idx = #{idx}")
	QnaDTO qnaSelect(int idx);

	@Select("select * from usertable where userid = #{userid}")
	UserDTO getReUser(String userid);
	
	@Delete("delete from wltable where idx = #{idx}")
	int cartDelete(String idx);
	
	@Update("update wltable set buythis = 1 where idx = #{idx}")
	int addOrder(String idx);
	
	@Insert("insert into usertable (username, userbirth, usergender, userphone, usermail, userid)"
			+ " values (#{username}, #{userbirth}, #{usergender}, #{userphone}, #{usermail}, #{userid})")
	int insertNaver(UserDTO naverUser);
	
	@Select("select count(*) from usertable where userid = #{userid}")
	int checkNaver(String userid);
	
	@Select("select * from usertable where userid = #{userid}")
	UserDTO loginNaver(String userid);

}
