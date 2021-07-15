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
	
	@Update("update usertable set usernick = #{usernick}, usermail = #{usermail}, userphone = #{userphone}, userimg = #{userimg} where userid = #{userid}")
	int userModify_file(UserDTO dto);
	
	@Update("update usertable set usernick = #{usernick}, usermail = #{usermail}, userphone = #{userphone} where userid = #{userid}")
	int userModify(UserDTO dto);
	
	@Delete("delete from usertable where userid = #{userid}")
	int userDelete(UserDTO dto);
	
	@Select("select count(*) from usertable where userid = #{userid}")
	int checkId(String userid);
	
	@Update("update usertable set userpw = #{userpw} where userid = #{userid}")
	int passwordModify(UserDTO dto);
	
	@Select("select count(*) from usertable where userid = #{userid} and usermail = #{usermail}")
	int findUser(UserDTO dto);

}
