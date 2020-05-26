package project06.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import project06.vo.Comment;
import project06.vo.Risk;
import project06.vo.RiskSch;

@Repository
public interface RiskDao {
	
	public int totCnt(RiskSch sch);
	public int ctotCnt(RiskSch sch);

	public ArrayList<Risk> list(RiskSch sch);
	
	public void insert(Risk ins);
	public void cinsert(Comment ins);
	
	public Risk getRisk(int ino);
	
	public void updateRisk(Risk upt);
	
	public void comupdate(Risk upt2);
	// 업로드
	public void insertRepo(String fname);		// 파일업로드
	public ArrayList<String> fnames(int ino);	// 내용출력
	public void uptFileInfo(HashMap hm);		// 업로드된 파일 수정
	public void insFileInfo(HashMap hm);		// 수정된 내용 업로드
	// 댓글
	public ArrayList<Comment> clist(RiskSch sch);
	public void deleteComment(int rno);	
	public Comment getComment(int rno);
	public void updatecomment(Comment cupt);
	// 조회수
	public void uptReadCnt(int ino);
	
	public ArrayList<Risk> andlist(Risk sch);
}
