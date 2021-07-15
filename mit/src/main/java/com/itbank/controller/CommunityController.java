package com.itbank.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.CommunityDTO;
import com.itbank.service.CommnuityService;;

@Controller
@RequestMapping("/community")
public class CommunityController {

@Autowired CommnuityService ct;
	
	
	@GetMapping("/writing")
	public void writing() {}
	
	@PostMapping("/writing")
	public String insert(CommunityDTO dto) {
		int row=ct.insert(dto);
		return "com";
	}
	
	@GetMapping("/com")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView("/community/com");
		List<CommunityDTO>list=new ArrayList<CommunityDTO>();
		list=ct.list();
		mav.addObject("list",list);
		return mav;
	}
	
}
