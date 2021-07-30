package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class ToSftpService {
	
	private final String serverIP = "221.164.9.200";		// 대상 서버의 IP 혹은 DNS 이름
	private final int serverPort = 322;			// SSH, SFTP, SCP 서비스 기본 포트
	private final String serverUser = "root";			// 서버에 접속권한이 있는 계정이름
	private final String serverPass = "1";				// 계정 비밀번호
	private ChannelSftp chSftp = null;					// com.jcraft.jsch
	
public String transferToServer(File tmp) throws JSchException, SftpException, IOException {
		
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIP, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		
		sess.connect();
		System.out.println("sftp> Connected");
		
		channel = sess.openChannel("sftp");
		channel.connect();
		
		chSftp = (ChannelSftp) channel;
		// 여기까지가 대상 리눅스 서버에 접속해서 sftp 채널을 열어주는 과정
		
		FileInputStream fis = new FileInputStream(tmp);
		chSftp.cd("/var/www/html");		// 리눅스 httpd 서비스의 기본 문서 경로
		
		chSftp.put(fis, tmp.getName());
		System.out.println("sftp> transfer complete");
		
		fis.close();
		chSftp.exit();
		System.out.println("sftp> exit");
		
		String fileName = "";
		fileName += "http://";
		fileName += serverIP;
		fileName += ":81/";	// 기본 포트가 80번이므로, 생략가능하지만, 만약 톰캣도 설치하려면 포트 중복을 피하기위한 임시 포트
		fileName += tmp.getName();
		
		return fileName;	// fileName을 DB에 기록하면 다음에 불러와서 파일을 참조할 수 있다
	}
   
   public String getimgToServer (String filename) throws JSchException, SftpException, IOException {
	   	String fileName = "";
		fileName += "http://";
		fileName += serverIP;
		fileName += ":81/";	// 기본 포트가 80번이므로, 생략가능하지만, 만약 톰캣도 설치하려면 포트 중복을 피하기위한 임시 포트
		fileName += filename;
		
		return fileName;
   }
   
   public void getDedleteimgToServer (String filename) throws JSchException, SftpException, IOException {
	   Session sess = null;
	   Channel channel = null;
	   JSch jsch = new JSch();
	   
	   sess = jsch.getSession(serverUser, serverIP, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		
		sess.connect();
		System.out.println("sftp> Connected");
		
		channel = sess.openChannel("sftp");
		channel.connect();
		
		chSftp = (ChannelSftp) channel;
		chSftp.cd("/var/www/html");
		// 삭제
		System.out.println(filename);
		chSftp.rm(filename);
		chSftp.exit();
		
   }

}
