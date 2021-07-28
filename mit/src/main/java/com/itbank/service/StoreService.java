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
import com.itbank.model.QnaDAO;
import com.itbank.model.QnaDTO;
import com.itbank.model.StoreDAO;
import com.itbank.model.StoreDTO;
import com.itbank.model.WishListDTO;
import com.itbank.model.writingDAO;
import com.itbank.model.writingDTO;

@Service
public class StoreService {
   
   @Autowired private StoreDAO dao;
   @Autowired private writingDAO wdao;
   @Autowired private QnaDAO qnadao;
   
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
         dto.setViewimg("");
         return dao.getInsertItem(dto);
      }
      
      // id이름에 따라서 폴더 생성
      String newdir = uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter();
      String fileName = "";
      String viewimgname = "";
      List<String> viewimglist = dto.getViewimglist();
      
      
      for (MultipartFile f : files) {
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
         File dest = new File(newdir, fileName2);   // 파일 객체를 생성
         if(dest.exists() == false) {
             dest.mkdirs();
         }
         fileName += fileName2 + ",";
         
         try {
            f.transferTo(dest);
         } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
         } 
            
      }
      
      dto.setViewimg(viewimgname);
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
         
         for(int i = 0 ; i <  files.length ; i++) {
        	 if(filelistname.length() <= 0 ) {
       		  break;
       	  	}
        	String msg = filelistname.substring(0, filelistname.indexOf(","));
        	list2.add(msg);
        	filelistname = filelistname.substring(filelistname.indexOf(",")+1);        
         }
         dto.setFilename(list2);
      }
      
      list2 = new ArrayList<String>();
      
      if(dto.getViewimg() != null){
          File dir = new File(uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter());
          File[] files = dir.listFiles();
          String filelistname = dto.getViewimg();
          
          for(int i = 0 ; i <  files.length ; i++) {
        	  if(filelistname.length() <= 0 ) {
        		  break;
        	  }
        	 String msg = filelistname.substring(0, filelistname.indexOf(","));
         	list2.add(msg);
         	filelistname = filelistname.substring(filelistname.indexOf(",")+1);        
          }
          dto.setViewimglist(list2);
       }
      
      return dto;
   }


   public int delete(int idx) {
      StoreDTO dto = selectOne(idx);
      
      if(dto.getPdimg() != null) {
    	  String newdir = uploadPath + "\\" + dto.getPdcode() + dto.getPdwriter();
          File delfolder = new File(newdir);
          File[] delfolderList = delfolder.listFiles();
    	  for(int i = 0; i< delfolderList.length ; i++) {
    	         delfolderList[i].delete();
    	  }
    	  delfolder.delete();
      }
      
      int row = deleteallreply(dto.getIdx());
      
      if(row == 0) {
    	  System.out.println("댓글 사진 지우기 실패!");
    	  return 0;
      }
      
      return dao.delete(idx);
   }


   private int deleteallreply(int idx) {
	   List<writingDTO> list = wdao.getreplylist(idx);
	   
	   int row = 0;
	   
	   for(writingDTO dto : list) {
		   
		   if(dto.getImg() != null) {
		    	  String newdir = uploadPath + "\\store" + dto.getWriter() + dto.getPdidx();
		          File delfolder = new File(newdir);
		          File[] delfolderList = delfolder.listFiles();
		    	  for(int i = 0; i< delfolderList.length ; i++) {
		    	         delfolderList[i].delete();
		    	  }
		    	  delfolder.delete();
		      }
		   row += wdao.deletereply(dto.getIdx());
	   }
	   return row;
   }


   public int getModify(StoreDTO dto) {
      int row = dao.getModify(dto);
      return row;
   }
   
   public List<StoreDTO> searchItems(String search) {
		return dao.searchItems(search);
	}
   

	public int insert(writingDTO dto) {
		List<MultipartFile> files = dto.getWritingfiles();
	      
	    if (files == null) {
	       dto.setImg("");
	       return wdao.insert(dto);
	    }
	    
	    String newdir = uploadPath + "\\store" + dto.getWriter() + dto.getPdidx();
	    String fileName = "";
	      
	      for (MultipartFile f : files) {
	         if(f.getSize() == 0) {
	            break;
	         }
	         
	        // 랜덤 파일명 
			UUID uuid = UUID.randomUUID();
			String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	       
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
	    dto.setImg(fileName);
		return wdao.insert(dto);
	}

	public int wishInsert(WishListDTO dto) {
		return dao.wishInsert(dto);
	}


	public List<writingDTO> select() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<QnaDTO> getqnalist(int idx) {
		return qnadao.getqnalist(idx);
	}


	public int modifywishlist(WishListDTO dto) {
		dto.setBuythis(1);
		return dao.modifywishlist(dto);
	}


	public List<WishListDTO> getpurchaselist(String userid) {
		return dao.getpurchaselist(userid);
	}


	public int resetidset(String userid) {
		return dao.resetidset(userid);
	}
   
	public List<StoreDTO> bestItems() {
		List<BuyTableDTO> buylist = dao.bestList();
		ArrayList<StoreDTO> dto = new ArrayList<StoreDTO>();
		for(BuyTableDTO buy : buylist) {
			dto.add(dao.SelecOne(buy.getPdidx()));
		}
		return dto;
	}


	public List<StoreDTO> newItems() {
	      return dao.newList();
	}
	
	public int purchase(BuyTableDTO dto) {
		StoreDTO sdto = dao.SelecOne(dto.getPdidx());
		switch (dto.getUsersize()) {
		case "s" : dao.setscountmodifycount(sdto.getPdscount() - dto.getCount(),dto.getPdidx());
		break;
		case "m" : dao.setmcountmodifycount(sdto.getPdmcount() - dto.getCount(),dto.getPdidx());
		break;
		case "l" : dao.setlcountmodifycount(sdto.getPdlcount() - dto.getCount(),dto.getPdidx());
		break;
		case "xl" : dao.setxlcountmodifycount(sdto.getPdxlcount() - dto.getCount(),dto.getPdidx());
		break;
		}
		dao.deletewishlist(dto.getUserid());
		
		return dao.purchase(dto);
	}


	public List<BuyTableDTO> getbuylist(int idx) {
		return dao.getbuylist(idx);
	}


	public List<writingDTO> getreplylist(int idx) {
		
		List<writingDTO> list = wdao.getreplylist(idx);
		ArrayList<String> list2 = new ArrayList<String>();
		
		for(writingDTO dto : list) {
			if(dto.getImg() != null) {
				File dir = new File(uploadPath + "\\store" + dto.getWriter() + + dto.getPdidx());
		        File[] files = dir.listFiles();
		        String filelistname = dto.getImg();
		        for(int i = 0 ; i <  files.length ; i++) {
		        	 if(filelistname.length() <= 0 ) {
		       		  break;
		       	}
		        String msg = filelistname.substring(0, filelistname.indexOf(","));
			    list2.add(msg);
			    filelistname = filelistname.substring(filelistname.indexOf(",")+1);   
			}
		    dto.setWritingfilename(list2);
			}
		}
		return list;
	}
	
	public List<StoreDTO> topItems() {
		return dao.topItems();
	}


	public List<StoreDTO> bottomItems() {
		return dao.bottomItems();
	}


	public List<StoreDTO> hatItems() {
		return dao.hatItems();
	}


	public List<StoreDTO> glassesItems() {
		return dao.glassesItems();
	}


	public List<StoreDTO> backpackItems() {
		return dao.backpackItems();
	}


	public int modifyreply(writingDTO dto) {
		List<MultipartFile> files = dto.getWritingfiles();
	      
	    if (files == null) {
	       dto.setImg("");
	       return wdao.modifyreply(dto);
	    }
	    
	    String newdir = uploadPath + "\\store" + dto.getWriter() + dto.getPdidx();
	    String fileName = "";
	      
	      for (MultipartFile f : files) {
	         if(f.getSize() == 0) {
	            break;
	         }
	         
	        // 랜덤 파일명 
			UUID uuid = UUID.randomUUID();
			String fileName2 = uuid.toString() + "_" + f.getOriginalFilename();
	       
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
	    dto.setImg(fileName);
		
		return wdao.modifyimgreply(dto);
	}


	public int deletereply(int idx) {
		writingDTO dto = wdao.getreplyone(idx);
		
		if(dto.getImg() != null) {
	    	  String newdir = uploadPath + "\\store" + dto.getWriter() + dto.getPdidx();
	          File delfolder = new File(newdir);
	          File[] delfolderList = delfolder.listFiles();
	    	  for(int i = 0; i< delfolderList.length ; i++) {
	    	         delfolderList[i].delete();
	    	  }
	    	  delfolder.delete();
	      }
		return wdao.deletereply(idx);
	}


	public List<StoreDTO> colorItems(String color) {
		return dao.colorItems(color);
	}


	public List<StoreDTO> priceItems(int price) {
		return dao.priceItems(price);
	}
}