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
		// 기존 CTO 권한변경 후 새로운 CTO에게 권한 부여
		public void update(pmsemp update) {
			rep.updatepmsemp2();
			rep.updatepmsemp1(update);
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
		// 인사 사원정보 수정
		public void updept(pmsemp uptdept) {
			rep.updatedept(uptdept);
		}
		public void upgrade(pmsemp uptgrade) {
			rep.updatedept(uptgrade);
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

}
