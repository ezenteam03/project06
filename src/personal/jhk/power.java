package personal.jhk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/power.do")
public class power {
	
	//http://localhost:6080/project06_git/power.do?method=index
	@RequestMapping(params="method=index")
	public String index() {
		return "WEB-INF\\views\\dashiosample\\general.jsp";
	}
}
