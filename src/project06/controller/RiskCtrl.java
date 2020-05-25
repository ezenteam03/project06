package project06.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.RiskService;
import project06.vo.Comment;
import project06.vo.PmsMember;
import project06.vo.Risk;
import project06.vo.RiskSch;


@Controller
@RequestMapping("/risk.do")
public class RiskCtrl {
	
	// http://localhost:5080/project06_git/risk.do?method=list
	@Autowired(required=false)
	private RiskService service;
	@RequestMapping(params="method=list")
	
	public String list(@ModelAttribute("rsch") RiskSch sch, Model d,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mno")==null) {
			return "WEB-INF\\views\\main\\login.jsp";
		}
		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		if(emp.getPno()==1001) {
			d.addAttribute("ri", 1);
		}else if(emp.getPno()==1002) {
			d.addAttribute("ri", 2);
		}else if(emp.getMdiv()==6) {
			d.addAttribute("ri", 4);
		}else {
			d.addAttribute("ri", 3);
		}
		
		d.addAttribute("rlist", service.list(sch,request));
			
		return "WEB-INF\\views\\main\\riskList.jsp";
	}
	@RequestMapping(params="method=insForm")
	public String insertForm() {
		return "WEB-INF\\views\\main\\riskInsert.jsp";
	}
	
	@RequestMapping(params="method=insert")
	public String insert(Risk insert) {
		
		service.insert(insert);
		
		return "WEB-INF\\views\\main\\riskInsert.jsp";
	}
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("ino") int ino, Model d,HttpServletRequest request) {
		d.addAttribute("risk", service.getRisk(ino, request));

		HttpSession session = request.getSession();

		PmsMember emp =(PmsMember)session.getAttribute("infor_M");
		if(emp.getMdiv()==4) {
			d.addAttribute("ri", 3);
		}else if(emp.getMdiv()==6) {
			d.addAttribute("ri", 4);
		}else {
			d.addAttribute("ri", 5);
		}
		
		return "WEB-INF\\views\\main\\riskDetail.jsp";
	}

	

	@RequestMapping(params="method=update")
	public String update(Risk upt) {
		
		service.update(upt);
		
		return "forward:/risk.do?method=detail";
	}	

	@RequestMapping(params="method=comupdate")
	public String comupdate(Risk upt2) {
		service.comupdate(upt2);
		return "forward:/risk.do?method=detail";
	}	
	
	// 다운로드 처리.
		@RequestMapping(params="method=download")
		public String download(@RequestParam("fname") String fname, 
								Model d) {
			// 탑재할 모델명은 파일명으로 설정..
			
			d.addAttribute("downloadFile", fname);
			
			return "download"; // 컨터이너에서 선언한 viewer명..
		}
	
		@RequestMapping(params="method=comment")
		public String clist(@ModelAttribute("rsch")RiskSch sch, Model d) {
			d.addAttribute("clist", service.clist(sch));
			d.addAttribute("co", 1);
			
			return "forward:/risk.do?method=detail";
		}
		// 댓글입력
		@RequestMapping(params="method=cinsert")
		public String cinsert(Comment insert) {
			
			service.cinsert(insert);
			
			return "forward:/risk.do?method=comment";
		}
		// 댓글 삭제
		@RequestMapping(params="method=delete")
		public String delete(@RequestParam("rno") int rno) {
			service.deleteComment(rno);
			return "WEB-INF\\views\\main\\riskDetail.jsp";
		}
		// 댓글 상세
		@RequestMapping(params="method=cdetail")
		public String cdetail(@RequestParam("rno") int rno, Model d) {
			d.addAttribute("comment", service.getComment(rno));
			return "WEB-INF\\views\\main\\comment.jsp";
		}
		// 댓글 수정
		@RequestMapping(params="method=cupdate")
		public String cupdate(Comment upt) {
			
			service.cupdate(upt);
			
			return "forward:/risk.do?method=detail";
		}	
		// 대댓창 열기
		@RequestMapping(params="method=cinsForm")
		public String cinsertForm() {
			return "WEB-INF\\views\\main\\commentIns.jsp";
		}
		// 대댓글입력
		@RequestMapping(params="method=ccinsert")
		public String ccinsert(Comment insert) {
				
			service.cinsert(insert);
				
			return "WEB-INF\\views\\main\\commentIns.jsp";
		}
		
	
}













