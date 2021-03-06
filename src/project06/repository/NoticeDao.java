package project06.repository;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import project06.vo.Notice;
import project06.vo.NoticeSch;
import project06.vo.Risk;

@Repository
public interface NoticeDao{
	
	public int totCnt(NoticeSch sch);
	public ArrayList<Notice> list(NoticeSch sch);
	
	public void insert(Notice ins);
	public void updateNotice(Notice upt);
	public void deleteNotice(int no);
	
	public Notice getNotice(int no);
	public void uptReadCnt(int no);
	
	public ArrayList<Notice> andlist(Notice sch);
	
	
	
}


