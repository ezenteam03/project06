package project06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("project.do")
public class ProjectCtrl {
	// http://localhost:5080/project06_git/project.do?method=insert
	@RequestMapping(params="method=insert")
	public String insert() {
		System.out.println("project insert페이지");
		return "WEB-INF\\views\\main\\projectInsert.jsp";
	}
	
}
