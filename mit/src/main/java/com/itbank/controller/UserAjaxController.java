package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.UserDTO;
import com.itbank.service.Hash;
import com.itbank.service.UserService;

@RestController
@RequestMapping("/user")
public class UserAjaxController {
	 
	@Autowired private UserService us;
	
	@GetMapping("/checkId/")
	public int checkIdNull() {
		return -1;
	}
	
	@GetMapping("/checkId/{userid}/")
	public int checkId(@PathVariable String userid) {
		return us.checkId(userid);
	}
	
	@PostMapping("/userInfo")
	public int userModify(UserDTO dto, HttpSession session) {
		int row = us.userModify(dto);
		if (row == 1) {
			session.invalidate();
		}
		return row;
	}
	
	@PostMapping("/userDelete")
	public int userDelete(UserDTO dto, String password, HttpSession session) {
		String hashUserPw = Hash.getHash(password);
		if(dto.getUserpw().equals(hashUserPw)) {
			session.invalidate();
			return us.userDelete(dto);
		} else {
			return 0;
		}
	}
	
	@PostMapping("/passwordModify")
	public int passwordModify(UserDTO dto, String password) {
		String hashUserPw = Hash.getHash(password);
		if(dto.getUserpw().equals(hashUserPw)) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@PostMapping("/passwordModifyResult")
	public int passwordModifyResult(UserDTO dto, String password, HttpSession session) {
		String hashUserPw = Hash.getHash(password);
		dto.setUserpw(hashUserPw);
		int row = us.passwordModify(dto);
		if (row == 1) {
			session.invalidate();
		}
		return row;
		
	}
	
}
