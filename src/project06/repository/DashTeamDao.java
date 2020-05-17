package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.*;

@Repository
public interface DashTeamDao {
	public ArrayList<DashNotice> nlist(int pno);
	public ArrayList<DashMeet> mlist(int pno);
	public ArrayList<DashIssue> ilist(int pno);
	public ArrayList<DashRe> rlist(int pno);
}