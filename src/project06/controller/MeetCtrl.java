package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.MeetService;

@Controller
@RequestMapping("/meet.do")
public class MeetCtrl {
	@Autowired(required = false)
	private MeetService service;
	
	//http://localhost:5080/project06_git/meet.do?method=list
	@RequestMapping(params="method=list")
	public String list(Model d) {
		d.addAttribute("mlist", service.list());
		return "WEB-INF\\views\\main\\meetList.jsp";
		
	}

}
