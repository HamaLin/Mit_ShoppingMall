package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.QnaDAO;
import com.itbank.model.QnaDTO;
import com.itbank.model.QnaReplyDAO;
import com.itbank.model.QnaReplyDTO;

@Service
public class QnaService {
	
	@Autowired QnaDAO dao;
	@Autowired QnaReplyDAO replyDao;
	
	private final String uploadPath = "C:\\mitImg";
	
	public QnaService() {
      File dir = new File(uploadPath);
      if(dir.exists() == false) {
         dir.mkdirs();
      }
   }
	   
	public int qnaWrite(QnaDTO dto) {
		List<MultipartFile> files = dto.getFiles();
	      
	      if (files.get(0).getSize() == 0) {	// 파일이 없으면
	    	  dto.setQnaimg("");
		      return dao.qnaWrite(dto);
	      }
	      
	      // 문의글 글쓴이 폴더 생성
	      String newdir = uploadPath + "\\" + dto.getQnawriter();
	      String fileName = "";
	      
	      for (MultipartFile f : files) {
	         if(f.getSize() == 0) {
	            break;
	         }
	         
	        // 랜덤 파일명 
			UUID uuid = UUID.randomUUID();
			String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	       
	         File dest = new File(newdir, fileName2);   // 파일 객체를 생성
	         fileName += fileName2 + ",";
	         
	         if(dest.exists() == false) {
	            dest.mkdirs();
	         }
	         try {
	            f.transferTo(dest);
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         } 
	            
	      }
	      
	      dto.setQnaimg(fileName);
	      return dao.qnaWrite(dto);
	}

	public List<QnaDTO> myqnalist(String userid) {
		return dao.myqnalist(userid);
	}

	public int qnaDelete(String idx) {
		return dao.qnaDelete(idx);
	}

	public int qnaModify(QnaDTO dto) {
		List<MultipartFile> files = dto.getFiles();
	      
		  // 파일이 없으면
	      if (files.get(0).getSize() == 0) {	
		      return dao.qnaModify(dto);
	      }
	      
	      // 새로 등록한 사진 넣어주기
	      String newdir = uploadPath + "\\" + dto.getQnawriter();
	      String fileName = "";
	      
	      for (MultipartFile f : files) {
	         if(f.getSize() == 0) {
	            break;
	         }
	         
	        // 랜덤 파일명 
			UUID uuid = UUID.randomUUID();
			String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	       
	         File dest = new File(newdir, fileName2);   // 파일 객체를 생성
	         fileName += fileName2 + ",";
	         
	         if(dest.exists() == false) {
	            dest.mkdirs();
	         }
	         try {
	            f.transferTo(dest);
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         } 
	            
	      }
	      dto.setQnaimg(fileName);
	      
	      return dao.qnaModify(dto);
	}

	public List<QnaReplyDTO> getReply(String idx) {
		return replyDao.getReply(idx);
	}

	public int qnaReply(QnaReplyDTO dto) {
		int row = dao.statusChange(dto.getQnaidx());
		if (row != 1) {
			return 0;
		}
		return replyDao.qnaReply(dto);
	}

	public List<QnaDTO> getqnaAll() {
		return dao.getqnaAll();
	}

	
}
