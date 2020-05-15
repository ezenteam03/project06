package project06.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.service.PmsMemberService;
import project06.vo.PmsMember;
import project06.vo.pmsemp;

@Controller
@SessionAttributes({"mno","emp","infor_M","proName"})
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
		pmsemp emp = service.empInfor(mno);
		PmsMember infor_M = service.memberInforAll(mno);
		String proName = service.projectName(mno);
		
		if(mno!=0) {
			m.addAttribute("mno", mno);
			m.addAttribute("emp", emp);
			m.addAttribute("infor_M", infor_M);
			m.addAttribute("proName", proName);
			return "WEB-INF\\views\\main\\top.jsp";
		}else {
			int ck = 1;
			m.addAttribute("ck",ck);
			return "WEB-INF\\views\\main\\login.jsp";
		}
	}
	
	@RequestMapping(params="method=changePass")
	public String changePass(PmsMember member, Model m) {
		System.out.println("PmsMemberCtrl method=changePass 실행");
		
		int ck = service.changePass(member);
		
		m.addAttribute("ck", ck);
		
		return "WEB-INF\\views\\main\\findPassword02.jsp";
	}
	
	@RequestMapping(params="method=information")
	public String inforCheck(PmsMember member, Model m) {
		System.out.println("PmsMemberCtrl method=information 실행");
		
		int mno = service.memberInfor(member);
		
		int ck = 0;
		
		if(mno!=0) {
			ck = 1;
			m.addAttribute("ck",ck);
			pmsemp e = service.outInfor(mno);
			System.out.println("이메일 : "+ e.getEmail());
			System.out.println("이름 : "+ e.getName());
			System.out.println("부서 : "+ e.getDept());
			m.addAttribute("e", e);
			return "WEB-INF\\views\\main\\top.jsp";
		}else {
			ck = 2;
			m.addAttribute("ck",ck);
			return "WEB-INF\\views\\main\\top.jsp";
		}
	}
	
	@RequestMapping(params="method=updateInfor")
	public String inforUpdate(PmsMember member, Model m) {
		System.out.println("PmsMemberCtrl method=updateInfor 실행");
		
		service.updateInfor(member);

		int ck = 3;
		m.addAttribute("ck",ck);

		return "WEB-INF\\views\\main\\top.jsp";
	}
	

	
	
}
