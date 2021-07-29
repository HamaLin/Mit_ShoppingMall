package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.BuyTableDTO;
import com.itbank.model.QnaDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.WishListDTO;
import com.itbank.model.writingDAO;
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
	
	@GetMapping("/checktitle/{pdtitle}")
	public int checktitle(@PathVariable String pdtitle) {
		return ss.checktitle(pdtitle);
	}
	
	@GetMapping("/SearchItems/{search}")
	public List<StoreDTO> SearchItems(@PathVariable String search) {
		return ss.searchItems(search);
	}
	
	@PostMapping("/insertwishlist")
	public int writing(WishListDTO dto) {
		int row = ss.wishInsert(dto);
		return row;
	}
	
	@PostMapping("/modifywishlist")
	public int modifywishlist(WishListDTO dto) {
		
		return ss.modifywishlist(dto);
	}
	
	@GetMapping("/showmethepurchase")
	public List<WishListDTO> purchaselist(@RequestParam("userid") String userid) {	
		List<WishListDTO> list = ss.getpurchaselist(userid);
		return list;
	}
	
	@PostMapping("/reset/{userid}")
	public int reset(@PathVariable String userid) {
		int row = ss.resetidset(userid);
		System.out.println(row);
		return row;
	}
	
	@GetMapping("/getQna/{idx}")
	public List<QnaDTO> getQna(@PathVariable int idx) {
		List<QnaDTO> list = ss.getqnalist(idx);
		return list;
	}
	@GetMapping("/getreply/{idx}")
	public List<writingDTO> getreply(@PathVariable int idx) {
		List<writingDTO> list = ss.getreplylist(idx);
		return list;
	}
	
	@GetMapping("/BestItems")
	public List<StoreDTO> bestItems() {
		return ss.bestItems();
	}
	
	@GetMapping("/NewItems")
	public List<StoreDTO> newItems() {
		return ss.newItems();
	}
	
	@PostMapping("/purchase")
	public int purchase(BuyTableDTO dto){
		return ss.purchase(dto);
	}
	@GetMapping("/buytablelist/{idx}")
	public List<BuyTableDTO> buytablelist(@PathVariable int idx) {
		return ss.getbuylist(idx);
	}
	
	@PostMapping("/writing")
	public int writing(writingDTO dto) {
		return ss.insert(dto);
	}
	
	@GetMapping("/TopItems")
	public List<StoreDTO> topItems() {
		return ss.topItems();
	}
	
	@GetMapping("/BottomItems")
	public List<StoreDTO> bottomItems() {
		return ss.bottomItems();
	}
	
	@GetMapping("/HatItems")
	public List<StoreDTO> hatItems() {
		return ss.hatItems();
	}
	
	@GetMapping("/GlassesItems")
	public List<StoreDTO> glassesItems() {
		return ss.glassesItems();
	}
	
	@GetMapping("/BackpackItems")
	public List<StoreDTO> backpackItems() {
		return ss.backpackItems();
	}
	
	@PostMapping("/modifyreply")
	public int modifyreply(writingDTO dto) {
		return ss.modifyreply(dto);
	}
	
	@DeleteMapping("/deletereply/{idx}")
	public int deletereply(@PathVariable int idx) {
		return ss.deletereply(idx);
	}
	
	@GetMapping("/colorItems/{color}")
	public List<StoreDTO> colorItems(@PathVariable String color) {
		return ss.colorItems(color);
	}
	
	@GetMapping("/priceItems/{price}")
	public List<StoreDTO> priceItems(@PathVariable int price) {
		return ss.priceItems(price);
	}
	
}
