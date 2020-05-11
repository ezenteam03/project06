package project06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/springtest.do")
public class springtest {
	//http://localhost:6080/project06_git/springtest.do?method=main
	@RequestMapping(params="method=main")
	public String mainp() {
		return "WEB-INF\\views\\main\\main.jsp";
	}
	
	@RequestMapping(params="method=index")
	public String index() {	
		return "WEB-INF\\views\\dashiosample\\index.jsp";
	}
}
