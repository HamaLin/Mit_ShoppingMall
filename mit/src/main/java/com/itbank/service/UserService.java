package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		if (dto.getImg().isEmpty()) {
			return dao.userModify(dto);
		} 
		else {
			MultipartFile file = dto.getImg();
			
			// 랜덤 파일명 만들기
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString() + "_" + file.getOriginalFilename();
			
			File dest = new File(uploadPath, fileName);	// 파일 객체를 생성
			try {
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
			dto.setUserimg(fileName);
			return dao.userModify_file(dto);
		}
	}

	public int userDelete(UserDTO dto) {
		return dao.userDelete(dto);
	}

	public int checkId(String userid) {
		return dao.checkId(userid);
	}

}
