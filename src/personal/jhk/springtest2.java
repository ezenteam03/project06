package personal.jhk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/springtest2.do")
public class springtest2 {
	//http://localhost:6080/project06_git/springtest.do?method=index
	@RequestMapping(params="method=main")
	public String index() {
		return "WEB-INF\\views\\main\\main.jsp";
	}
}
