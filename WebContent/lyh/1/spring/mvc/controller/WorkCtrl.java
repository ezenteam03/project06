package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.service.WorkService;
import springweb.a03_mvc.a04_vo.Board;
import springweb.a03_mvc.a04_vo.BoardSch;

@Controller
@RequestMapping("/work.do")
public class WorkCtrl { 
	// http://localhost:5080/springweb/work.do?method=list
		// http://localhost:5080/springweb/board.do?method=insert
		// http://localhost:5080/springweb/board.do?method=detail
		// http://localhost:5080/springweb/board.do?method=update
		// http://localhost:5080/springweb/board.do?method=delete
		@Autowired(required=false)
		private WorkService service;
		@RequestMapping(params="method=list")
		public String list(@ModelAttribute("bsch") BoardSch sch, Model d) {
			d.addAttribute("blist", service.list(sch));
			
			// view resolver로 접두어와 접미어가 생략했을 때 처리..
			//return "a01_boardList";
			return "WEB-INF\\views\\mvc\\workList.jsp";
		}
		@RequestMapping(params="method=Ajaxlist")
		public String ajaxlist(BoardSch sch, Model d) {
			d.addAttribute("blist", service.list(sch));
			return "jsonReport";
		}	
		@RequestMapping(params="method=insForm")
		public String insertForm() {
			return "WEB-INF\\views\\mvc\\workInsert.jsp";
		}
		@RequestMapping(params="method=insert")
		public String insert(Board insert) {
			System.out.println("등록 제목:"+insert.getTitle());
			System.out.println("파일 로딩:"+
			insert.getReport()[0].getOriginalFilename());
			service.insert(insert);
			
			return "WEB-INF\\views\\mvc\\workInsert.jsp";
		}
		@RequestMapping(params="method=update")
		public String update(Board upt) {
			service.update(upt);
			return "forward:/work.do?method=detail";
		}	
		@RequestMapping(params="method=comt")
		public String comt(Board comt) {
			service.comt(comt);
			return "forward:/work.do?method=detail";
		}	
		@RequestMapping(params="method=delete")
		public String delete(@RequestParam("no") int no) {
			service.deleteBoard(no);
			return "redirect:/work.do?method=list";
		}
		
		@RequestMapping(params="method=detail")
		public String detail(@RequestParam("no") int no, Model d) {
			d.addAttribute("board", service.getBoard(no));
			//service.getComment(b.getRcomment());
			//System.out.println("댓글 내용:"+b.getRcomment());

			//b.setRcomment(b.getRcomment());
			
			return "WEB-INF\\views\\mvc\\workDetail.jsp";
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
		@RequestMapping(params="method=reply")
		public String reply(@ModelAttribute("board")Board b) {
			System.out.println("번호:"+b.getNo());
			System.out.println("제목:"+b.getTitle());
			System.out.println("내용:"+b.getContent());
			b.setRefno(b.getNo());
			b.setTitle("RE:"+b.getTitle());
			b.setContent("\n\n\n\n\n\n\n\n======상위글=====\n"+b.getContent());
			return "WEB-INF\\views\\mvc\\workInsert.jsp";
		}
		
		@RequestMapping(params="method=reply2")
		public String reply2(@ModelAttribute("board")Board b) {
			//System.out.println("번호:"+b.getNo());
			//System.out.println("제목:"+b.getTitle());
			
			return "WEB-INF\\views\\mvc\\workDetail.jsp";
		}
}
