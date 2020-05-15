package project06.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import project06.repository.PmsMemberDao;
import project06.vo.PmsMember;

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
	
	public int changePass(PmsMember member) {
		System.out.println("PmsMemberDao changePass 실행");
		
		System.out.println("입력한 사원번호 : " + member.getMno());
		System.out.println("입력한 비밀번호 : " + member.getPass());
		
		dao.pmsMemberChangePass(member);
		System.out.println("비밀번호 update 실행");
		
		return 1;
	}
	
	
	
	
	
}
