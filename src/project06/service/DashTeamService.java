package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.DashTeamDao;
import project06.vo.*;

@Service
public class DashTeamService {
	@Autowired(required=false)
	private DashTeamDao dao;
	public ArrayList<DashNotice> nlist(int pno) {
		System.out.println("pno : "+pno);
		return dao.nlist(pno);
	}
	public ArrayList<DashMeet> mlist(int pno) {
		return dao.mlist(pno);
	}
	public ArrayList<DashIssue> ilist(int pno) {
		return dao.ilist(pno);
	}
	public ArrayList<DashRe> rlist(int pno) {
		return dao.rlist(pno);
	}
	public ArrayList<DashTeam> tlist(int eno) {
		ArrayList<DashTeam> tasks = dao.tlist(eno);
		for(int i=0; i<tasks.size(); i++) {
			if(tasks.get(i).getGrade()<0 && (tasks.get(i).getProg() != 100 || !tasks.get(i).getTdiv().equals("결재완료")) ) {
				tasks.get(i).setGrade(2);
				continue;
			}
		}
		return tasks;
	}
	public DashProject getProject(int pno) {
		ArrayList<DashTeam> plist = dao.plist(dao.pm(pno));
		DashProject p = dao.getProject(pno);
		p.setGrade(0);
		int tleng=0;
		int prog=0;
		int dleng=0;
		for(int i=0; i<plist.size(); i++) {
			if(plist.get(i).getGrade()<0 && (plist.get(i).getProg() != 100 || !plist.get(i).getTdiv().equals("결재완료"))) {
				p.setGrade(2);
			} 
			tleng += plist.get(i).getTleng();
			if(plist.get(i).getTdiv().equals("결재완료")) {
				dleng += plist.get(i).getTleng();
				prog += 100*plist.get(i).getTleng();
			}
			else if(plist.get(i).getDleng()>0) {
				dleng += plist.get(i).getDleng();
				prog += plist.get(i).getProg()*plist.get(i).getTleng();
			}
		}
		prog = (int) prog/tleng;
		int dprog = (int)(dleng/tleng);
		if(prog+10<dprog&&p.getGrade()!=2) p.setGrade(1);
		p.setProg(prog);
		return p;
	}
}
