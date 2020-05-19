package project06.repository;

import java.util.ArrayList;


import org.springframework.stereotype.Repository;

import project06.vo.Task;
import project06.vo.TaskSch;

@Repository
public interface WorkDao2 {

	public int totCnt(TaskSch sch);
	public ArrayList<Task> list(TaskSch sch);

	public void updateTask(Task upt);
	
	public void coment(Task upt);
	public void prog(Task upt);
	public void upTdiv(Task upt);
	
	public void insert(Task ins);
	
	public void deleteTask(int no);	
	
	public Task getTask(int no);
	
}
