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

import project06.repository.MeetDao;
import project06.vo.Meet;
import project06.vo.MeetSch;

@Service
public class MeetService {
	@Autowired(required=false)
	private MeetDao dao;
	public ArrayList<Meet> list(MeetSch sch){
		sch.setCount(dao.totCnt(sch));
		
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		
		sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
		
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		System.out.println("시작번호:"+sch.getStart());
		System.out.println("마지막번호:"+sch.getEnd());
		
		sch.setBlocksize(5);
		
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());

		int endBlock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endBlock>sch.getPageCount()?
						sch.getPageCount():endBlock);
		
		System.out.println("블럭번호:"+blocknum);
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		System.out.println("시작 block번호:"+sch.getStartBlock());
		System.out.println("마지막 block번호:"+sch.getEndBlock());
		
		return dao.list(sch);
	}
	public void insert(Meet insert) {
		
		dao.insert(insert);
		// 파일 업로드 내용..
		//for(MultipartFile report:insert.getReport()) {
			// 물리적 파일 정리
		//	upload(report);
			
		//}
	}
	public void update(Meet update) {
		
		dao.updateMeet(update);
		// 파일 수정 정보 처리
		//upload2(update);
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
	private void upload2(Meet upt) {
		
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
				// org, tar, no
				String fnm = upt.getFnames()[idx];
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("org", fnm);
				hm.put("tar", fileName);
				hm.put("no", ""+upt.getMnno());
				// 등록된 파일이 있으면 수정,
				// 추가 등록시에는 등록 처리.
				if( fnm!=null && !fnm.equals("")) {
					dao.uptFileInfo(hm);
				}else {
					dao.insFileInfo(hm);
				}
				
			}			
			
		}
	}	
	// 상세화면 처리..
	public Meet getMeet(int mnno) {
		// 조회수 카운트업..
		dao.uptReadCnt(mnno);
		System.out.println("파일의 갯수:"+dao.fnames(mnno));
		Meet d = dao.getMeet(mnno);
		System.out.println(d.getWriter());
		d.setFilenames(dao.fnames(mnno));
		System.out.println(d.getFilenames());
		return d;
	}
	
}