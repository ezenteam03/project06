package project06.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import project06.vo.Meet;
import project06.vo.MeetSch;


@Repository
public interface MeetDao {
	// select * from reMeet
	// springweb.a03_mvc.a03_repository.MeetDao
	// 검색할 내용의 전체 데이터 건수.
	public int totCnt(MeetSch sch);
	
	public ArrayList<Meet> list(MeetSch sch);
	
	public void insert(Meet ins);
	public void updateMeet(Meet upt);
	public void deleteMeet(int mnno);	
	// 파일 정보 등록..
	public void insertRepo(String fname);
	public void deleteFile(int mnno);
	public Meet getMeet(int mnno);
	// 파일 다운로드 정보 
	public ArrayList<String> fnames(int mnno);
	public void uptFileInfo(HashMap hm);
	public void insFileInfo(HashMap hm);
	public void uptReadCnt(int mnno);
	
	
}














