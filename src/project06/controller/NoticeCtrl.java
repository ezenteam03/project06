package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.NoticeService;
import project06.vo.Notice;
import project06.vo.NoticeSch;

@Controller
@RequestMapping("/notice.do")
public class NoticeCtrl {
	//http://localhost:5080/project06_git/notice.do?method=list
	// http://localhost:5080/project06_git/notice.do?method=insert
	// http://localhost:5080/project06_git/notice.do?method=detail
	// http://localhost:5080/project06_git/notice.do?method=update
	// http://localhost:5080/project06_git/notice.do?method=delete
	
	@Autowired(required=false)
	private NoticeService service;
	
	
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("nsch") NoticeSch sch, Model d) {
		System.out.println("검문소:"+sch.getCurPage());
		d.addAttribute("nlist", service.list(sch));
		return "WEB-INF\\views\\main\\noticeList.jsp";
	}
	@RequestMapping(params="method=Ajaxlist")
	public String ajaxlist(NoticeSch sch, Model d) {
		d.addAttribute("nlist", service.list(sch));
		return "jsonReport";
	}
	
	@RequestMapping(params="method=insForm")
	public String insertForm() {
		return "WEB-INF\\views\\main\\noticeInsert.jsp";
	}
	@RequestMapping(params="method=insert")
	public String insert(Notice insert) {
		System.out.println("등록 제목:"+insert.getTitle());
		
		service.insert(insert);
		
		insert.setTitle("");
		insert.setDetail("");
		return "WEB-INF\\views\\main\\noticeInsert.jsp";
	}
	@RequestMapping(params="method=update")
	public String update(Notice upt) {
		service.update(upt);
		return "forward:/notice.do?method=detail";
	}	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("nno") int no) {
		service.deleteNotice(no);
		return "redirect:/notice.do?method=list";
	}
	
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("nno") int no, Model d) {
		d.addAttribute("notice", service.getNotice(no));
		return "WEB-INF\\views\\main\\noticeDetail.jsp";
	}
	
}
