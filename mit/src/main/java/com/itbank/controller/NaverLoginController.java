package com.itbank.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired private UserService us;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/user/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "user/login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/user/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); 
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		// userDTO 생성
		String birthyear = (String)response_obj.get("birthyear");
		String birthday = (String)response_obj.get("birthday");
		String birthday2 = birthday.replace("-", "");
		String birth = birthyear+birthday2;
		
		String userid = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		
		String phoneNumber = (String)response_obj.get("mobile");
		String pnum = phoneNumber.replace("-", "");
		
		String gender = (String)response_obj.get("gender");
		if(gender.equals("F")) {
			gender = "여";
		}else {
			gender = "남";
		}
		
		UserDTO naverUser = new UserDTO();
		naverUser.setUserid(userid);
		naverUser.setUsermail(userid);
		naverUser.setUsername(name);
		naverUser.setUserbirth(birth);
		naverUser.setUserphone(pnum);
		naverUser.setUsergender(gender);
		
		int naverNotEmpty = us.checkNaver(naverUser.getUserid());
		
		if (naverNotEmpty == 0) {
			int row = us.insertNaver(naverUser);	// 회원 가입
		} 
		
		// MIT에 로그인 시켜주기
		UserDTO login = us.loginNaver(naverUser.getUserid());
		
		// 세션 생성
		session.setAttribute("login", login); 
		model.addAttribute("naverUser", "naverUser");
		model.addAttribute("result", apiResult);
		
		return "user/login";
	}
		
}

