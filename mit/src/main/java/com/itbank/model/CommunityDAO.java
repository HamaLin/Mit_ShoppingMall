package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CommunityDAO {

	@Insert("insert into cmtable (cmtitle,cmwriter,writerimg,cmcontent)values"
			+ "(#{cmtitle},#{cmwriter},#{writerimg},#{cmcontent})")
	int insert(CommunityDTO dto);
	
	@Select("select max(idx) from cmtable")
	int selectMaxIdx();

	@Insert("insert into cmtable_files (tidx, filename) values (#{tidx}, #{filename})")
	int insertImage(@Param("tidx") int maxIdx, @Param("filename") String filename);

	@Select("select * from cmtable order by idx desc")
	List<CommunityDTO> list();
}
