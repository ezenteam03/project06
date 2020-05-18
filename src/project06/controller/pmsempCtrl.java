package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.service.pmsempService;
import project06.vo.pmsemp;

@Controller
@RequestMapping("/PMSemp.do")
public class pmsempCtrl {
	@Autowired(required=false)
	private pmsempService service;
	
	// http://localhost:5080/project06_git/PMSemp.do?method=list
	// http://localhost:5080/project06_git/PMSemp.do?method=setForm
	// http://localhost:5080/project06_git/PMSemp.do?method=insForm
	// http://localhost:5080/project06_git/PMSemp.do?method=delForm
	// http://localhost:5080/project06_git/PMSemp.do?method=empList
	// http://localhost:5080/project06_git/PMSemp.do?method=empmList
	// http://localhost:5080/project06_git/PMSemp.do?method=modForm

	
	// CEO, CTO 사원 리스트 불러오기
	@RequestMapping(params="method=list")
	public String list(pmsemp sch, Model d) {
		d.addAttribute("elist", service.pmsempList(sch));
		return "WEB-INF\\views\\main\\userList.jsp";
	}
	// 인사 사원정보수정 페이지 이동
	@RequestMapping(params="method=setForm")
	public String setemp(@RequestParam("eno") int eno, Model d) {
		// d.addAttribute("emp" <== 내가 정보를 받을 페이지에 사용
		System.out.println("ctrl eno : "+eno);
		d.addAttribute("emp", service.getemp(eno));
	
		return "WEB-INF\\views\\main\\setemp.jsp";
	}
	// CEO, CTO 권한 설정
	@RequestMapping(params="method=update")
	public String update(pmsemp upt) {
		service.update(upt);
		return "forward:/PMSemp.do?method=setForm";
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
	// PM 팀원 삭제
	@RequestMapping(params="method=delete")
	public String delete(pmsemp del) {
		service.delete(del);
		return "forward:/PMSemp.do?method=delForm";
	}
	// 인사 사원리스트 불러오기
	@RequestMapping(params="method=empmList")
	public String empmList(pmsemp sch, Model d) {
		d.addAttribute("elist", service.pmsempList(sch));
		return "WEB-INF\\views\\main\\modList.jsp";
	}
	// 사원등록 페이지 이동
	@RequestMapping(params="method=insForm")
	public String insertForm() {
		return "WEB-INF\\views\\main\\empReg.jsp";
	}
	// 인사 사원등록
	@RequestMapping(params="method=insert")
	public String insert(pmsemp insert) {
		service.insert(insert);
		return "WEB-INF\\views\\main\\empReg.jsp";
	}
	// 인사 사원정보수정 페이지 이동
	@RequestMapping(params="method=modForm")
	public String modlist(@RequestParam("eno") int eno, Model d) {
		System.out.println(eno);
		// d.addAttribute("emp" <== 내가 정보를 받을 페이지에 사용
		d.addAttribute("emp", service.getPmsemp(eno));
		return "WEB-INF\\views\\main\\empModify.jsp";
	}
	// 사원정보수정
	@RequestMapping(params="method=mbtn")
	public String upemp(pmsemp mod) {
		service.modifyEmp(mod);
		return "forward:/PMSemp.do?method=modForm";
	}
	// 퇴사 처리
	@RequestMapping(params="method=dbtn")
	public String delg(pmsemp del) {
		service.deleteG(del);
		return "forward:/PMSemp.do?method=modForm";
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
	/*
	  @RequestMapping(params="method=list") 
	  public String list(Model d, HttpServletRequest request) {  <== HttpServletRequest request추가
	  String page = "WEB-INF\\views\\main\\meetList.jsp"; 		 <== 추가
	  d.addAttribute("mlist", service.list()); 
	  return isLogin(page, request);							 <== 추가
	  }
	*/
	
	// 로그인 세션값
	public String isLogin(String page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		} 
		return page;
	}
	
	
}
