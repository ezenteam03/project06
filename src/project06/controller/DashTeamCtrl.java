package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import project06.service.*;
import project06.vo.*;

@Controller
@RequestMapping("/DashTeam.do")
public class DashTeamCtrl {
	// http://localhost:7080/project06_git/DashTeam.do?method=list
	
	@Autowired(required=false)
	private DashTeamService service;
	
	@RequestMapping(params="method=list")
	public String list(Model d, HttpServletRequest request) { 
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		System.out.println(emp.getPno());
		if(emp.getMdiv()==5) {
			d.addAttribute("nlist", service.nlist(emp.getPno()));
			d.addAttribute("mlist", service.mlist(emp.getPno()));
			d.addAttribute("ilist", service.ilist(emp.getPno()));
			d.addAttribute("rlist", service.rlist(emp.getPno()));
			d.addAttribute("tlist", service.tlist(emp.getMno()));
			d.addAttribute("pro", service.getProject(emp.getPno()));
			return "WEB-INF\\views\\main\\dashteam.jsp";
		} else if(emp.getMdiv()==4) {
			d.addAttribute("nlist", service.nlist(emp.getPno()));
			d.addAttribute("mlist", service.mlist(emp.getPno()));
			d.addAttribute("ilist", service.ilist(emp.getPno()));
			d.addAttribute("rlist", service.rlist(emp.getPno()));
			d.addAttribute("teamlist", service.teamlist(emp.getPno()));
			d.addAttribute("pro", service.getProject(emp.getPno()));
			return "WEB-INF\\views\\main\\dashpm.jsp";
		} else if(emp.getMdiv()==7) {
			return "WEB-INF\\views\\main\\top.jsp";
		} else {
			d.addAttribute("clist", service.clist());
			return "WEB-INF\\views\\main\\dashceo.jsp";
		}	
	}
}
