package com.itbank.model;

import org.apache.ibatis.annotations.Insert;

public interface QnaDAO {
	
	@Insert("insert into qnatable (qnawriter,qnamenu, qnatitle, qnacontent)"
			+ " values (#{qnawriter}, #{qnamenu}, #{qnatitle}, #{qnacontent})")
	int qnaWrite(QnaDTO dto);

}
