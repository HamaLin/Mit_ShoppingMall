package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
import com.itbank.service.ToSftpService;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;

@RestController
@RequestMapping("/store")
public class StoreAjaxController {

	@Autowired private StoreService ss;
	@Autowired private ToSftpService tss;
	
	@PostMapping("/writeItem")
	public int write(StoreDTO dto) throws IllegalStateException, IOException, JSchException, SftpException {
		List<MultipartFile> files = dto.getFiles();
		
		if (files.get(0).getSize() == 0) {
	         dto.setPdimg("");
	         dto.setViewimg("");
	         return ss.getInsert(dto);
	    }
		
		String fileName = "";
	    String viewimgname = "";
	    List<String> viewimglist = dto.getViewimglist();
	      
		for(MultipartFile f : dto.getFiles()) {
			if(f.getSize() == 0) {
	            break;
	         }
			UUID uuid = UUID.randomUUID();
	        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	        
			if(dto.getMainimg().equals(f.getOriginalFilename())) {
	        	 dto.setMainimg(fileName2);
	         }
	         for(String s : viewimglist) {
	        	 if(s.equals(f.getOriginalFilename())) {
	        		 viewimgname += fileName2 + ",";
	        		 break;
	        	 }
	         }
	         File dest = new File(fileName2);
	         f.transferTo(dest);
	         String s = tss.transferToServer(dest);
	         if(s == null) {
	        	 return 0;
	         }
	         fileName += fileName2 + ",";
		}
		dto.setViewimg(viewimgname);
	    dto.setPdimg(fileName);
		
		int row = ss.getInsert(dto);
		return (row >= 1) ? 1 : 0;
	}
	
	@GetMapping("/getinfo/{idx}")
	public StoreDTO getinfo(@PathVariable int idx) throws IllegalStateException, IOException, JSchException, SftpException{
		return ss.selectOne(idx);
	}
	
	@GetMapping("/GetItems")
	public List<StoreDTO> getItems() throws IllegalStateException, IOException, JSchException, SftpException{
		return ss.getList();
	}
	
	@DeleteMapping("/deleteitem/{idx}")
	public int delete(@PathVariable int idx) throws IllegalStateException, IOException, JSchException, SftpException{
		return ss.delete(idx);
	}
	
	@GetMapping("/showitem/{idx}")
	public StoreDTO showitem(@PathVariable int idx) throws IllegalStateException, IOException, JSchException, SftpException{
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
	public List<StoreDTO> SearchItems(@PathVariable String search) throws JSchException, SftpException, IOException {
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
	public List<writingDTO> getreply(@PathVariable int idx)throws JSchException, SftpException, IOException {
		List<writingDTO> list = ss.getreplylist(idx);
		return list;
	}
	
	@GetMapping("/BestItems")
	public List<StoreDTO> bestItems() throws JSchException, SftpException, IOException {
		return ss.bestItems();
	}
	
	@GetMapping("/NewItems")
	public List<StoreDTO> newItems() throws JSchException, SftpException, IOException {
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
	public int writing(writingDTO dto) throws IllegalStateException, IOException, JSchException, SftpException{
		List<MultipartFile> files = dto.getWritingfiles();
		
		if (files == null) {
			dto.setImg("");
		    return ss.insert(dto);
	    }
		
		String fileName = "";
	      
		for(MultipartFile f : files) {
			if(f.getSize() == 0) {
	            break;
	         }
			
			UUID uuid = UUID.randomUUID();
	        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	        
	        File dest = new File(fileName2);
	        f.transferTo(dest);
	         
	        String s = tss.transferToServer(dest);
	        if(s == null) {
	        	return 0;
	        }
	        fileName = fileName2;
		}
		dto.setImg(fileName);
		return ss.insert(dto);
	}
	
	@GetMapping("/TopItems")
	public List<StoreDTO> topItems() throws JSchException, SftpException, IOException {
		return ss.topItems();
	}
	
	@GetMapping("/BottomItems")
	public List<StoreDTO> bottomItems() throws JSchException, SftpException, IOException {
		return ss.bottomItems();
	}
	
	@GetMapping("/HatItems")
	public List<StoreDTO> hatItems() throws JSchException, SftpException, IOException {
		return ss.hatItems();
	}
	
	@GetMapping("/GlassesItems")
	public List<StoreDTO> glassesItems() throws JSchException, SftpException, IOException {
		return ss.glassesItems();
	}
	
	@GetMapping("/BackpackItems")
	public List<StoreDTO> backpackItems() throws JSchException, SftpException, IOException {
		return ss.backpackItems();
	}
	
	@PostMapping("/modifyreply")
	public int modifyreply(writingDTO dto) throws IllegalStateException, IOException, JSchException, SftpException{
		List<MultipartFile> files = dto.getWritingfiles();
		
		if (files == null) {
		    dto.setImg("");
		    return ss.modifyreply(dto);
		}
		
		String fileName = "";
	      
		for(MultipartFile f : files) {
			if(f.getSize() == 0) {
	            break;
	         }
			
			UUID uuid = UUID.randomUUID();
	        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	        
	        File dest = new File(fileName2);
	        f.transferTo(dest);
	         
	        String s = tss.transferToServer(dest);
	        if(s == null) {
	        	return 0;
	        }
	        fileName = fileName2;
		}
		dto.setImg(fileName);
		
		return ss.modifyreply(dto);
	}
	
	@DeleteMapping("/deletereply/{idx}")
	public int deletereply(@PathVariable int idx) {
		return ss.deletereply(idx);
	}
	
	
	
	@GetMapping("/colorItems/{color}")
	public List<StoreDTO> colorItems(@PathVariable String color) throws JSchException, SftpException, IOException {
		return ss.colorItems(color);
	}
	
	@GetMapping("/priceItems/{price}")
	public List<StoreDTO> priceItems(@PathVariable int price) throws JSchException, SftpException, IOException {
		return ss.priceItems(price);
	}
	
}
