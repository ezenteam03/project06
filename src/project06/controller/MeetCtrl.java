package project06.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import project06.service.*;

@Controller
@RequestMapping("/meet.do")
public class MeetCtrl {
	@Autowired(required = false)
	private MeetService service;
	
	//http://localhost:5080/project06_git/meet.do?method=list
	@RequestMapping(params="method=list")
	public String list(Model d, HttpServletRequest request) {
		String page = "WEB-INF\\views\\main\\meetList.jsp";
		d.addAttribute("mlist", service.list());
		return isLogin(page, request);
		
	}
	
	public String isLogin(String page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		} 
		return page;
	}
}
