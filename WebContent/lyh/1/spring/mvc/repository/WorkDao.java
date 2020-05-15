package spring.mvc.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import springweb.a03_mvc.a04_vo.Board;
import springweb.a03_mvc.a04_vo.BoardSch;

@Repository
public interface WorkDao {
	// select * from reboard
	// springweb.a03_mvc.a03_repository.BoardDao
	// 검색할 내용의 전체 데이터 건수.
	public int totCnt(BoardSch sch);
	
	public ArrayList<Board> list(BoardSch sch);
	
	public void insert(Board ins);
	public void updateBoard(Board upt);
	public void commentBoard(Board upt);
	public void deleteBoard(int no);	
	// 파일 정보 등록..
	public void insertRepo(String fname);
	public void deleteFile(int no);
	public Board getBoard(int no);
	// 파일 다운로드 정보 
	public ArrayList<String> fnames(int no);
	public void uptFileInfo(HashMap hm);
	public void insFileInfo(HashMap hm);
	public void uptReadCnt(int no);
	
	
}
