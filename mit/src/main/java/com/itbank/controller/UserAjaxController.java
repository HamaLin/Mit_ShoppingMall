package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BuyTableDTO;
import com.itbank.model.QnaDTO;
import com.itbank.model.QnaReplyDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.UserDTO;
import com.itbank.model.WishListDTO;
import com.itbank.service.Hash;
import com.itbank.service.QnaService;
import com.itbank.service.UserService;

@RestController
@RequestMapping("/user")
public class UserAjaxController {
	 
	@Autowired private UserService us;
	@Autowired private QnaService qs;
	
	@GetMapping("/checkId/")
	public int checkIdNull() {
		return -1;
	}
	
	@GetMapping("/checkId/{userid}/")
	public int checkId(@PathVariable String userid) {
		return us.checkId(userid);
	}
	
	@PostMapping("/userInfo")
	public int userModify(UserDTO dto, String postcode, String address, HttpSession session) {
		dto.setUseraddress(postcode+"/"+address);
		
		int row = us.userModify(dto);
		if (row == 1) {
			session.setAttribute("login", us.getReUser(dto.getUserid()));
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
	
	@PostMapping("/passwordFind")
	public int passwordFind(UserDTO dto) {
		// 입력한 정보로 회원 조회 
		int row = us.findUser(dto);	
			
		return row;
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
	
	@PostMapping("/qnaWrite")
	public int qnaWrite(QnaDTO dto) {
		// 줄바꿈 처리
		dto.setQnacontent(dto.getQnacontent().replace("\r\n", "<br>"));
		int row = 0;
		row =  qs.qnaWrite(dto);
		return row;
	}
	
	@PostMapping("/qnaReply")
	public int qnaReply(QnaReplyDTO dto) {
		int row = 0;
		row =  qs.qnaReply(dto);
		return row;
	}
	
	@GetMapping("/getQnaList")
	public List<QnaDTO> getqnaAll() {
		List<QnaDTO> qna = qs.getqnaAll();
		return qna;
	}

	@GetMapping("/getQnaList/{userid}/")
	public List<QnaDTO> SearchItems(@PathVariable String userid) {
		List<QnaDTO> list = qs.myqnalist(userid);
		return list;
	}
	
	@GetMapping("/getReply/{idx}")
	public List<QnaReplyDTO> getReply(@PathVariable String idx) {
		List<QnaReplyDTO> list = qs.getReply(idx);
		return list;
	}
	
	@GetMapping("/replyDelete/{idx}/{qnaidx}")
	public int replyDelete(@PathVariable int idx, @PathVariable int qnaidx) {
		int row = 0;
		row =  qs.replyDelete(idx, qnaidx);
		return row;
	}
	
	@PostMapping("/replyModify")
	public int replyModify(QnaReplyDTO dto) {
		int row = 0;
		row =  qs.replyModify(dto);
		return row;
	}
	
	@DeleteMapping("/qnaDelete/{idx}")
	public int qnaDelete(@PathVariable String idx) {
		int row = 0;
		row =  qs.qnaDelete(idx);
		return row;
	}
	
	@PostMapping("/qnaModify")
	public int qnaModify(QnaDTO dto) {
		// 줄바꿈 처리
		dto.setQnacontent(dto.getQnacontent().replace("\r\n", "<br>"));
		int row = 0;
		row = qs.qnaModify(dto);
		return row;
	}
	
	@GetMapping("/getProduct/{pdidx}")
	public HashMap<String, Object> getProduct(@PathVariable int pdidx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		StoreDTO product = qs.getProduct(pdidx);
		if(product == null) {
			Integer a = new Integer(0);
			map.put("nullcheck", a);
			return map;
		} 
		else {
			Integer a = new Integer(1);
			map.put("nullcheck", a);
			map.put("product", product);
			return map;
		}
		
	}
	
	@GetMapping("/getmyCart/{userid}/")
	public List<WishListDTO> getProduct(@PathVariable String userid) {
		List<WishListDTO> cartList = qs.getMyCart(userid);
		return cartList;
	}
	
	@GetMapping("/getMyOrder/{userid}/")
	public List<BuyTableDTO> getMyOrder(@PathVariable String userid) {
		List<BuyTableDTO> orderList = qs.getMyOrder(userid);
		return orderList;
	}
	
	@PostMapping("/cartDelete")
	public int cartDelete(@RequestBody String[] checkedArr) {
		int row = 0;
		for(int i = 0; i < checkedArr.length; i++) {
			row += us.cartDelete(checkedArr[i]);
		}
		if (row == checkedArr.length) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@PostMapping("/addOrder")
	public int addOrder(@RequestBody String[] checkedArr) {
		int row = 0;
		for(int i = 0; i < checkedArr.length; i++) {
			row += us.addOrder(checkedArr[i]);
		}
		if (row == checkedArr.length) {
			return 1;
		}else {
			return 0;
		}
	}
	
}
