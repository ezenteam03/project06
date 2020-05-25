package project06.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.MeetService;
import project06.vo.Meet;
import project06.vo.MeetSch;

@Controller
@RequestMapping("/meet.do")
public class MeetCtrl {
	//http://localhost:5080/project06_git/meet.do?method=list
	// http://localhost:5080/project06_git/meet.do?method=insert
	// http://localhost:5080/project06_git/meet.do?method=detail
	// http://localhost:5080/project06_git/meet.do?method=update
	// http://localhost:5080/project06_git/meet.do?method=delete
	@Autowired(required = false)
	private MeetService service;
	
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("msch") MeetSch sch, Model d) {
		d.addAttribute("mlist", service.list(sch));
		return "WEB-INF\\views\\main\\meetList.jsp";
	}
	// 상세페이지
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("mnno") int mnno, Model d) {
		System.out.println("detail mno"+mnno);
		d.addAttribute("meet", service.getMeet(mnno));
		return "WEB-INF\\views\\main\\meetDetail.jsp";
	}
	// 수정
	@RequestMapping(params="method=update")
	public String update(Meet upt) {
		service.update(upt);
		System.out.println("update 실행");
		return "forward:/meet.do?method=detail";
	}	


	@RequestMapping(params="method=Ajaxlist")
	public String ajaxlist(MeetSch sch, Model d) {
		d.addAttribute("mlist", service.list(sch));
		return "jsonReport";
	}	
	@RequestMapping(params="method=insForm")
	public String insertForm() {
		return "WEB-INF\\views\\main\\meetInsert.jsp";
	}
	@RequestMapping(params="method=insert")
	public String insert(HttpServletRequest request) {
		Meet insert = new Meet();
		
		insert.setTopic(request.getParameter("topic"));
		insert.setDetail(request.getParameter("detail"));
		insert.setEtc(request.getParameter("etc"));
		insert.setDecision(request.getParameter("decision"));
		insert.setFilenames(request.getParameter("filenames"));
		insert.setLoc(request.getParameter("loc"));
		insert.setPeople(request.getParameter("people"));
		
		//System.out.println("등록 제목:"+insert.getTopic());
		//System.out.println("파일 로딩:"+request.getParameter("filenames"));
		//System.out.println("파일 로딩:"+
		//insert.getReport()[0].getOriginalFilename());
		
		service.insert(insert);
		insert.setTopic("");
		insert.setDetail("");
		insert.setEtc("");
		insert.setDecision("");
		
		return "WEB-INF\\views\\main\\meetInsert.jsp";
	}
	

	// 다운로드 처리.
	@RequestMapping(params="method=download")
	public String download(@RequestParam("fname") String fname, 
							Model d) {
		// 탑재할 모델명은 파일명으로 설정..
		System.out.println("다운로드할 파일명:"+fname);
		d.addAttribute("downloadFile", fname);
		
		return "download"; // 컨터이너에서 선언한 viewer명..
	}
	
}
