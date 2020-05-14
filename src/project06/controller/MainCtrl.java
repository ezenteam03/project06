package project06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainCtrl {
	// http://localhost:5080/project06_git/main.do
	@RequestMapping("main.do")
	public String login() {
		System.out.println("main 페이지(login) 실행");
		return "WEB-INF\\views\\main\\login.jsp";
	}
}
