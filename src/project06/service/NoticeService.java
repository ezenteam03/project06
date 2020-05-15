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
		
		// 2. 화면에 한번에 보여줄 데이터 건수 초기값 5
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		// 3. 총 페이지수: 총건수/한번에 보여줄 데이터
		sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
		//  4. 현재 클릭한 페이지 초기값.
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
		// 시작번호는 현재블럭의 번호 ( blocknum - 1)*현재블럭크기 + 1
		System.out.println("블럭번호:"+blocknum);
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		System.out.println("시작 block번호:"+sch.getStartBlock());
		System.out.println("마지막 block번호:"+sch.getEndBlock());
		
		
		return dao.list(sch);
	}
}
