package project06.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a03_mvc.a03_repository.BoardDao;
import springweb.a03_mvc.a04_vo.Board;

@Service
public class A01_BoardService {
	@Autowired(required=false)
	private BoardDao dao;
	public ArrayList<Board> list(Board sch){
		return dao.list(sch);
	}
	public void insert(Board ins) {
		/*
		# 등록시 처리할 부분.
		1. 물리적 파일을 생성과 특정 위치로 변경.
		2. 등록 파일 정보 DB 처리.
		3. 실제 등록 처리..
		 * */ 
		dao.insert(ins);
		// 파일 업로드 내용..
		for(MultipartFile report:ins.getReport()) {
			// 물리적 파일 정리
			upload(report);
			
		}
	}
	public void update(Board update) {
		/*
		데이터 수정 처리
		 * */ 
		dao.updateBoard(update);
		// 파일 수정 정보 처리
		upload2(update);
	}	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
		dao.deleteFile(no);
	}
	
	
	@Value("${upload}")
	private String upload; // 업로드할 위치..
	@Value("${tmpUpload}")
	private String tmpUpload;// 임시업로드 위치.
	private void upload(MultipartFile mtf) {
		
		String fileName=mtf.getOriginalFilename();
		
		if(fileName!=null&&!fileName.equals("")) {
			File tmpFile = new File(tmpUpload+fileName);
			// 해당 폴드에 동일한 파일이 있으면 삭제 처리
			if(tmpFile.exists()) tmpFile.delete();
			try {
			// Stream으로 온 MultipartFile을 실제 파일로 변경처리.	
				mtf.transferTo(tmpFile);
				File orgFile = new File(upload+fileName);
		
			// tmp위치에 있는 파일을 현재 웹서버에 특정할 폴드로 이동.
			// StandardCopyOption.REPLACE_EXISTING : 기존 동일 파일명이 있을 때,
			// 마지막에 올린 파일로 변경 처리..
				Files.copy(tmpFile.toPath(), orgFile.toPath(), 
							StandardCopyOption.REPLACE_EXISTING);
				
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dao.insertRepo(fileName);
			
		}
	}
	// 파일 수정, 파일 정보 수정..
	private void upload2(Board upt) {
		
		MultipartFile[] files = upt.getReport();
		for(int idx=0;idx<files.length;idx++) {
			String fileName=files[idx].getOriginalFilename();
			if(fileName!=null&&!fileName.equals("")) {
				File tmpFile = new File(tmpUpload+fileName);
				// 해당 폴드에 동일한 파일이 있으면 삭제 처리
				if(tmpFile.exists()) tmpFile.delete();
				try {
				// Stream으로 온 MultipartFile을 실제 파일로 변경처리.	
					files[idx].transferTo(tmpFile);
					File orgFile = new File(upload+fileName);
			
				// tmp위치에 있는 파일을 현재 웹서버에 특정할 폴드로 이동.
				// StandardCopyOption.REPLACE_EXISTING : 기존 동일 파일명이 있을 때,
				// 마지막에 올린 파일로 변경 처리..
					Files.copy(tmpFile.toPath(), orgFile.toPath(), 
								StandardCopyOption.REPLACE_EXISTING);
					
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("org:"+upt.getFnames()[idx]);
				System.out.println("tar:"+fileName);
				System.out.println("no:"+upt.getNo());
				// org, tar, no
				String fnm = upt.getFnames()[idx];
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("org", fnm);
				hm.put("tar", fileName);
				hm.put("no", ""+upt.getNo());				
				if( fnm!=null && !fnm.equals("")) {
					dao.uptFileInfo(hm);
				}else {
					dao.insFileInfo(hm);
				}
				
			}			
			
		}
	}	
	// 상세화면 처리..
	public Board getBoard(int no) {
		// 조회수 카운트업..
		dao.uptReadCnt(no);
		System.out.println("파일의 갯수:"+dao.fnames(no).size());
		Board d = dao.getBoard(no);
		d.setFilenames(dao.fnames(no));
		return d;
	}
	
}
