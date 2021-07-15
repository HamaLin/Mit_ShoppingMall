package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.UserDTO;
import com.itbank.service.Hash;
import com.itbank.service.MailService;
import com.itbank.service.UserService;

@RestController
public class MailController {
	
	@Autowired private MailService mailService;
	@Autowired private UserService us;
	
	@GetMapping("/mailto/{mailAddress}/{userid}")
	public String mailto(@PathVariable String mailAddress, @PathVariable String userid, HttpSession session) throws IOException {
		UserDTO dto = new UserDTO();
		dto.setUserid(userid);

		// 임시 비밀번호 만들기
		String authNumber = mailService.getAuthNumber();

		// 임시 비밀번호 해시처리 -> db에 비밀번호 변경해주기
		String hashNumber = Hash.getHash(authNumber);
		dto.setUserpw(hashNumber);
		us.passwordModify(dto);
		
		String account = null;
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			return "메일 전송에 필요한 계정 정보를 찾을 수 없습니다.";
		}
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
			
		String result = mailService.sendMail(mailAddress, authNumber, account);
		
		if(result.equals(authNumber)) {	// 정상적으로 메일을 발송했다면 인증번호가 반환되어 브라우저에게 hash값을 전달한다.
			return hashNumber;
		}
		else {
			return result;				// 아니라면 상태를 알리는 문자열 메시지를 반환한다.
		}
	
	}
}
