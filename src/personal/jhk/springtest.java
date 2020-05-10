package personal.jhk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/springtest.do")
public class springtest {
	//http://localhost:6080/project06_git/springtest.do?method=main
	@RequestMapping(params="method=main")
	public String mainp(Model d) {
		return "WEB-INF\\views\\main\\main.jsp";
	}
	
	//http://localhost:6080/project06_git/springtest.do?method=index
	@RequestMapping(params="method=index")
	public String index(Model d) {
		return "WEB-INF\\views\\main\\index.jsp";
	}
}
