package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.WorkService2;
import project06.vo.Task;
import project06.vo.TaskSch;

@Controller
@RequestMapping("/task.do")
public class WorkCtrl2 { 
	// http://localhost:5080/project06_git/task.do?method=list
 
		@Autowired(required=false)
		private WorkService2 service;
		
		@RequestMapping(params="method=list")
		public String list(@ModelAttribute("tsch") TaskSch sch, Model d) {
			d.addAttribute("tlist", service.list(sch));
			return "WEB-INF\\views\\main\\workList2.jsp";
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
			System.out.println("ctrl prog 실행");
			service.prog(upt);
			return "forward:/task.do?method=detail"; 
		}
		
		@RequestMapping(params="method=upTdiv")
		public String upTdiv(Task upt) {
			System.out.println("ctrl tdiv 실행");
			service.upTdiv(upt);
			return "forward:/task.do?method=detail"; 
		}
		
		
		@RequestMapping(params="method=delete")
		public String delete(@RequestParam("tno") int no) {
			service.deleteTask(no);
			return "redirect:/task.do?method=list";
		}
		
		@RequestMapping(params="method=insForm")
		public String insertForm() {
			return "WEB-INF\\views\\main\\workInsert2.jsp";
		}
		
		@RequestMapping(params="method=insert")
		public String insert(Task ins) {
			service.insert(ins);
			return "redirect:/task.do?method=list";
		}
		
		@RequestMapping(params="method=detail")
		public String detail(@RequestParam("tno") int no, Model d) {
			d.addAttribute("task", service.getTask(no));

			
			return "WEB-INF\\views\\main\\workDetail2.jsp";
		}
}
