package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface QnaReplyDAO {

	@Select("select * from qnareply where qnaidx = #{qnaidx} order by idx desc")
	List<QnaReplyDTO> getReply(String idx);
	
	@Insert("insert into qnareply (replywriter, replycontent, qnaidx)"
			+ " values (#{replywriter}, #{replycontent}, #{qnaidx})")
	int qnaReply(QnaReplyDTO dto);

}
