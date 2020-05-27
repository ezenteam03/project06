package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.ProjectService;
import project06.service.pmsempService;
import project06.vo.PmsMember;
import project06.vo.Project;
import project06.vo.pmsemp;


@Controller
@RequestMapping("project.do")
public class ProjectCtrl {
	
	@Autowired(required=false)
	private ProjectService prservice;
	@Autowired(required=false)
	private pmsempService peservice;
	
	// http://localhost:5080/project06_git/project.do?method=insert
	@RequestMapping(params="method=insert")
	public String insert(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		pmsemp emp =(pmsemp)session.getAttribute("emp");
		PmsMember pmsm =(PmsMember)session.getAttribute("infor_M");
		
		emp.setMdiv(pmsm.getMdiv());
		//모든 사원이 프로젝트에 참여중일 경우 사원이 없음을 표시하는 로직 필요
		//현재 프로젝트에 소속되어있지 않은 대리급 이상 사원리스트 호출
		d.addAttribute("elist", peservice.insList(emp));
		return "WEB-INF\\views\\main\\projectInsert.jsp";
	}
	//
	@RequestMapping(params="method=proins")
	public String proIns(HttpServletRequest request) {
		int mno = Integer.parseInt(request.getParameter("pro_mno"));
		
		Project insp = new Project();
		pmsemp inspe = new pmsemp();
		Project insertedp = new Project();
		
		insp.setPname(request.getParameter("pro_pname"));
		insp.setMno(mno); //프로젝트 매니저 번호
		insp.setSdatestr(request.getParameter("pro_sdate"));
		insp.setDeadlinestr(request.getParameter("pro_dline"));
		insp.setDetail(request.getParameter("pro_detail"));
		//프로젝트 추가
		prservice.proIns(insp);
		//방금 추가한 프로젝트를 불러오기
		System.out.println("프로젝트 추가 mno : "+mno);
		insertedp = prservice.getProjectformno(mno); 
		
		inspe.setEno(mno);
		inspe.setPno(insertedp.getPno());
		//회원의 PM 권한변경 수행
		peservice.updatePm(inspe);
		
		return "WEB-INF\\views\\main\\dashceo.jsp";
	}
}
