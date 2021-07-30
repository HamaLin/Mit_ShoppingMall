package com.itbank.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.QnaDTO;
import com.itbank.model.UserDTO;
import com.itbank.service.Hash;
import com.itbank.service.ToSftpService;
import com.itbank.service.UserService;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired private UserService us;
	@Autowired private ToSftpService tss;
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@GetMapping("/mypage")
	public void mypage() {}
	
	@GetMapping("/qna")
	public void qna() {}
	
	@GetMapping("/passwordModify")
	public void passwordModify() {}
	
	@GetMapping("/passwordFind")
	public void passwordFind() {}
	
	@GetMapping("/passwordModifyResult")
	public void passwordModifyResult() {}
	
	@GetMapping("/userDelete")
	public void userDelete() {}
	
	@GetMapping("/userInfo")
	public void userInfo() {}
	
	@PostMapping("/join")
	public ModelAndView join(ModelAndView mav, UserDTO dto, String userbirth_1, String userbirth_2, String userbirth_3 ) {
		int row = 0;
		// 생년월일 8자리로 만들기
		dto.setUserbirth(userbirth_1+userbirth_2+userbirth_3);
		
		// 비밀번호 해쉬처리
		String hashUserPw = Hash.getHash(dto.getUserpw());
		dto.setUserpw(hashUserPw);
		
		row =  us.join(dto);
		mav.setViewName("user/join");
		mav.addObject("row", row);
		return mav;
	}
	
	@PostMapping("/login")
	   public String login(Model model, UserDTO dto, HttpSession session) throws JSchException, SftpException, IOException {
	      
	      if(dto.getUserid().length() <= 4) {   // 아이디가 4글자 이하이면 관리자
	         UserDTO adminLogin =  us.login(dto);
	         if(adminLogin != null) {
	            model.addAttribute("loginResult", 1);         
	         }else {
	            model.addAttribute("loginResult", 0);
	         }
	         session.setAttribute("admin", adminLogin);
	         return "user/login";
	         
	      } else { // 아이디가 5글자 이상이면 일반 유저
	         // 로그인 창에서 입력한 비밀번호 해쉬로 만들기
	         String hashUserPw = Hash.getHash(dto.getUserpw());
	         dto.setUserpw(hashUserPw);
	         
	         UserDTO login =  us.login(dto);
	         if(login != null) {
	            model.addAttribute("loginResult", 1);         
	            login.setUserimg(tss.getimgToServer(login.getUserimg()));
	         }else {
	            model.addAttribute("loginResult", 0);
	         }
	         
	         session.setAttribute("login", login);
	         return "user/login";
	      }
	      
	   }
	
	@GetMapping("/qna/{idx}")
	public ModelAndView qnaSelect(@PathVariable int idx,ModelAndView mav) throws JSchException, SftpException, IOException {
		QnaDTO qna = us.qnaSelect(idx);
		if (qna.getQnaimg() != null) {
			String[] imgs = qna.getQnaimg().split(",");
			ArrayList<String> imglist= new ArrayList<String>();
			for(String s : imgs) {
				imglist.add(tss.getimgToServer(s));
			}
			mav.addObject("imgs", imglist);
		}
		mav.setViewName("user/qnaDetail");
		mav.addObject("qna", qna);
		return mav;
	}
	
	@GetMapping("/qnaModify/{idx}")
	public ModelAndView qnaModify(@PathVariable int idx,ModelAndView mav) {
		QnaDTO qna = us.qnaSelect(idx);
		// 줄바꿈 처리
		qna.setQnacontent(qna.getQnacontent().replace("<br>", "\r\n"));
		mav.setViewName("user/qnaModify");
		mav.addObject("qna", qna);
		return mav;
	}
	
}
