package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project06.service.RiskService;
import project06.vo.Comment;
import project06.vo.Risk;
import project06.vo.RiskSch;




@Controller
@RequestMapping("/risk.do")
public class RiskCtrl {
	
	// http://localhost:5080/project06_git/risk.do?method=list
	@Autowired(required=false)
	private RiskService service;
	@RequestMapping(params="method=list")
	public String list(@ModelAttribute("rsch") RiskSch sch, Model d) {
		d.addAttribute("rlist", service.list(sch));
			
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
	public String detail(@RequestParam("ino") int ino, Model d) {
		d.addAttribute("risk", service.getRisk(ino));
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
			
			
			return "forward:/risk.do?method=detail";
		}
		// 댓글입력
		@RequestMapping(params="method=cinsert")
		public String cinsert(Comment insert) {
			
			service.cinsert(insert);
			
			return "forward:/risk.do?method=comment";
		}
	
	
}













