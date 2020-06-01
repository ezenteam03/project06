package project06.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import project06.repository.RiskDao;
import project06.vo.Comment;
import project06.vo.PmsMember;
import project06.vo.Risk;
import project06.vo.RiskSch;
import project06.vo.Task;

@Service
public class RiskService {
	@Autowired(required=false)
	private RiskDao dao;
	
	public ArrayList<Risk> list(RiskSch sch,HttpServletRequest request){
		HttpSession session = request.getSession();
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		
		
		if(emp.getPno()==1001) {
			sch.setPno(1001);
		}
		if(emp.getPno()==1002) {
			sch.setPno(1002);
		}
		if(sch.getPno()==0) {
			sch.setPno(1001);
		}
		
		// 1. 데이터 총건수
		sch.setCount(dao.totCnt(sch));
		// 2. 페이지 초기값
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		
		
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
	
		// 3. 총페이지 수 : 총건수/한번에 보여줄 데이터
		sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
		
		// 시작번호 : 총데이터 건수 - (현재 페이지 번호-1)*한번에 보여줄 페이지 크기-한번에 보여줄 페이지 크기+1
		sch.setStart(sch.getCount()-(sch.getCurPage()-1)*sch.getPageSize()-sch.getPageSize()+1);
		// 마지막번호: 총데이터 건수 - (현재 페이지 번호-1)*한번에 보여줄 페이지 크기
		sch.setEnd(sch.getCount()-(sch.getCurPage()-1)*sch.getPageSize());
		
	
		// block을 위한 속성값 설정.
		// 1. 초기 block size(한번에 보일 block의 크기) 설정.
		sch.setBlocksize(5);
		
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		
		int endBlock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endBlock>sch.getPageCount()?
						sch.getPageCount():endBlock);
		// 시작번호는 현재블럭의 번호 ( blocknum - 1)*현재블럭크기 + 1
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
	
		
		return dao.list(sch);
	}
	public ArrayList<Risk> pnolist(RiskSch sch){
		
		return dao.pnolist(sch);
	}
	
	public void insert(Risk ins) {
			
		dao.insert(ins);
		// 파일 업로드 내용..		
		for(MultipartFile report:ins.getReport()) {				
			upload(report);		
		}		
	}
	// 상세화면 처리..
	public Risk getRisk(int ino,HttpServletRequest request) {
		
		dao.uptReadCnt(ino);
		Risk d = dao.getRisk(ino);
		d.setFilenames(dao.fnames(ino));
		
		return d;	
	}
	
	public void update(Risk update) {
		
		dao.updateRisk(update);		
		upload2(update);		
	}
	
	public void comupdate(Risk update2) {
				
		dao.comupdate(update2);	
	}
	
	// 업로드 
	@Value("${upload}")
	private String upload; // 업로드할 위치..
	@Value("${tmpUpload}")
	private String tmpUpload;// 임시업로드 위치.
	private void upload(MultipartFile mtf) {		
		String fileName=mtf.getOriginalFilename();
		if(fileName!=null&&!fileName.equals("")) {
			File tmpFile = new File(tmpUpload+fileName);
			if(tmpFile.exists()) tmpFile.delete();
			try {
				mtf.transferTo(tmpFile);
				File orgFile = new File(upload+fileName);		
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
	
	private void upload2(Risk upt) {
		
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
				System.out.println("no:"+upt.getIno());
				// org, tar, no
				String fnm = upt.getFnames()[idx];
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("org", fnm);			
				hm.put("tar", fileName);
				hm.put("ino", ""+upt.getIno());				
				if( fnm!=null && !fnm.equals("")) {
					dao.uptFileInfo(hm);
				}else {
					dao.insFileInfo(hm);
				}
				
			}			
			
		}
	}	
	
	// 댓글
	public ArrayList<Comment> clist(RiskSch sch){
		sch.setCount(dao.ctotCnt(sch));
		
		
		return dao.clist(sch);
	}
	// 댓글 입력
	public void cinsert(Comment ins) {
		
		dao.cinsert(ins);

			
	}
	// 댓글 삭제
	public void deleteComment(int no) {
		dao.deleteComment(no);
	
	}
	// 댓글 상세화면 처리..
		public Comment getComment(int rno) {
			Comment d = dao.getComment(rno);

			return d;	
		}
		// 댓글 수정
	public void cupdate(Comment cupdate) {
		
		dao.updatecomment(cupdate);		
	
	}
	public  ArrayList<Risk> andlist(Risk sch) {
		
		return dao.andlist(sch);		
		
	}
}












