package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.ProjectDao;
import project06.vo.Project;

@Service
public class ProjectService {
	@Autowired(required=false)
	private ProjectDao dao;
	
	public ArrayList<Project> projectList(){
		for(Project p : dao.projectList()) {
			System.out.println(p.getDetail());
		}
		System.out.println();
		return dao.projectList();
	}
}
