package spring.mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import spring.mvc.vo.Task;
import spring.mvc.vo.TaskSch;

@Repository
public interface WorkDao2 {

	public int totCnt(TaskSch sch);
	public ArrayList<Task> list(TaskSch sch);

	public void updateTask(Task upt);
	
	public void coment(Task upt);
	
	public void insert(Task ins);
	
	public void deleteTask(int no);	
	
	public Task getTask(int no);
	
}
