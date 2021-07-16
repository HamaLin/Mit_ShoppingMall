package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StoreDAO {

	@Insert("insert into pdtable (pdtitle, pdprice, pdcount, pdcontent, pdcode, pdname, pdcolor, pdimg, pdwriter) "
			+ "values (#{pdtitle}, #{pdprice}, #{pdcount}, #{pdcontent}, #{pdcode}, #{pdname}, #{pdcolor}, #{pdimg} , #{pdwriter})")
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
}
