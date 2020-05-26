package project06.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.WorkService2;
import project06.service.pmsempService;
import project06.vo.PmsMember;
import project06.vo.Task;
import project06.vo.TaskSch;
import project06.vo.pmsemp;

@Controller
@RequestMapping("/task.do")
public class WorkCtrl2 { 
	// http://localhost:5080/project06_git/task.do?method=list
 
		@Autowired(required=false)
		private WorkService2 service;
		
		@Autowired(required=false)
		private pmsempService peservice;
		
		@RequestMapping(params="method=list")
		public String list(@ModelAttribute("tsch") TaskSch sch, Model d,HttpServletRequest request) {
			HttpSession session = request.getSession();
		
		  if(session.getAttribute("mno")==null) { 
			  return "WEB-INF\\views\\main\\login.jsp"; }
		 
			
			PmsMember emp =(PmsMember)session.getAttribute("infor_M");
			
			sch.setMno(emp.getMno()); 
			sch.setPno(emp.getPno());
			sch.setMdiv(emp.getMdiv());
			
			if(emp.getMdiv()==5) {
				System.out.println("팀원로그인~");
				System.out.println(sch.getMno());
				System.out.println(sch.getPno());
				sch.setMdiv(emp.getMdiv());
				d.addAttribute("tlist", service.slist(sch));

				return "WEB-INF\\views\\main\\workList2.jsp";
			}else if(emp.getMdiv()==4) {
				System.out.println("PM로그인~");
				System.out.println(sch.getMno());
				System.out.println(sch.getPno());
				d.addAttribute("tlist", service.slist(sch));

				return "WEB-INF\\views\\main\\workList2.jsp";
			}else if(emp.getMdiv()==7) {
				System.out.println("관리자 로그인~");
				System.out.println(sch.getMno());
				System.out.println(sch.getPno());
				d.addAttribute("tlist", service.slist(sch));

				return "WEB-INF\\views\\main\\workList2.jsp";
			}else {
				System.out.println("ㄴㄴ");
				d.addAttribute("tlist", service.list(sch));
				return "WEB-INF\\views\\main\\workList2.jsp";
			}
			//d.addAttribute("tlist", service.list(sch));
			
		}
		
		
		@RequestMapping(params="method=update")
		public String update(Task upt) {
			service.update(upt);
			return "forward:/task.do?method=detail";
		}	
		
		@RequestMapping(params="method=coment")
		public String coment(Task upt) {
			service.coment(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=prog")
		public String prog(Task upt) {
			service.prog(upt);
			return "forward:/task.do?method=detail"; 
		}
		
		@RequestMapping(params="method=upTdiv")
		public String upTdiv(Task upt) {
			System.out.println("ctrl tdiv 실행");
			service.upTdiv(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=upTdiv2")
		public String upTdiv2(Task upt) {
			service.upTdiv2(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=upTdiv3")
		public String upTdiv3(Task upt) {
			service.upTdiv3(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=upTdiv4")
		public String upTdiv4(Task upt) {
			service.upTdiv3(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=upDetail")
		public String upDetail(Task upt) {
			service.upDetail(upt);
			return "forward:/task.do?method=detail"; 
		}
		@RequestMapping(params="method=progUdt")
		public String progUdt(Task upt) {
			service.progUdt(upt);
			return "forward:/task.do?method=detail";
		}
		
		
		@RequestMapping(params="method=delete")
		public String delete(@RequestParam("tno") int no) {
			service.deleteTask(no);
			return "redirect:/task.do?method=list";
		}
		
		@RequestMapping(params="method=insForm")
		public String insertForm(Model d, HttpServletRequest request) {
			HttpSession session = request.getSession();
			pmsemp emp =(pmsemp)session.getAttribute("emp");
			
			d.addAttribute("pmsElist",peservice.pmsElist(emp));
			
			
			
			return "WEB-INF\\views\\main\\workInsert2.jsp";
		}
		
		@RequestMapping(params="method=insert")
		public String insert(Task ins, Model d, HttpServletRequest request) {
			HttpSession session = request.getSession();
			pmsemp emp =(pmsemp)session.getAttribute("emp");
			
			//d.addAttribute("pmsElist",peservice.pmsElist(emp));
			//d.addAttribute("pName",emp.getName());
			
			
			service.insert(ins);
			return "redirect:/task.do?method=list";
		}
		
		
		
		@RequestMapping(params="method=detail")
		public String detail(@RequestParam("tno") int no,Task sch, Model d, HttpServletRequest request) {
			
		
			d.addAttribute("nlist", service.nameList(sch));
			d.addAttribute("task", service.getTask(no));
			
			HttpSession session = request.getSession();

			PmsMember emp =(PmsMember)session.getAttribute("infor_M");

			pmsemp pe =(pmsemp)session.getAttribute("emp");
			
			d.addAttribute("pmsElist",peservice.pmsElist(pe));
			
			d.addAttribute("grade", pe.getGrade());
			d.addAttribute("mname", pe.getName());
			
			d.addAttribute("mno", emp.getMno());
			
			d.addAttribute("mdiv", emp.getMdiv());

			return "WEB-INF\\views\\main\\workDetail2.jsp";
		}
		
		// http://localhost:5080/project06_git/task.do?method=applist

		@RequestMapping(params="method=applist") 
		public String perforlist(Task sch, Model d) {
			d.addAttribute("wlist", service.workList(sch));
			return "WEB-INF\\views\\main\\pfSearch.jsp";
		}
}
