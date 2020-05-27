package project06.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ChattingCtrl {
	// http://localhost:5080/project06_git/chatting.do
	@RequestMapping("/chatting.do")
	public String chatting() {
		return "WEB-INF\\views\\main\\chatting.jsp";
	}

}
