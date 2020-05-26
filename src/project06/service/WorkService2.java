package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.WorkDao2;
import project06.vo.Task;
import project06.vo.TaskSch;

@Service
public class WorkService2 {
	@Autowired(required=false)
	private WorkDao2 dao;
	public ArrayList<Task> list(TaskSch sch){
		sch.setCount(dao.totCnt(sch));
		
		System.out.println("mdiv : "+sch.getMdiv());
		System.out.println("getCount : "+sch.getCount());

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
				

		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
				
		System.out.println("시작block : "+sch.getStartBlock());
		System.out.println("curPage : "+sch.getCurPage());
		System.out.println("마지막block : "+sch.getEndBlock());
				
		
		return dao.list(sch);
	}
	
	public ArrayList<Task> slist(TaskSch sch){
		sch.setCount(dao.totCnt(sch));

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
				

		sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
				
		System.out.println("시작block : "+sch.getStartBlock());
		System.out.println("curPage : "+sch.getCurPage());
		System.out.println("마지막block : "+sch.getEndBlock());
		System.out.println("마지막block : "+sch.getMdiv());
		
		return dao.slist(sch);
	}
	
	public void update(Task update) {
		/*
		데이터 수정 처리
		 * */ 
		// 해당 업무 글 수정 ( 업무명, 내용 )
		dao.updateTask(update);
		// 파일 수정 정보 처리
		//upload2(update);
	}
	public void deleteTask(int no) {
		// 해당 업무 글 삭제
		dao.deleteTask(no);
		//dao.deleteFile(no);
	}
	
	public void coment(Task upt) {
		// 해당 업무 글 반려사유
		dao.coment(upt);
	}
	public void upDetail(Task upt) {
		// 해당 업무 글의 업무진행도 수정
		dao.upDetail(upt);
	}
	public void prog(Task upt) {
		//System.out.println("상위업무번호 : "+upt.getRefno());
		// 해당 업무글의 진행률 수정
		dao.prog(upt);
	}
	public void upTdiv(Task upt) {
		// 해당 업무 글 결재신청
		dao.upTdiv(upt);
	}
	public void upTdiv2(Task upt) {
		// 해당 업무 글 반려처리
		dao.upTdiv2(upt);
		dao.prog0(upt);
	}
	public void upTdiv3(Task upt) {
		// 하위업무 결재 / 결재 시 상위업무 진행률 상승
		dao.upTdiv3(upt);
		dao.progUdt(upt);
	}
	public void upTdiv4(Task upt) {
		// pm업무 결재완료
		dao.upTdiv3(upt);
	}
	public void progUdt(Task upt) {
		
	}
	public void insert(Task ins) {
		// 업무 글 등록
		System.out.println("등록 제목:"+ins.getTname());
		dao.insert(ins);
	}
	public Task getTask(int no) {
		// 업무 상세화면
		Task d =  dao.getTask(no);
		//System.out.println("파일의 갯수:"+dao.fnames(no).size());
		//d.setFilenames(dao.fnames(no));
		return d;
	}
	
	
	public ArrayList<Task> workList(Task sch){
		return dao.workList(sch);
	}
	
}
