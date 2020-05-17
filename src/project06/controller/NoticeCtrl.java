package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.NoticeService;
import project06.vo.NoticeSch;

@Controller
@RequestMapping("/notice.do")
public class NoticeCtrl {
	//http://localhost:5080/project06_git/notice.do?method=list
	
	@Autowired(required=false)
	private NoticeService service;
	
	
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("nsch") NoticeSch sch, Model d) {
		System.out.println("검문소:"+sch.getCurPage());
		d.addAttribute("nlist", service.list(sch));
		return "WEB-INF\\views\\main\\noticeList.jsp";
	}
}
