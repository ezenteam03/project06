package project06.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import project06.vo.Meet;
import project06.vo.MeetSch;
import project06.vo.Notice;


@Repository
public interface MeetDao {

	public int totCnt(MeetSch sch);
	
	public ArrayList<Meet> list(MeetSch sch);
	
	public void insert(Meet ins);
	public void updateMeet(Meet upt);
	public void deleteMeet(int mnno);	
	public Meet getMeet(int mnno);
	
	// 업로드
		public void insertRepo(String fname);		// 파일업로드
		public String fnames(int mnno);	// 내용출력
		public void uptFileInfo(HashMap hm);		// 업로드된 파일 수정
		public void insFileInfo(HashMap hm);		// 수정된 내용 업로드
		
	
	
	
	/* 파일 등록 수정 전
	public void insertRepo(String fname);
	
	// 파일 다운로드 정보 
	public String fnames(int mnno);
	public void uptFileInfo(HashMap hm);
	public void insFileInfo(HashMap hm);
	*/
	
	public void uptReadCnt(int mnno);
	public ArrayList<Meet> andlist(Meet sch);
	
}














