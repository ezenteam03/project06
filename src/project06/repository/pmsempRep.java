package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Repository
public interface pmsempRep {
	// CEO, CTO, PM 리스트
	public ArrayList<pmsemp> pmsempList(pmsemp sch);
	// PM 삭제 리스트
	public ArrayList<pmsemp> pmempList(pmsemp sch);
	// CEO, CTO 사원추가
	public void insert(pmsemp ins);
	// CEO CTO설정
	public void updatepmsemp1(pmsemp upt);
	public void updatepmsemp2();
	// PM 팀원 삭제
	public void delemp(pmsemp del);
	
	// Jin
	public int pmsEmpCounter(pmsemp emp);
	public int pmsEmpEno(pmsemp emp);
}
