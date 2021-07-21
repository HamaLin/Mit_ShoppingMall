package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.BuyTableDTO;
import com.itbank.model.StoreDAO;
import com.itbank.model.StoreDTO;
import com.itbank.model.WishListDTO;
import com.itbank.model.writingDAO;
import com.itbank.model.writingDTO;

@Service
public class StoreService {
   
   @Autowired private StoreDAO dao;
   @Autowired private writingDAO wdao;
   
   private final String uploadPath = "C:\\mitImg";
   
   public StoreService() {
      File dir = new File(uploadPath);
      if(dir.exists() == false) {
         dir.mkdirs();
      }
   }
   

   public List<StoreDTO> getList() {
      List<StoreDTO> list = dao.getList();
     
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
      String newdir = uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter();
      String fileName = "";
      
      for (MultipartFile f : files) {
         if(f.getSize() == 0) {
            break;
         }
         UUID uuid = UUID.randomUUID();
         String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
         if(dto.getMainimg().equals(f.getOriginalFilename())) {
        	 dto.setMainimg(fileName2);
         }
         File dest = new File(newdir, fileName2);   // 파일 객체를 생성
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
      ArrayList<String> list2 = new ArrayList<String>();
      if(dto.getPdimg() != null){
         File dir = new File(uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter());
         File[] files = dir.listFiles();
         String filelistname = dto.getPdimg();
         
         for(File f : files) {
        	String msg = (String) filelistname.subSequence(0, filelistname.indexOf(","));
        	if(msg.equals(dto.getMainimg())) {
        		
        	}
        	else {
        		list2.add(msg);
        	}
        	filelistname = filelistname.substring(filelistname.indexOf(",")+1);        
         }
         dto.setFilename(list2);
      }
      return dto;
   }


   public int delete(int idx) {
      StoreDTO dto = selectOne(idx);
      String newdir = uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter();
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
      String newdir = uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter();
      
      List<MultipartFile> files = dto.getFiles();
      for (MultipartFile f : files) {         
         UUID uuid = UUID.randomUUID();
           String fileName = uuid.toString() + "_" + f.getOriginalFilename();
           File dest = new File(newdir, fileName);   // 파일 객체를 생성
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
   public List<StoreDTO> searchItems(String search) {
		return dao.searchItems(search);
	}
   

	public int insert(writingDTO dto) {
		if(dto.getPassword1().equals(dto.getPassword2())) {
		return wdao.insert(dto);
		
		}
		return 0;
	}

	public int wishInsert(WishListDTO dto) {
		return dao.wishInsert(dto);
	}


	public List<writingDTO> select() {
		// TODO Auto-generated method stub
		return null;
	}


	public int insertbuytale(BuyTableDTO dto) {
//		switch (dto.getUsersize()) {
//		case "s" : dao.setscountmodifycount(dto.getCount(),dto.getPdidx());
//			break;
//		case "m" : dao.setmcountmodifycount(dto.getCount(),dto.getPdidx());
//		break;
//		case "l" : dao.setlcountmodifycount(dto.getCount(),dto.getPdidx());
//		break;
//		case "xl" : dao.setxlcountmodifycount(dto.getCount(),dto.getPdidx());
//		break;
//		}
		
		StoreDTO dto2 = selectOne(dto.getPdidx());
		
		dto.setTotal(dto2.getPdprice() * dto.getCount());
		
		return dao.insertbuytable(dto);
	}

   

}