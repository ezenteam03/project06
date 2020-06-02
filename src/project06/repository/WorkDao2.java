package project06.repository;

import java.util.ArrayList;


import org.springframework.stereotype.Repository;

import project06.vo.PmsMember;
import project06.vo.Task;
import project06.vo.TaskSch;

@Repository
public interface WorkDao2 {

	public int totCnt(TaskSch sch);
	public ArrayList<Task> list(TaskSch sch);
	public ArrayList<Task> slist(TaskSch sch);
	public ArrayList<Task> workList(Task sch);
	public ArrayList<Task> nameList(Task sch);
	public ArrayList<Task> getrefno(Task sch);
	public ArrayList<Task> refnoList(Task sch); 

	public void updateTask(Task upt);
	
	public void coment(Task upt);
	public void prog(Task upt);
	public void prog0(Task upt);
	public void upTdiv(Task upt);
	public void upTdiv2(Task upt);
	public void upTdiv3(Task upt);
	public void upDetail(Task upt);
	public void progUdt(Task upt);
	
	public void insert(Task ins);
	
	public void deleteTask(int no);	
	public void deleteFile(int no);	
	
	public Task getTask(int no);
	
	
	// 업로드
	
	public void insertRepo(String fname);		// 파일업로드
	
}
