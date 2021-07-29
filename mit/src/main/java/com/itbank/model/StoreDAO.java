package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StoreDAO {

	@Insert("insert into pdtable (pdtitle, pdprice, pdcontent, pdcode, pdname, pdcolor, "
			+ "pdimg, pdwriter, mainimg, pdscount, pdmcount, pdlcount, pdxlcount, viewimg) "
			+ "values (#{pdtitle}, #{pdprice}, #{pdcontent}, #{pdcode}, #{pdname}, #{pdcolor}, "
			+ "#{pdimg} , #{pdwriter}, #{mainimg}, #{pdscount}, #{pdmcount}, #{pdlcount}, #{pdxlcount}, #{viewimg})")
	int getInsertItem(StoreDTO dto);
	
	@Select("select count(*) from pdtable where pdtitle = #{pdtitle}")
	int checkTitle(String pdtitle);

	@Select("select * from pdtable order by idx")
	List<StoreDTO> getList();

	@Select("select filename from pdtable_files  where tidx = #{idx}")
	List<String> getfileList(int idx);

	@Select("select * from pdtable where idx = #{idx}")
	StoreDTO SelecOne(int idx);

	@Delete("delete from pdtable where idx = #{idx}")
	int delete(int idx);

	@Update("update pdtable set pdtitle = #{pdtitle}, pdprice = #{pdprice}, pdscount = #{pdscount},"
			+ "pdmcount = #{pdmcount}, pdlcount = #{pdlcount}, pdxlcount = #{pdxlcount},"
			+ "pdname = #{pdname}, pdcolor = #{pdcolor} where idx = #{idx}")
	int getModify(StoreDTO dto);
	
	@Select("select idx, mainimg, pdtitle, pdprice, pdcode, pdwriter from pdtable"
			+ " where pdtitle like '%'||#{search}||'%'"
			+ " or pdname like '%'||#{search}||'%'"
			+ " or pdcolor like '%'||#{search}||'%'"
			+ "")
	List<StoreDTO> searchItems(@Param("search") String search);

	@Insert("insert into wltable (pdidx, userid, usergender, count, price, mainimg, usersize, title, userage) values "
			+ "(#{pdidx}, #{userid}, #{usergender}, #{count}, #{price}, #{mainimg}, #{usersize}, #{title}, #{userage})")
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

	@Insert("insert into wltable (pdidx, userid, usergender, count, price, mainimg, usersize, buythis, "
			+ "title, userage) values "
			+ "(#{pdidx}, #{userid}, #{usergender}, #{count}, #{price}, #{mainimg}, #{usersize}, "
			+ "#{buythis}, #{title}, #{userage})")
	int modifywishlist(WishListDTO dto);

	@Select("select * from wltable where userid = #{userid} and buythis = 1")
	List<WishListDTO> getpurchaselist(@Param("userid") String userid);

	@Update("update wltable set buythis = 0 where userid = #{userid}")
	int resetidset(@Param("userid") String userid);
	
	@Select("select pdidx, sum(count) from buytable group by pdidx order by 2 desc")
	List<BuyTableDTO> bestList();
	
	@Select("select * from pdtable order by pddate desc")
	List<StoreDTO> newList();
	
	@Insert("insert into buytable (pdidx, userid, usergender, total, count, usersize, userinfo, "
			+ "useraddress, userage) "
			+ "values (#{pdidx}, #{userid}, #{usergender}, #{total}, #{count}, #{usersize}, "
			+ "#{userinfo}, #{useraddress}, #{userage})")
	int purchase(BuyTableDTO dto);

	@Delete("delete from wltable where userid = #{userid} and buythis = 1")
	void deletewishlist(@Param("userid") String userid);

	@Select("select * from buytable where pdidx = #{idx}")
	List<BuyTableDTO> getbuylist(@Param("idx") int idx);

	@Insert("insert into writing (writer, wr, scope, img, pdidx) values"
			+ "(#{writer}, #{wr}, #{scope}, #{img}, #{pdidx})")
	int writing(writingDTO dto);
	
	@Select("select * from pdtable where pdcode like '%상의%'")
	List<StoreDTO> topItems();
	
	@Select("select * from pdtable where pdcode like '%하의%'")
	List<StoreDTO> bottomItems();
	
	@Select("select * from pdtable where pdcode like '%모자%'")
	List<StoreDTO> hatItems();
	
	@Select("select * from pdtable where pdcode like '%안경%'")
	List<StoreDTO> glassesItems();
	
	@Select("select * from pdtable where pdcode like '%가방%'")
	List<StoreDTO> backpackItems();

	@Select("select * from pdtable where pdcolor like '%{color}%'")
	List<StoreDTO> colorItems(@Param("color") String color);

	@Select("select * from pdtable where pdprice between #{price} and ( #{price} + 20000 ) ")
	List<StoreDTO> priceItems(@Param("price") int price);
}
