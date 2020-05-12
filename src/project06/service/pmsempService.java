package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.pmsempRep;
import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Service
public class pmsempService {
		@Autowired(required=false)
		private pmsempRep rep;
		
		public ArrayList<pmsemp> pmsempList(pmsemp sch){
			return rep.pmsempList(sch);
		}
		public ArrayList<pmsempSch> pageList(pmsempSch sch){
			
			sch.setCount(rep.totCnt(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(5);
			}
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
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
			sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
			
			sch.setStartBlock((blocknum-1)*sch.getBlocksize());
			System.out.println("블럭번호:"+blocknum);
			System.out.println("시작 block번호:"+sch.getStartBlock());
			System.out.println("마지막block번호:"+sch.getEndBlock());
			
			return rep.pageList(sch);
		}

}
