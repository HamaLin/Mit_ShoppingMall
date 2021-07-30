package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
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
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class StoreService {
   
   @Autowired private StoreDAO dao;
   @Autowired private writingDAO wdao;
   @Autowired private QnaDAO qnadao;
   @Autowired private ToSftpService tss;
   

   public List<StoreDTO> getList() throws JSchException, SftpException, IOException {
      List<StoreDTO> list = dao.getList();
      List<String> viewlist2 = new ArrayList<String>();
     
      for(StoreDTO dto : list) {
    	  String viewlist = tss.getimgToServer(dto.getViewimg());
    	  viewlist2.add(viewlist);
    	  dto.setViewimglist(viewlist2);
    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
      }
      return list;
   }
   
   // +================================+

   public int getInsert(StoreDTO dto) {
      int row = dao.getInsertItem(dto);
      return row;
      
   }


   public List<String> getfileList(int idx) {
      return dao.getfileList(idx);
   }


   public StoreDTO selectOne(int idx) throws JSchException, SftpException, IOException {
      StoreDTO dto = dao.SelecOne(idx);
      ArrayList<String> list2 = new ArrayList<String>();
      if(dto.getPdimg() != null){
         String filelistname = dto.getPdimg();
         dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
         
         for(int i = 0 ; i <  filelistname.length() ; i++) {
        	 if(filelistname.length() <= 0 ) {
       		  break;
       	  	}
        	String msg = filelistname.substring(0, filelistname.indexOf(","));
        	list2.add(tss.getimgToServer(msg));
        	filelistname = filelistname.substring(filelistname.indexOf(",")+1);        
         }
         dto.setFilename(list2);
      }
      
      list2 = new ArrayList<String>();
      
      if(dto.getViewimg() != null){
          String filelistname = dto.getViewimg();
          
          for(int i = 0 ; i <  filelistname.length() ; i++) {
        	  if(filelistname.length() <= 0 ) {
        		  break;
        	  }
        	 String msg = filelistname.substring(0, filelistname.indexOf(","));
        	 list2.add(tss.getimgToServer(msg));
         	filelistname = filelistname.substring(filelistname.indexOf(",")+1);        
          }
          dto.setViewimglist(list2);
       }
      
      return dto;
   }


   public int delete(int idx) throws JSchException, SftpException, IOException {
      StoreDTO dto = selectOne(idx);
      
      int row = deleteallreply(dto.getIdx());
      
      if(row == 0) {
    	  System.out.println("댓글 사진 지우기 실패!");
    	  return 0;
      }
      
      return dao.delete(idx);
   }


   private int deleteallreply(int idx)  {
	   List<writingDTO> list = wdao.getreplylist(idx);
	   if(list.isEmpty()) {
		   return 1;
	   }
	   int row = 0;
	   
	   for(writingDTO dto : list) {
		   row += wdao.deletereply(dto.getIdx());
	   }
	   return row;
   }


   public int getModify(StoreDTO dto) {
      int row = dao.getModify(dto);
      return row;
   }
   
   public List<StoreDTO> searchItems(String search) throws JSchException, SftpException, IOException {
	   List<StoreDTO> list = dao.searchItems(search);
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}
   

	public int insert(writingDTO dto) {
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


	public List<StoreDTO> newItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.newList();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
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


	public List<writingDTO> getreplylist(int idx) throws JSchException, SftpException, IOException{
		
		List<writingDTO> list = wdao.getreplylist(idx);
		
		for(writingDTO dto : list) {
			if(dto.getImg() != null) {
			dto.setWritingfilename(tss.getimgToServer(dto.getImg()));
			}
		}
		return list;
	}
	
	public List<StoreDTO> topItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.topItems();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public List<StoreDTO> bottomItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.bottomItems();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public List<StoreDTO> hatItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.hatItems();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public List<StoreDTO> glassesItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.glassesItems();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public List<StoreDTO> backpackItems() throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.backpackItems();
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public int modifyreply(writingDTO dto) {
		return wdao.modifyimgreply(dto);
	}


	public int deletereply(int idx) {
		return wdao.deletereply(idx);
	}


	public List<StoreDTO> colorItems(String color) throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.colorItems(color);
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public List<StoreDTO> priceItems(int price) throws JSchException, SftpException, IOException {
		List<StoreDTO> list = dao.priceItems(price);
	     
	      for(StoreDTO dto : list) {
	    	  dto.setMainimg(tss.getimgToServer(dto.getMainimg()));
	      }
	      return list;
	}


	public int checktitle(String pdtitle) {
		return dao.checkTitle(pdtitle);
	}
}