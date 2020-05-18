package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.EmpLog;
import project06.vo.EmpLogSch;

@Repository
public interface EmpLogDao {
	
	public int empLogCount(EmpLogSch Sch);
	public ArrayList<EmpLog> logList(EmpLogSch Sch);
	
}
