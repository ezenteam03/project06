package project06.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

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
	public void insertRepo(String fname);
	public ArrayList<String> fnames(int ino);
	public void uptFileInfo(HashMap hm);
	public void insFileInfo(HashMap hm);
	// 댓글
	public ArrayList<Comment> clist(RiskSch sch);
	public void deleteComment(int rno);	
	public Comment getComment(int rno);
	public void updatecomment(Comment cupt);
	// 조회수
	public void uptReadCnt(int ino);
}
