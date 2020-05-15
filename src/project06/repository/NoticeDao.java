package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.Notice;
import project06.vo.NoticeSch;

@Repository
public interface NoticeDao{
	
	public ArrayList<Notice> list(NoticeSch sch);
	
	
}


