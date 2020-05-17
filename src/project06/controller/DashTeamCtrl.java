package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		d.addAttribute("nlist", service.nlist(emp.getPno()));
		d.addAttribute("mlist", service.mlist(emp.getPno()));
		d.addAttribute("ilist", service.ilist(emp.getPno()));
		d.addAttribute("rlist", service.rlist(emp.getPno()));
		return "WEB-INF\\views\\main\\dashteam.jsp";
	}
	
	public String isLogin(String page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		} 
		return page;
	}
}
