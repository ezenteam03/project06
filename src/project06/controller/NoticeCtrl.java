package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.NoticeService;

@Controller
@RequestMapping("/notice.do")
public class NoticeCtrl {
	@Autowired(required=false)
	private NoticeService service;
	
	//http://localhost:5080/project06_git/notice.do?method=list
	@RequestMapping(params="method=list")
	public String list(Model d) {
		d.addAttribute("nlist", service.list());
		return "WEB-INF\\views\\main\\noticeList.jsp";
	}
}
