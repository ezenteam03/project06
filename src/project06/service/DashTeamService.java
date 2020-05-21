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
		System.out.println("tlist");
		System.out.println(tasks.size());
		for(int i=0; i<tasks.size(); i++) {
			int dprog = (int)(tasks.get(i).getDleng()/tasks.get(i).getTleng());
			if(tasks.get(i).getGrade()<0 && (tasks.get(i).getProg() != 100 || !tasks.get(i).getTdiv().equals("결재완료")) ) {
				tasks.get(i).setGrade(2);
				continue;
			} else if(tasks.get(i).getProg()<dprog) tasks.get(i).setGrade(1);
			else tasks.get(i).setGrade(0);
		}
		return tasks;
	}
	public DashProject getProject(int pno) {
		System.out.println("getProject");
		ArrayList<DashTeam> plist = dao.plist(dao.pm(pno));
		System.out.println(plist.size());
		DashProject p = dao.getProject(pno);
		System.out.println(p.getPm());
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
