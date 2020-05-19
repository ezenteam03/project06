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
		public ArrayList<pmsemp> pmsempList(pmsemp sch){
			return rep.pmsempList(sch);
		}
		// CEO, CTO 상세
		public pmsemp getemp(int eno) {
			System.out.println("service eno : "+eno);
			pmsemp a = rep.getemp(eno);
			return a;
		}
		// 기존 CTO 권한변경 후 새로운 CTO에게 권한 부여
		public void updateCto(pmsemp updateCto) {
			int isMem = rep.memCheck(updateCto);
			if(isMem==0) {
				// 기존 CTO권한 변경
				rep.updatepmsemp2();
				// 새로운 CTO Member등록
				updateCto.setPass(makePass());
				rep.insertMem1(updateCto);
			}else{
				rep.updatepmsemp2();
				rep.updatepmsemp1(updateCto);	
			}
		}
		// 기존 PM 권한변경 후 새로운 PM에게 권한 부여
		public void updatePm(pmsemp updatePm) {
			int isMem = rep.memCheck(updatePm);
			if(isMem==0) {
				// 기존 CTO권한 변경
				rep.updatePm2();
				// 새로운 CTO Member등록
				rep.insertMem2(updatePm);
			}else{
				rep.updatePm2();
				rep.updatePm1(updatePm);	
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
		public String makePass() {
			return "";
		}
}
