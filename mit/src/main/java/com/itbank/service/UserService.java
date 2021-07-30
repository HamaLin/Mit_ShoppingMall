package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.QnaDTO;
import com.itbank.model.QnaReplyDTO;
import com.itbank.model.UserDAO;
import com.itbank.model.UserDTO;

@Service
public class UserService {
	
	@Autowired private UserDAO dao;
	private final String uploadPath = "C:\\mitImg";
	
	public UserService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public int join(UserDTO dto) {
		return dao.join(dto);
	}

	public UserDTO login(UserDTO dto) {
		return dao.login(dto);
	}

	public int userModify(UserDTO dto) {	
//		// 등록한 파일이 있으면
//		if (!dto.getImg().isEmpty()) {
//			// 이전 프로필 사진이 default.jpg가 아니면 이전 프사는 삭제 
//			if(!dto.getUserimg().equals("default.jpg")) {	
//				// 이전 프사 삭제
//				String oldImgName = dto.getUserimg();
//				File delete = new File(uploadPath, oldImgName);	
//				delete.delete();
//			}
//			// 새로운 프로필 사진으로 업데이트
//			MultipartFile file = dto.getImg();
//			
//			// 랜덤 파일명 만들기
//			UUID uuid = UUID.randomUUID();
//			String fileName = uuid.toString() + "_" + file.getOriginalFilename();
//			
//			// 파일 객체를 생성 후 등록
//			File dest = new File(uploadPath, fileName);	
//			try {
//				file.transferTo(dest);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			} 
//			dto.setUserimg(fileName);
//			return dao.userModify_file(dto);
//		} 
//		// 등록한 파일이 없으면
//		else {
		return dao.userModify(dto);
//		}
	}

	public int userDelete(UserDTO dto) {
		// 탈퇴하면 프로필 사진 삭제  // 단 이전 프로필 사진이 default.jpg가 아닐 때만 삭제
		if(!dto.getUserimg().equals("default.jpg")) {	
			// 이전 프사 삭제
			String oldImgName = dto.getUserimg();
			File delete = new File(uploadPath, oldImgName);	
			delete.delete();
		}
		return dao.userDelete(dto);
	}

	public int checkId(String userid) {
		return dao.checkId(userid);
	}

	public int passwordModify(UserDTO dto) {
		return dao.passwordModify(dto);
	}

	public int findUser(UserDTO dto) {
		return dao.findUser(dto);
	}

	public QnaDTO qnaSelect(int idx) {
		return dao.qnaSelect(idx);
	}

	public UserDTO getReUser(String userid) {
		return dao.getReUser(userid);
	}

	public int cartDelete(String idx) {
		return dao.cartDelete(idx);
	}

	public int addOrder(String idx) {
		return dao.addOrder(idx);
	}

	public int insertNaver(UserDTO naverUser) {
		return dao.insertNaver(naverUser);
	}

	public int checkNaver(String userid) {
		return dao.checkNaver(userid);
	}

	public UserDTO loginNaver(String userid) {
		return dao.loginNaver(userid);
	}
		
}

