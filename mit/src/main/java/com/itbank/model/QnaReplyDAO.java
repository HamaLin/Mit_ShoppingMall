package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QnaReplyDAO {

	@Select("select * from qnareply where qnaidx = #{qnaidx} order by idx desc")
	List<QnaReplyDTO> getReply(String idx);
	
	@Insert("insert into qnareply (replywriter, replycontent, qnaidx)"
			+ " values (#{replywriter}, #{replycontent}, #{qnaidx})")
	int qnaReply(QnaReplyDTO dto);
	
	@Delete("delete from qnareply where idx = #{idx}")
	int replyDelete(int idx);
	
	@Update("update qnareply set replycontent = #{replycontent} where idx = #{idx}")
	int replyModify(QnaReplyDTO dto);

}
