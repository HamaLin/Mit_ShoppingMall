package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.StoreDAO;
import com.itbank.model.StoreDTO;

@Service
public class StoreService {
	
	@Autowired private StoreDAO dao;
	
	private final String uploadPath = "C:\\mitImg";
	
	public StoreService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	

	public List<StoreDTO> getList() {
		List<StoreDTO> list = dao.getList();
		for(StoreDTO dto : list) {
			if(dto.getPdimg() != null){
				ArrayList<String> list2 = new ArrayList<String>();
				String imgString = dto.getPdimg();
				
				for(int i = 0; i < imgString.length()-1 ; i++) {
					list2.add(imgString.substring(0,dto.getPdimg().indexOf(",")));
					imgString = imgString.substring(dto.getPdimg().indexOf(",") + 1);
				}
				dto.setFilename(list2);
			}
		}
		return list;
	}
	
	// +================================+

	public int getInsert(StoreDTO dto) {
		
		List<MultipartFile> files = dto.getFiles();
		
		if (files.get(0).getSize() == 0) {
			dto.setPdimg("");
			return dao.getInsertItem(dto);
		}
		
		// id이름에 따라서 폴더 생성
		String newdir = uploadPath + "\\" + dto.getPdcolor();
		String fileName = "";
		
		for (MultipartFile f : files) {
			UUID uuid = UUID.randomUUID();
	        String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
			
//			String fileName = f.getOriginalFilename();
			File dest = new File(newdir, fileName2);	// 파일 객체를 생성
			fileName += fileName2 + ",";
			if(dest.exists() == false) {
				dest.mkdirs();
			}
			try {
				f.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
				
		}
		
		dto.setPdimg(fileName);
		int row = dao.getInsertItem(dto);
		return row;
		
	}


	public List<String> getfileList(int idx) {
		return dao.getfileList(idx);
	}


	public StoreDTO selectOne(int idx) {
		StoreDTO dto = dao.SelecOne(idx);
		if (dto.getPdimg() != null) {
			ArrayList<String> list2 = new ArrayList<String>();
			String imgString = dto.getPdimg();
			for (int i = 0; i < imgString.length(); i++) {
				list2.add(imgString.substring(0, dto.getPdimg().indexOf(",")));
				imgString = imgString.substring(dto.getPdimg().indexOf(",") + 1);
			}
			dto.setFilename(list2);
		}
		return dto;
	}


	public int delete(int idx) {
		StoreDTO dto = selectOne(idx);
		String newdir = uploadPath + "\\" + dto.getPdcolor();
		File delfolder = new File(newdir);
		
		File[] delfolderList = delfolder.listFiles();
		for(int i = 0; i< delfolderList.length ; i++) {
			delfolderList[i].delete();
		}
		
		delfolder.delete();
		return dao.delete(idx);
	}


	public int getModify(StoreDTO dto) {
		
		if (dto.getFiles().isEmpty()) {
			dto.setPdimg("");
			return dao.getModify(dto);
		}
		String newdir = uploadPath + "\\" + dto.getIdx();
		
		List<MultipartFile> files = dto.getFiles();
		for (MultipartFile f : files) {			
			UUID uuid = UUID.randomUUID();
	        String fileName = uuid.toString() + "_" + f.getOriginalFilename();
	        File dest = new File(newdir, fileName);	// 파일 객체를 생성
			if(dest.exists() == false) {
				dest.mkdirs();
			}
				try {
					f.transferTo(dest);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				} 	
		}
		
		String fileName = "";
		
		for (MultipartFile f : files) {	
			fileName += f.getOriginalFilename() + ",";
		}
		
		dto.setPdimg(fileName);
		int row = dao.getModify(dto);
		return row;
	}

}
