package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.DashNotice;

@Repository
public interface DashTeamDao {
	public ArrayList<DashNotice> nlist(int pno);
}
