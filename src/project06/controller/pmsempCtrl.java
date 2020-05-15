package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.pmsempService;
import project06.vo.pmsemp;

@Controller
@RequestMapping("/PMSemp.do")
public class pmsempCtrl {
	@Autowired(required=false)
	private pmsempService service;
	
	// http://localhost:5080/project06_git/PMSemp.do?method=list
	// http://localhost:5080/project06_git/PMSemp.do?method=insForm
	// http://localhost:5080/project06_git/PMSemp.do?method=delForm
	// http://localhost:5080/project06_git/PMSemp.do?method=empList
	// CEO, CTO 사원 리스트 불러오기
	@RequestMapping(params="method=list")
	public String list(pmsemp sch, Model d) {
		d.addAttribute("elist", service.pmsempList(sch));
		return "WEB-INF\\views\\main\\userList.jsp";
	}
	// 사원추가 이동
	@RequestMapping(params="method=insForm")
	public String insertForm() {
		return "WEB-INF\\views\\main\\empReg.jsp";
	}
	// CEO, CTO 사원 추가
	@RequestMapping(params="method=insert")
	public String insert(pmsemp insert) {
		service.insert(insert);
		return "WEB-INF\\views\\main\\empReg.jsp";
	}
	// CEO, CTO 권한 설정
	@RequestMapping(params="method=update")
	public String update(pmsemp upt) {
		service.update(upt);
		return "forward:/PMSemp.do?method=list";
	}
	// PM 팀원추가 사원 리스트 불러오기
	@RequestMapping(params="method=empList")
	public String empList(pmsemp sch, Model d) {
		d.addAttribute("elist", service.pmsempList(sch));
		return "WEB-INF\\views\\main\\empInsert.jsp";
	}
	// PM 팀원삭제 사원 리스트 불러오기
	@RequestMapping(params="method=delForm")
	public String pmlist(pmsemp sch, Model d) {
		sch.setPno(1001);
		d.addAttribute("pmdlist", service.pmempList(sch));
		return "WEB-INF\\views\\main\\empDelete.jsp";
	}
	@RequestMapping(params="method=delete")
	public String delete(pmsemp del) {
		service.delete(del);
		return "forward:/PMSemp.do?method=delForm";
	}
	
	// Jin 사원번호 찾기
	@RequestMapping(params="method=findEnoFirst")
	public String findEnoFirst() {
		System.out.println("사원번호 찾기 초기 화면");
		return "WEB-INF\\views\\main\\findEmpno.jsp";
	}

	@RequestMapping(params="method=findEno")
	public String findEno(pmsemp emp, Model m) {
		System.out.println("pmsempCtrl method=findEno 실행");
		
		int eno = service.empEno(emp);
		System.out.println("Ctrl eno : " + eno);
		
		if(eno!=0) {
			m.addAttribute("eno", eno);
			return "WEB-INF\\views\\main\\findEmpno02.jsp";
		}else {
			int ck = 1;
			m.addAttribute("ck",ck);
			return "WEB-INF\\views\\main\\findEmpno.jsp";
		}
	}
	
	// Jin
	@RequestMapping(params="method=findPassFirst")
	public String findPassFirst() {
		System.out.println("비밀번호 찾기 초기 화면");
		return "WEB-INF\\views\\main\\findPassword.jsp";
	}
	
	@RequestMapping(params="method=findPass")
	public String findPass(pmsemp emp, Model m) {
		System.out.println("pmsempCtrl method=findPass 실행");
		
		int eno = service.empPass(emp);
		System.out.println("Ctrl eno : " + eno);
		
		if(eno!=0) {
			m.addAttribute("eno", eno);
			return "WEB-INF\\views\\main\\findPassword02.jsp";
		}else {
			int ck = 1;
			m.addAttribute("ck",ck);
			return "WEB-INF\\views\\main\\findPassword.jsp";
		}
	}
	
	
	
	
	
}
