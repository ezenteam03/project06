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
	public ArrayList<DashTask> tlist(int eno) {
		ArrayList<DashTask> tasks = dao.tlist(eno);
		System.out.println("tlist");
		System.out.println(tasks.size());
		ArrayList<DashTask> ts = new ArrayList<DashTask>();
		for(int i=0; i<tasks.size(); i++) {
			int dprog = (int)((tasks.get(i).getDleng()<0?0:tasks.get(i).getDleng()*100)/tasks.get(i).getTleng());
			System.out.println("dprog : "+dprog);
			System.out.println("전 : "+tasks.get(i).getGrade());
			DashTask t = tasks.get(i);
			if(tasks.get(i).getGrade()<0 && (tasks.get(i).getProg() != 100 || !tasks.get(i).getTdiv().equals("결재완료")) ) {
				t.setGrade(2);
			} else if(tasks.get(i).getProg()<(dprog>100?100:dprog)) {
				t.setGrade(1);
			} else {
				t.setGrade(0);
			}
			ts.add(tasks.get(i));
		}
		for(int i=0; i<ts.size(); i++) {
			System.out.println(ts.get(i).getGrade());
		}
		return ts;
	}
	public DashProject getProject(int pno) {
		System.out.println("getProject");
		ArrayList<DashTask> plist = dao.plist(dao.pm(pno));
		System.out.println(plist.size());
		DashProject p = dao.getProject(pno);
		System.out.println(p.getPm());
		p.setGrade(0);
		int tleng=0;
		int prog=0;
		int dleng=0;
		for(int i=0; i<plist.size(); i++) {
			System.out.println("plist.get(i).getGrade() : "+plist.get(i).getGrade());
			if(plist.get(i).getGrade()<0 && (plist.get(i).getProg() != 100 || !plist.get(i).getTdiv().equals("결재완료"))) {
				p.setGrade(2);
				System.out.println(p.getGrade());
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
		if(prog+10<dprog&&p.getGrade()==0) p.setGrade(1);
		p.setProg(prog);
		System.out.println(p.getGrade());
		return p;
	}
	public ArrayList<DashTeam> teamlist(int pno) {
		ArrayList<DashTeam> tl = dao.teamlist(pno);
		
		return tl;
	}
}
