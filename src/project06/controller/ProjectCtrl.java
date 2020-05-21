package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("검증용 mdiv "+emp.getMdiv());
		
		d.addAttribute("elist", peservice.insList(emp));
		return "WEB-INF\\views\\main\\projectInsert.jsp";
	}
	//
	@RequestMapping(params="method=proIns")
	public String proIns(@RequestParam("proeno") int eno,  Project insp) {
		System.out.println("실행확인1 eno : "+eno);
		prservice.proIns(insp);
		//pmsemp inspe = new pmsemp();
		//inspe.setEno(eno);
		//System.out.println("실행확인2");
		//peservice.updatePm(inspe);
		
		return "WEB-INF\\views\\main\\noticeList.jsp";
	}
}
