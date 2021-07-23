package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QnaDAO {
	
	@Insert("insert into qnatable (qnawriter,qnamenu, qnatitle, qnacontent, qnaimg, qnaproductidx)"
			+ " values (#{qnawriter}, #{qnamenu}, #{qnatitle}, #{qnacontent}, #{qnaimg}, #{qnaproductidx})")
	int qnaWrite(QnaDTO dto);
	

	@Select("select * from qnatable where QNAPRODUCTIDX = #{QNAPRODUCTIDX} order by idx desc")
	List<QnaDTO> getqnalist(int QNAPRODUCTIDX);

	@Select("select * from qnatable where qnawriter = #{userid} order by idx desc")
	List<QnaDTO> myqnalist(String userid);

	@Delete("delete from qnatable where idx = #{idx}")
	int qnaDelete(String idx);

	@Select("select * from qnatable where idx = #{idx}")
	QnaDTO selectQna(String idx);

	@Update("update qnatable set qnatitle = #{qnatitle}, "
			+ "qnacontent = #{qnacontent}, qnaimg = #{qnaimg}, qnamenu = #{qnamenu} "
			+ "where idx = #{idx}")
	int qnaModify(QnaDTO dto);

	@Select("select * from qnatable order by idx desc")
	List<QnaDTO> getqnaAll();

	@Update("update qnatable set qnaresult = '답변 완료' where idx = #{qnaidx}")
	int statusChange(int qnaidx);

}
