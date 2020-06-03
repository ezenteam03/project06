package project06.service;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import project06.repository.pmsempRep;
import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Service
public class pmsempService {
		@Autowired(required=false)
		private pmsempRep rep;
		// CEO, CTO 사원리스트
		public ArrayList<pmsemp> pmsempList(pmsempSch sch){
			sch.setCount(rep.totCnt(sch));
			if(sch.getPageSize()==0) {
				// 페이지에 보일 데이터 건수
				sch.setPageSize(5);
			}
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			// 페이지에 보일 블럭 갯수
			sch.setBlocksize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());					
			int endBlock = blocknum*sch.getBlocksize();
			sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);					
			sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);	
			return rep.pmsempList(sch);
		}
		// CEO, CTO 상세
		public pmsemp getemp(int eno) {
			System.out.println("service eno : "+eno);
			pmsemp a = rep.getemp(eno);
			return a;
		}
		// 프로젝트 리스트
		public ArrayList<Integer> getPlist(){
			return rep.getPlist();
		}
		// 직급 리스트
		public ArrayList<String> getGlist(){
			return rep.getGlist();
		}
		// 부서 리스트
		public ArrayList<String> getDlist(){
			return rep.getDlist();
		}
		String ranNum = "";
		
		// 기존 CEO 권한변경 후 새로운 CEO에게 권한 부여
		public void updateCeo(pmsemp updateCeo) {
			int isMem = rep.memCheck(updateCeo);
			if(isMem==0) {
				// 기존 CEO권한 변경
				rep.updatepmsCeo2();
				rep.updatepmsCeo3();
				// 새로운 CEO Member등록
				rep.updatepmsCeo4(updateCeo);
				ranNum = makePass("");
				updateCeo.setPass(ranNum);				
				rep.insertCeo1(updateCeo);
				try {
					sendMail(updateCeo.getEno(), ranNum);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				// 기존 CEO권한 변경
				rep.updatepmsCeo2();
				rep.updatepmsCeo3();
				// 새로운 CEO 권한 변경
				rep.updatepmsCeo1(updateCeo);	
				rep.updatepmsCeo4(updateCeo);	
			}
		}
		// 기존 CTO 권한변경 후 새로운 CTO에게 권한 부여
		public void updateCto(pmsemp updateCto) {
			int isMem = rep.memCheck(updateCto);
			if(isMem==0) {
				// 기존 CTO권한 변경
				rep.updatepmsemp2();
				// 새로운 CTO Member등록
				ranNum = makePass("");
				updateCto.setPass(ranNum);
				rep.insertMem1(updateCto);
				try {
					sendMail(updateCto.getEno(), ranNum);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				rep.updatepmsemp2();
				rep.updatepmsemp1(updateCto);	
			}
		}
		// 기존 PM 권한변경 후 새로운 PM에게 권한 부여
		public void updatePm(pmsemp updatePm) {
			int isMem = rep.memCheck(updatePm);
			if(isMem==0) {
				// 기존 PM권한 변경
				rep.updatePm2(updatePm);
				// 새로운 PM Member등록
				ranNum = makePass("");
				updatePm.setPass(ranNum);
				if(updatePm.getPno()==0) rep.insertMem3(updatePm);
				else rep.insertMem2(updatePm);
				try {
					sendMail(updatePm.getEno(), ranNum);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				rep.updatePm2(updatePm);
				if(updatePm.getPno()==0) rep.updatePm1_1(updatePm);	
				else rep.updatePm1(updatePm);	
			}
			rep.updatePm3(updatePm);
			rep.updatePm4(updatePm);
		}
		
		// PM 추가리스트, 전현규
		public ArrayList<pmsemp> selectpm(pmsempSch sch){
			System.out.println("SelectPM 실행");
			
			sch.setCount(rep.selectpmCount(sch));	// 전체 행 수 = 
			
			if(sch.getPageSize() == 0) {
				sch.setPageSize(5);			// 한번에 나오는 페이지 수 = 5
			}
			// 총 페이지 수 = 전체 행 수/한번에 나오는 페이지 수, 2 = ceil(8/5)
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
																								
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);		//클릭한 현재 페이지 번호 = 1
			}
			
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);	// ((클릭한 현재 페이지 번호 - 1) * 한번에 나오는 페이지 수 )+1 = ((1-1)*5)+1 = 1
			sch.setEnd(sch.getCurPage()*sch.getPageSize());	// 클릭한 현재 페이지 번호 * 한번에 나오는 페이지 수 = 1*5 = 5
			System.out.println("시작번호 : "+sch.getStart());
			System.out.println("마지막번호 : "+sch.getEnd());
			
			sch.setBlocksize(5);	// 블럭 사이즈 = 5
			
			// 블럭넘버=ceil(현재 페이지 / 블럭 사이즈), 1 = ceil(1/5)
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
			
			// endBlock = 5;
			int endBlock = blocknum*sch.getBlocksize();
			sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
			System.out.println("블럭번호 : "+blocknum);
			
			sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
			System.out.println(blocknum+"번째 블럭의 시작 block 번호 : " + sch.getStartBlock());
			System.out.println(blocknum+"번째 블럭의 마지막 block 번호 : " + sch.getEndBlock());
			
			return rep.selectpm(sch);
			
		}
		
		// PM 추가리스트
		public ArrayList<pmsemp> insList(pmsempSch sch){
			sch.setCount(rep.totCnt3(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(5);
			}
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			sch.setBlocksize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());					
			int endBlock = blocknum*sch.getBlocksize();
			sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);					
			sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
			return rep.insList(sch);
		}
		// PM 팀원 추가
		public void insPm(pmsemp insertPm) {
			int isMem = rep.memCheck(insertPm);
			if(isMem==0) {
				ranNum = makePass("");
				insertPm.setPass(ranNum);
				rep.insPNum(insertPm);
				try {
					sendMail(insertPm.getEno(), ranNum);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				rep.updPNum(insertPm);
			}
		}
		// PM 삭제리스트
		public ArrayList<pmsemp> pmempList(pmsempSch sch){
			sch.setCount(rep.totCnt2(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(5);
			}
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			sch.setBlocksize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());					
			int endBlock = blocknum*sch.getBlocksize();
			sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);					
			sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
			return rep.pmempList(sch);
		}
		// PM 팀원 삭제
		public void delete(pmsemp delete) {
			rep.delemp(delete);
		}
		// 사원등록
		public void insert(pmsemp ins) {
			rep.insert(ins);
		}
		// 사원정보 수정 페이지
		public pmsemp getPmsemp(int eno) {
			pmsemp d = rep.getPmsemp(eno);
			return d;
		}
		// 인사 사원정보 수정
		public void modifyEmp(pmsemp modify) {
			rep.updateEmp(modify);	
		}
		// 퇴사 처리
		public void deleteG(pmsemp deleteG) {
			int isMem = rep.memCheck(deleteG);
			if(isMem==0) {
				rep.delGrade3(deleteG);
			} else {
				rep.delGrade1(deleteG);
				rep.delGrade2(deleteG);				
			}
		}
		
		

		// Jin
		public int empEno(pmsemp emp) {
			System.out.println("empEno 실행");
			
			System.out.println("입력한 이름 : " + emp.getName());
			System.out.println("입력한 이메일 : " + emp.getEmail());
			
			int count = rep.pmsEmpCounter(emp);
			System.out.println("사원번호 count : " + count);
			
			int eno = 0;
			System.out.println("초기 eno : " + eno);
			
			if(count != 0) {
				eno = rep.pmsEmpEno(emp);
				System.out.println("sql 결과 eno : " + eno);
			}
			
			return eno;
		}
		
		//Jin
		public int empPass(pmsemp emp) {
			System.out.println("empEnoPass 실행");
			
			System.out.println("입력한 사원번호 : " + emp.getEno());
			System.out.println("입력한 이름 : " + emp.getName());
			System.out.println("입력한 이메일 : " + emp.getEmail());
			
			int count = rep.pmsEmpPassCounter(emp);
			System.out.println("사원번호Pass count : " + count);
			
			int eno = 0;
			System.out.println("초기 eno : " + eno);
			
			if(count != 0) {
				eno = rep.pmsEmpPass(emp);
				System.out.println("sql 결과 eno : " + eno);
			}
			
			return eno;
		}
		// 비밀번호 생성
		public String makePass(String pass) {
			if(pass!=null&&pass!="") {
				return pass;
			} else {
				String result = "";
				String[] chars = {"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
				for(int i=0; i<9; i++) {
					int ran = (int) (Math.random()*36);
					result += chars[ran];
				}
				System.out.println(result);
				return result;
			}
		}
		
		public ArrayList<pmsemp> pmsElist(pmsemp emp) {
			return rep.pmsElist(emp);
		}
		// 메일전송
		@Autowired(required=false)
		private JavaMailSender sender;
		public void sendMail(int eno,String ran) throws MessagingException {
			// 1. 멀티미디어형 메일데이터 전송.
			System.out.println("sendMail 시작");
			MimeMessage msg = sender.createMimeMessage();			
			// 2. 제목 설정.
			msg.setSubject("P.M.S 시스템에 등록되셨습니다.");			
			// 3. 수신자 설정.
			String mail = rep.getMail(eno);
			System.out.println(mail);
			msg.setRecipient(RecipientType.TO, new InternetAddress(mail));			
			// 4. 내용 설정
			String sendNum = "사원번호(아이디) : "+eno+"\n 비밀번호 : "+ran +"\n 로그인 후 개인정보에서 비밀번호 수정 및 희망연락처 수정 바랍니다.";			
			msg.setText(sendNum);			
			// 5. 발송 처리..
			sender.send(msg);
		}
}
