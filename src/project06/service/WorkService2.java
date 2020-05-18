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
	public void update(Task update) {
		/*
		데이터 수정 처리
		 * */ 
		dao.updateTask(update);
		// 파일 수정 정보 처리
		//upload2(update);
	}
	public void deleteTask(int no) {
		dao.deleteTask(no);
		//dao.deleteFile(no);
	}
	
	public void coment(Task upt) {
		dao.coment(upt);
	}
	public void prog(Task upt) {
		dao.prog(upt);
	}
	public void upTdiv(Task upt) {
		System.out.println("service tdiv 실행");
		dao.upTdiv(upt);
	}
	public void insert(Task ins) {
		System.out.println("등록 제목:"+ins.getTname());
		dao.insert(ins);
	}
	public Task getTask(int no) {
		// 조회수 카운트업..
		//dao.uptReadCnt(no);
		Task d =  dao.getTask(no);
		//System.out.println("파일의 갯수:"+dao.fnames(no).size());
		//d.setFilenames(dao.fnames(no));
		return d;
	}
	
	
}
