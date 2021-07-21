package com.itbank.controller;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.BuyTableDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.WishListDTO;
import com.itbank.model.writingDTO;
import com.itbank.service.StoreService;

@RestController
@RequestMapping("/store")
public class StoreAjaxController {

	@Autowired private StoreService ss;
	
	@PostMapping("/writeItem")
	public int write(StoreDTO dto) {
		int row = ss.getInsert(dto);
		return (row >= 1) ? 1 : 0;
	}
	
	@GetMapping("/getinfo/{idx}")
	public StoreDTO getinfo(@PathVariable int idx) {
		return ss.selectOne(idx);
	}
	
	@GetMapping("/GetItems")
	public List<StoreDTO> getItems() {
		return ss.getList();
	}
	
	@DeleteMapping("/deleteitem/{idx}")
	public int delete(@PathVariable int idx) {
		return ss.delete(idx);
	}
	
	@GetMapping("/showitem/{idx}")
	public StoreDTO showitem(@PathVariable int idx) {
		return ss.selectOne(idx);
	}
	
	@PostMapping("/modifyItem")
	public int modify(StoreDTO dto) {
		int row = ss.getModify(dto);
		return (row >= 1) ? 1 : 0;
	}
	@GetMapping("/SearchItems/{search}")
	public List<StoreDTO> SearchItems(@PathVariable String search) {
		return ss.searchItems(search);
	}
	
	@PostMapping("/insertwishlist")
	public int writing(WishListDTO dto) {
		int row = ss.wishInsert(dto);
		System.out.println(row);
		return row;
	}
	
	@GetMapping("/showmethepurchase")
	public BuyTableDTO purchase(@RequestParam("idx") int idx, @RequestParam("count") int count,
			@RequestParam("usersize") String usersize, @RequestParam("userid") String userid,
			@RequestParam("usergender") String usergender, @RequestParam("userage") int userage) {

		BuyTableDTO dto = new BuyTableDTO();
		
		dto.setPdidx(idx);
		dto.setCount(count);
		dto.setUserage(userage + "세");
		dto.setUsergender(usergender);
		dto.setUserid(userid);
		dto.setUsersize(usersize);
		return dto;
	}
	
}
