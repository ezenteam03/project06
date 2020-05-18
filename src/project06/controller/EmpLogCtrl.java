package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.EmpLogService;
import project06.vo.EmpLogSch;

@Controller
@RequestMapping("/logList.do")
public class EmpLogCtrl {
	// http://localhost:5080/project06_git/logList.do?method=list
	@Autowired(required = false)
	private EmpLogService service;
	
	@RequestMapping(params="method=list")
	public String logList(@ModelAttribute("empLogSch") EmpLogSch sch, Model m) {
		System.out.println("EmpLogCtrl method=list 실행");
		m.addAttribute("loglist", service.logList(sch));
		return "WEB-INF\\views\\main\\participants.jsp";
	}
}
