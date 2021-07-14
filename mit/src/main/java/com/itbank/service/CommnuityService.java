package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.CommunityDAO;
import com.itbank.model.CommunityDTO;


@Service
public class CommnuityService {
	
	@Autowired CommunityDAO dao;
	
	private final String uploadPath="C:\\upload";
		
		public CommnuityService() {
			File dir=new File(uploadPath);
			if(dir.exists()== false) {
				dir.mkdir();
				System.out.println("업로드 폴더 생성");
			}
		}

		
		public int insert(CommunityDTO dto) {
					
					
					
					List<MultipartFile> files=dto.getCmimg();	
					for(MultipartFile f: files) {				
						String filename=f.getOriginalFilename();
						File dest=new File(uploadPath, filename);	
						try {
							f.transferTo(dest);	
						} catch (IllegalStateException | IOException e) {}
					}
					
					
					int maxIdx=dao.selectMaxIdx();	
					int row=dao.insert(dto);	
					
				
					for(MultipartFile f: files) {				
						String filename=f.getOriginalFilename();
						
						row+= dao.insertImage(maxIdx,filename);
						
					}
					
					return row;
			
		}


		public List<CommunityDTO> list() {
			
			return dao.list();
		}

}
