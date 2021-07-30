package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.BuyTableDTO;
import com.itbank.model.QnaDAO;
import com.itbank.model.QnaDTO;
import com.itbank.model.QnaReplyDAO;
import com.itbank.model.QnaReplyDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.WishListDTO;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;

@Service
public class QnaService {
	
	@Autowired QnaDAO dao;
	@Autowired QnaReplyDAO replyDao;
	@Autowired private ToSftpService tss;
		   
	public int qnaWrite(QnaDTO dto) throws IllegalStateException, IOException, JSchException, SftpException {
		  
		List<MultipartFile> files = dto.getFiles();
	      
	      if (files.get(0).getSize() == 0) {	// 파일이 없으면
	    	  dto.setQnaimg("");
		      return dao.qnaWrite(dto);
	      }
			
			String fileName = "";
		      
			for(MultipartFile f : files) {
				if(f.getSize() == 0) {
		            break;
		         }
				
				UUID uuid = UUID.randomUUID();
		        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
		        
		        File dest = new File(fileName2);
		        f.transferTo(dest);
		         
		        String s = tss.transferToServer(dest);
		        if(s == null) {
		        	return 0;
		        }
		        fileName = fileName2;
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

	public int qnaModify(QnaDTO dto) throws IllegalStateException, IOException, JSchException, SftpException {
		List<MultipartFile> files = dto.getFiles();
	      
		  // 파일이 없으면
	      if (files.get(0).getSize() == 0) {	
		      return dao.qnaModify(dto);
	      }
	      
	      String fileName = "";
	       
	      for (MultipartFile f : files) {
	         if(f.getSize() == 0) {
	            break;
	         }
	         
	         if(f.getSize() == 0) {
		            break;
		         }
				
				UUID uuid = UUID.randomUUID();
		        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
		        
		        File dest = new File(fileName2);
		        f.transferTo(dest);
		         
		        String s = tss.transferToServer(dest);
		        if(s == null) {
		        	return 0;
		        }
		        fileName = fileName2;   
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

	public int replyDelete(int idx, int qnaidx) {
		int row = dao.statusReturn(qnaidx);
		if (row != 1) {
			return 0;
		}
		return replyDao.replyDelete(idx);
	}

	public StoreDTO getProduct(int pdidx) {
		return dao.getProduct(pdidx);
	}

	public int replyModify(QnaReplyDTO dto) {
		return replyDao.replyModify(dto);
	}

	public List<WishListDTO> getMyCart(String userid) {
		return dao.getMyCart(userid);
	}

	public List<BuyTableDTO> getMyOrder(String userid) {
		return dao.getMyOrder(userid);
	}

	
}
