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
		return dao.projectList();
	}
	
	public Project getProject(int pno){
		return dao.getProject(pno);
	}

	public void proIns(Project ins) {
		System.out.println("프로젝트명 : "+ins.getName());
		System.out.println("프로젝트시작일 : "+ins.getSdate());
		System.out.println("프로젝트종료일 : "+ins.getDeadline());
		System.out.println("프로젝트PM : "+ins.getMno());
		System.out.println("프로젝트상세정보 : "+ins.getDetail());
		dao.proIns(ins);
	}
}
