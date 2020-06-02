package project06.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import project06.service.*;
import project06.vo.*;

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
	public String list(@ModelAttribute("nsch") NoticeSch sch, Model d,HttpServletRequest request) {
		System.out.println("검문소:"+sch.getCurPage());
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		PmsMember m = (PmsMember) session.getAttribute("infor_M");
		sch.setPno(m.getPno());
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
	
	//안드로이드 db 연결
	//http://localhost:5080/project06_git/notice.do?method=applist
	@RequestMapping(params="method=applist") 
	public String andlist(Notice sch, Model d) {
		d.addAttribute("andlist", service.andlist(sch));
		return "WEB-INF\\views\\main\\andNotice.jsp";
	}
	
}
