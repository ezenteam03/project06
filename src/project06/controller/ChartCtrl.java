package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.service.ChartService;
import project06.service.ProjectService;
import project06.vo.PmsMember;

@Controller
@RequestMapping("/chart.do")
public class ChartCtrl {
	@Autowired(required=false)
	private ChartService cservice;
	@Autowired(required=false)
	private ProjectService pservice;
	
	// http://localhost:6080/project06_git/chart.do?method=admin
	@RequestMapping(params="method=admin")
	public String chartadmin(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		int pno = Integer.parseInt(request.getParameter("pno"));
		d.addAttribute("project", pservice.getProject(pno));		
		
		return "WEB-INF\\views\\main\\chartadmin.jsp";
	}
		
	// http://localhost:6080/project06_git/chart.do?method=pm
	@RequestMapping(params="method=pm")
	public String chartpm(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		d.addAttribute("project", pservice.getProject(emp.getPno()));		
		
		return "WEB-INF\\views\\main\\chartpm.jsp";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=tm
	@RequestMapping(params="method=tm")
	public String charttm(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		d.addAttribute("project", pservice.getProject(emp.getPno()));
		
		return "WEB-INF\\views\\main\\charttm.jsp";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=ajaxdataadmin
		@RequestMapping(params="method=ajaxdataadmin")
		public String chtDataadmin(HttpServletRequest request, Model d) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			d.addAttribute("project", pservice.getProject(pno));
			
			d.addAttribute("chartlist", cservice.chartList(pno));
			return "pageJsonReport";
		}
	
	// http://localhost:6080/project06_git/chart.do?method=ajaxdata
	@RequestMapping(params="method=ajaxdata")
	public String chtData(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		
		d.addAttribute("chartlist", cservice.chartList(emp.getPno()));
		return "pageJsonReport";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=ajaxdatatm
		@RequestMapping(params="method=ajaxdatatm")
		public String chtDatatm(HttpServletRequest request, Model d) {
			HttpSession session = request.getSession();
			PmsMember emp =(PmsMember)session.getAttribute("infor_M");
				
			System.out.println("pno : "+emp.getPno());
			System.out.println("mno : "+emp.getMno());
			d.addAttribute("chartlist", cservice.chartListTm(emp.getPno(), emp.getMno()));
			return "pageJsonReport";
		}
}
