package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.Project;

@Repository
public interface ProjectDao{
	public ArrayList<Project> projectList();
	public Project getProject(int pno);
	
}


