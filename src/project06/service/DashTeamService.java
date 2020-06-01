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
		if(plist.size()==0) {
			prog=0;
		} else {
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
			int dprog=0;
			if(tleng!=0) {
				prog = (int) prog/tleng;
				dprog = (int)(dleng/tleng);
			} 		
			if(prog+10<dprog&&p.getGrade()==0) p.setGrade(1);
		}
		p.setProg(prog);
		System.out.println(p.getGrade());
		return p;
	}
	public ArrayList<DashTeam> teamlist(int pno) {
		ArrayList<DashTeam> tl = dao.teamlist(pno);
		ArrayList<DashTeam> teaml = new ArrayList<DashTeam>();
		System.out.println("teamlist : " + tl.size());
		DashTeam team = null;
		for(int i=0; i<tl.size(); i++) {
			ArrayList<DashTask> tasks = dao.tlist(tl.get(i).getEno());
			int prog = 0;
			team = tl.get(i);
			int t = 0;
			System.out.println(team.getEno());
			System.out.println(team.getName());
			for(int j=0; j<tasks.size(); j++) {
				int dprog = (int)((tasks.get(j).getDleng()<0?0:tasks.get(j).getDleng()*100)/tasks.get(j).getTleng());
				System.out.println("dprog : "+dprog);
				System.out.println("전 : "+tasks.get(j).getGrade());
				prog += tasks.get(j).getProg();
				if(tasks.get(j).getGrade()<0 && (tasks.get(j).getProg() != 100 || !tasks.get(j).getTdiv().equals("결재완료")) ) {
					team.setGrade(2);
					t=2;					
				} else if(tasks.get(j).getProg()<(dprog>100?100:dprog)) {
					t=1;
				}
			}
			prog = (int)(prog/tasks.size());
			if(team.getGrade()!=2) team.setGrade(t);
			team.setProg(prog);
			System.out.println(team.getProg());
			
			System.out.println(team.getGrade());
			
			teaml.add(team);
		}
		return teaml;
	}
	public ArrayList<DashCeo> clist() {
		ArrayList<DashCeo> ceolist = new ArrayList<DashCeo>();
		ArrayList<Integer> ilist = dao.ilist2();
		System.out.println("clist service");
		for(int i=0; i<ilist.size(); i++) {
			DashProject p = getProject(ilist.get(i));
			System.out.println("i : "+i);
			DashCeo c = new DashCeo();
			int total=0;
			int done=0;
			int cp=0;
			int dcnt=0;
			int dp=0;
			int ocnt=0;
			int op=0;
			if(p.getProg()!=0) {
				total = dao.t1(ilist.get(i));
				System.out.println(total);
				done = dao.t2(ilist.get(i));
				System.out.println(done);
				cp = (int)(done*100/total);
				dcnt = total-done-dao.t3(ilist.get(i));
				System.out.println(dcnt);
				dp = (int)(dcnt*100/(total-done));
				ocnt = dao.t4(ilist.get(i));
				System.out.println(ocnt);
				op = (int)(ocnt*100/done);
			} 			
			
			c.setPno(ilist.get(i));
			c.setPro(p);
			c.setTotal(total);
			c.setCcnt(done);
			c.setCp(cp);
			c.setDcnt(dcnt);
			c.setDp(dp);
			c.setOcnt(ocnt);
			c.setOp(op);
			ceolist.add(c);
		}
		return ceolist;
	}
}
