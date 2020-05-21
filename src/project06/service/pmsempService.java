package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
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
			System.out.println("시작번호:"+sch.getStart());
			System.out.println("마지막번호:"+sch.getEnd());		
			// 페이지에 보일 블럭 갯수
			sch.setBlocksize(3);
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
		// 기존 CTO 권한변경 후 새로운 CTO에게 권한 부여
		public void updateCto(pmsemp updateCto) {
			int isMem = rep.memCheck(updateCto);
			System.out.println("isMem : "+isMem);
			if(isMem==0) {
				// 기존 CTO권한 변경
				rep.updatepmsemp2();
				// 새로운 CTO Member등록
				updateCto.setPass(makePass("1234qwer!"));
				System.out.println("service eno:"+updateCto.getEno());
				System.out.println("service pass:"+updateCto.getPass());
				System.out.println("service phone:"+updateCto.getPhone());
				System.out.println("service pno:"+updateCto.getPno());
				System.out.println("service mdiv:"+updateCto.getMdiv());
				rep.insertMem1(updateCto);
			}else{
				rep.updatepmsemp2();
				rep.updatepmsemp1(updateCto);	
			}
		}
		// 기존 PM 권한변경 후 새로운 PM에게 권한 부여
		public void updatePm(pmsemp updatePm) {
			System.out.println("service PM설정");
			int isMem = rep.memCheck(updatePm);
			System.out.println("isMem : "+isMem);
			if(isMem==0) {
				// 기존 PM권한 변경
				rep.updatePm2(updatePm);
				// 새로운 PM Member등록
				updatePm.setPass(makePass("1234qwer!"));
				System.out.println("service eno:"+updatePm.getEno());
				System.out.println("service pass:"+updatePm.getPass());
				System.out.println("service phone:"+updatePm.getPhone());
				System.out.println("service pno:"+updatePm.getPno());
				System.out.println("service mdiv:"+updatePm.getMdiv());
				rep.insertMem2(updatePm);
			}else{
				rep.updatePm2(updatePm);
				rep.updatePm1(updatePm);	
			}
		}
		
		// PM 추가리스트
		public ArrayList<pmsemp> insList(pmsemp sch){
			return rep.insList2(sch);
		}
		
		// PM 추가리스트
		public ArrayList<pmsemp> insList(pmsempSch sch){
			sch.setCount(rep.totCnt(sch));
			if(sch.getPageSize()==0) {
				// 페이지에 보일 데이터 건수
				sch.setPageSize(3);
			}
			sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			System.out.println("시작번호:"+sch.getStart());
			System.out.println("마지막번호:"+sch.getEnd());		
			// 페이지에 보일 블럭 갯수
			sch.setBlocksize(3);
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
				insertPm.setPass(makePass("1234qwer!"));
				rep.insPNum(insertPm);
			}else{
				rep.updPNum(insertPm);
			}
		}
		// PM 삭제리스트
		public ArrayList<pmsemp> pmempList(pmsemp sch){
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
}
