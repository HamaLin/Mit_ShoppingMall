package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface QnaDAO {
	
	@Insert("insert into qnatable (qnawriter,qnamenu, qnatitle, qnacontent, qnaimg, qnaproductidx)"
			+ " values (#{qnawriter}, #{qnamenu}, #{qnatitle}, #{qnacontent}, #{qnaimg}, #{qnaproductidx})")
	int qnaWrite(QnaDTO dto);
	

	@Select("select * from qnatable where QNAPRODUCTIDX = #{QNAPRODUCTIDX} order by qnadate desc")
	List<QnaDTO> getqnalist(int QNAPRODUCTIDX);

}
