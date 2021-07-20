package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.StoreDTO;
import com.itbank.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired private StoreService ss;
	
	@GetMapping("/store")
	public void store() {}
	
	@GetMapping("/writeItem")
	public void writeItem() {}
	
	@GetMapping("/storeDetale")
	public String gotopage() {
//		ModelAndView mav = new ModelAndView("/store/storeDetale");
//		StoreDTO dto = ss.selectOne(idx);
//		List<String> imgname = dto.getFilename();
//		mav.addObject("test", dto);
//		mav.addObject("imgname", imgname);
		return "/store/storeDetale";
	}
	@GetMapping("/storeSearch")
    public void storeSearch() {}
}
