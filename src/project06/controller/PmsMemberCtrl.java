package project06.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.service.PmsMemberService;
import project06.vo.PmsMember;

@Controller
@SessionAttributes("mno")
@RequestMapping("/PmsMember.do")
public class PmsMemberCtrl {
	@Autowired(required = false)
	private PmsMemberService service;
	
	// http://localhost:5080/project06_git/PmsMember.do?method=login
	@RequestMapping(params="method=login")
	public String login(PmsMember member, Model m) {
		System.out.println("PmsMemberCtrl method=login 실행");
		
		int mno = service.memberInfor(member);
		
		System.out.println("mno : " + mno);
		
		if(mno!=0) {
			m.addAttribute("mno", mno);
			return "WEB-INF\\views\\main\\top.jsp";
		}else {
			int ck = 1;
			m.addAttribute("ck",ck);
			return "WEB-INF\\views\\main\\login.jsp";
		}
	}
	
	
}
