package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.NoticeDao;
import project06.vo.Notice;
import project06.vo.NoticeSch;

@Service
public class NoticeService {
	@Autowired(required=false)
	private NoticeDao dao;
	public ArrayList<Notice> list(NoticeSch sch){
				sch.setCount(dao.totCnt(sch));
				
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				}
				sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
				
				System.out.println("curpage값:"+sch.getCurPage());
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				System.out.println("curpage값(수정):"+sch.getCurPage());
				
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
	
	public void insert(Notice ins) {
		dao.insert(ins);
		
			
		
	}
	public void update(Notice update) {
		dao.updateNotice(update);
	}	
	public void deleteNotice(int no) {
		dao.deleteNotice(no);
		
	}
	
		public Notice getNotice(int no) {
			dao.uptReadCnt(no);
			Notice n = dao.getNotice(no);
			
			return n;
		}
	
		
	// 안드로이드 리스트 출력	
		public  ArrayList<Notice> andlist(Notice sch) {
		
		return dao.andlist(sch);		
		
	}	
	
}
