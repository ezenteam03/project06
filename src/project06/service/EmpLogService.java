package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.EmpLogDao;
import project06.vo.EmpLog;
import project06.vo.EmpLogSch;

@Service
public class EmpLogService {

	@Autowired(required = false)
	private EmpLogDao dao;
	
	public ArrayList<EmpLog> logList(EmpLogSch sch){
		System.out.println("Service logList 실행");
		
		sch.setCount(dao.empLogCount(sch));	// 전체 행 수 = 8
		
		if(sch.getPageSize() == 0) {
			sch.setPageSize(5);			// 한번에 나오는 페이지 수 = 5
		}
		// 총 페이지 수 = 전체 행 수/한번에 나오는 페이지 수, 2 = ceil(8/5)
		sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
																							
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);		//클릭한 현재 페이지 번호 = 1
		}
		
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);	// ((클릭한 현재 페이지 번호 - 1) * 한번에 나오는 페이지 수 )+1 = ((1-1)*5)+1 = 1
		sch.setEnd(sch.getCurPage()*sch.getPageSize());	// 클릭한 현재 페이지 번호 * 한번에 나오는 페이지 수 = 1*5 = 5
		System.out.println("시작번호 : "+sch.getStart());
		System.out.println("마지막번호 : "+sch.getEnd());
		
		sch.setBlocksize(5);	// 블럭 사이즈 = 5
		
		// 블럭넘버=ceil(현재 페이지 / 블럭 사이즈), 1 = ceil(1/5)
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		
		// endBlick = 5;
		int endBlock = blocknum*sch.getBlocksize();
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
		System.out.println("블럭번호 : "+blocknum);
		
		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
		System.out.println(blocknum+"번째 블럭의 시작 block 번호 : " + sch.getStartBlock());
		System.out.println(blocknum+"번째 블럭의 마지막 block 번호 : " + sch.getEndBlock());
		
		return dao.logList(sch);		
		
	}
}
