package project06.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.repository.PmsMemberDao;
import project06.vo.PmsMember;
import project06.vo.pmsemp;

@Service
public class PmsMemberService {
	@Autowired(required = false)
	private PmsMemberDao dao;
	
	public int memberInfor(PmsMember member) {
		System.out.println("PmsMemberDao memberInfor 실행");
		
		System.out.println("입력한 사원번호 : " + member.getMno());
		System.out.println("입력한 비밀번호 : " + member.getPass());
		
		int count = dao.pmsMemberCounter(member);
		System.out.println("로그인 count : " + count);
		
		PmsMember mem = null;
		int mno = 0;
		System.out.println("mno : " + mno);
		
		if(count != 0) {
			mem = dao.pmsMemberInfor(member);
			mno = mem.getMno();
			System.out.println("sql 결과 사원번호 : " + mem.getMno());
			System.out.println("sql 결과 비밀번호 : " + mem.getPass());
		}
		
		return mno;
	}
	
	public pmsemp empInfor(int mno) {
		System.out.println("PmsMemberDao empInfor 실행");
		return dao.pmsEmpInfor(mno);
	}
	public PmsMember memberInforAll(int mno) {
		System.out.println("PmsMemberDao memberInforAll 실행");
		return dao.pmsMemberInforAll(mno);
	}
	public String projectName(int mno) {
		System.out.println("PmsMemberDao projectName 실행");
		int count = dao.projectCount(mno);
		String proName = "";
		if(count != 0) {
			proName = dao.projectName(mno);
		}
		return proName;
	}
	
	public int changePass(PmsMember member) {
		System.out.println("PmsMemberDao changePass 실행");
		
		System.out.println("입력한 사원번호 : " + member.getMno());
		System.out.println("입력한 비밀번호 : " + member.getPass());
		
		dao.pmsMemberChangePass(member);
		System.out.println("비밀번호 update sql 실행");
		
		return 1;
	}
	
	public pmsemp outInfor(int mno) {
		System.out.println("PmsMemberDao outInfor 실행");
		
		int count = dao.pmsInforCounter(mno);
		pmsemp outEmp = null;
		if(count != 0) {
			outEmp = dao.pmsInfor(mno);
		}
		return outEmp;
	}
	
	public void updateInfor(PmsMember member) {
		System.out.println("PmsMemberDao updateInfor 실행");
		
		dao.pmsMemberUpdateInfor(member);
		System.out.println("updateInfor sql 실행");
		
	}
	

	
	
	
	
}
