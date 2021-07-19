package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.QnaDAO;
import com.itbank.model.QnaDTO;

@Service
public class QnaService {
	
	@Autowired QnaDAO dao;

	public int qnaWrite(QnaDTO dto) {
		return dao.qnaWrite(dto);
	}

}
