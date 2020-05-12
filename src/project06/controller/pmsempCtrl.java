package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.pmsempService;
import project06.vo.pmsemp;

@Controller
@RequestMapping("/PMSemp.do")
public class pmsempCtrl {
	@Autowired(required=false)
	private pmsempService service;
	
	// http://localhost:5080/project06_git/PMSemp.do?method=list
	// http://localhost:5080/project06_git/PMSemp.do?method=insEmp
	@RequestMapping(params="method=list")
	public String list(pmsemp sch, Model d) {
		d.addAttribute("elist", service.pmsempList(sch));
		return "WEB-INF\\views\\main\\userList.jsp";
	}
	@RequestMapping(params="method=insEmp")
	public String insertForm() {
		return "WEB-INF\\views\\main\\empReg.jsp";
	}
}
