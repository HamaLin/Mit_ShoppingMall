package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StoreDAO {

	@Insert("insert into pdtable (pdtitle, pdprice, pdcontent, pdcode, pdname, pdcolor, "
			+ "pdimg, pdwriter, mainimg, pdscount, pdmcount, pdlcount, pdxlcount) "
			+ "values (#{pdtitle}, #{pdprice}, #{pdcontent}, #{pdcode}, #{pdname}, #{pdcolor}, "
			+ "#{pdimg} , #{pdwriter}, #{mainimg}, #{pdscount}, #{pdmcount}, #{pdlcount}, #{pdxlcount})")
	int getInsertItem(StoreDTO dto);

	@Select("select * from pdtable order by idx")
	List<StoreDTO> getList();

	@Select("select filename from pdtable_files  where tidx = #{idx}")
	List<String> getfileList(int idx);

	@Select("select * from pdtable where idx = #{idx}")
	StoreDTO SelecOne(int idx);

	@Delete("delete from pdtable where idx = #{idx}")
	int delete(int idx);

	@Update("update pdtable set pdtitle = #{pdtitle}, pdprice = #{pdprice}, pdcount = #{pdcount}, pdcontent = #{pdcontent}, "
			+ "pdcode = #{pdcode},"
			+ "pdname = #{pdname}, pdcolor = #{pdcolor}, pdimg = #{pdimg} where idx = #{idx}")
	int getModify(StoreDTO dto);
	
	@Select("select idx, pdimg, pdtitle, pdprice from pdtable"
			+ " where pdtitle like '%'||#{search}||'%'"
			+ " or pdname like '%'||#{search}||'%'"
			+ " or pdcolor like '%'||#{search}||'%'"
			+ "")
	List<StoreDTO> searchItems(@Param("search") String search);

	@Insert("insert into wltable (pdidx, userid, usergender, count, price, mainimg, usersize) values "
			+ "(#{pdidx}, #{userid}, #{usergender}, #{count}, #{price}, #{mainimg}, #{usersize})")
	int wishInsert(WishListDTO dto);

	@Insert("insert into buytable (userid, pdidx, usergender, userage, count, usersize) values"
			+ "(#{userid}, #{pdidx}, #{usergender}, #{userage}, #{count}, #{usersize})")
	int insertbuytable(BuyTableDTO dto);

	@Update("update pdtable set pdscount = ${pdscount} where idx = ${idx}")
	void setscountmodifycount(@Param("pdscount") int pdscount,@Param("idx") int idx);

	@Update("update pdtable set pdmcount = ${pdmcount} where idx = ${idx}")
	void setmcountmodifycount(@Param("pdmcount") int pdscount,@Param("idx") int idx);

	@Update("update pdtable set pdlcount = ${pdlcount} where idx = ${idx}")
	void setlcountmodifycount(@Param("pdlcount") int pdscount,@Param("idx") int idx);

	@Update("update pdtable set pdxlcount = ${pdxlcount} where idx = ${idx}")
	void setxlcountmodifycount(@Param("pdxlcount") int pdscount,@Param("idx") int idx);

	@Insert("insert into wltable (pdidx, userid, usergender, count, price, mainimg, usersize, buythis) values "
			+ "(#{pdidx}, #{userid}, #{usergender}, #{count}, #{price}, #{mainimg}, #{usersize}, #{buythis})")
	int modifywishlist(WishListDTO dto);

	@Select("select * from wltable where userid = #{userid} and buythis = 1")
	List<WishListDTO> getpurchaselist(@Param("userid") String userid);

	@Update("update wltable set buythis = 0 where userid = #{userid}")
	int resetidset(@Param("userid") String userid);
}
