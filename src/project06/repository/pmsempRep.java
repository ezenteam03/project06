package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Repository
public interface pmsempRep {
	// CEO, CTO, PM 리스트
	public ArrayList<pmsemp> pmsempList(pmsemp sch);
	// CEO CTO설정
	public void updatepmsemp1(pmsemp upt);
	public void updatepmsemp2();
	// PM 삭제 리스트
	public ArrayList<pmsemp> pmempList(pmsemp sch);
	// PM 팀원 삭제
	public void delemp(pmsemp del);
	// 인사 사원등록
	public void insert(pmsemp ins);
	// 인사 사원정보 수정 페이지
	public pmsemp getPmsemp(int eno);
	// 인사 사원정보 수정
	public void updateEmp(pmsemp uptemp);
	// 퇴사 처리
	public int delCheck(pmsemp ckmem);
	public void delGrade1(pmsemp delG);
	public void delGrade2(pmsemp delG);
	public void delGrade3(pmsemp delG);
	
	
	
	
	
	
	
	// Jin
	public int pmsEmpCounter(pmsemp emp);
	public int pmsEmpEno(pmsemp emp);
	
	// Jin
	public int pmsEmpPassCounter(pmsemp emp);
	public int pmsEmpPass(pmsemp emp);
}
