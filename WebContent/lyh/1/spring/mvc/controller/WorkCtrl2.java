package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.service.WorkService2;
import spring.mvc.vo.Task;
import spring.mvc.vo.TaskSch;
import springweb.a03_mvc.a04_vo.Board;

@Controller
@RequestMapping("/task.do")
public class WorkCtrl2 { 
	// http://localhost:5080/springweb/task.do?method=list

		@Autowired(required=false)
		private WorkService2 service;
		
		@RequestMapping(params="method=list")
		public String list(@ModelAttribute("tsch") TaskSch sch, Model d) {
			d.addAttribute("tlist", service.list(sch));
			return "WEB-INF\\views\\mvc\\workList2.jsp";
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
		
		
		@RequestMapping(params="method=delete")
		public String delete(@RequestParam("tno") int no) {
			service.deleteTask(no);
			return "redirect:/task.do?method=list";
		}
		
		@RequestMapping(params="method=insForm")
		public String insertForm() {
			return "WEB-INF\\views\\mvc\\workInsert2.jsp";
		}
		
		@RequestMapping(params="method=insert")
		public String insert(Task ins) {
			service.insert(ins);
			return "redirect:/task.do?method=list";
		}
		
		@RequestMapping(params="method=detail")
		public String detail(@RequestParam("tno") int no, Model d) {
			d.addAttribute("task", service.getTask(no));

			
			return "WEB-INF\\views\\mvc\\workDetail2.jsp";
		}
}
