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
}
