package project06.repository;

import org.springframework.stereotype.Repository;

import project06.vo.PmsMember;
import project06.vo.pmsemp;

@Repository
public interface PmsMemberDao {

	public int pmsMemberCounter(PmsMember member);
	public PmsMember pmsMemberInfor(PmsMember member);
	public pmsemp pmsEmpInfor(int mno);
	public PmsMember pmsMemberInforAll(int mno);
	
	public void pmsMemberChangePass(PmsMember member);
	
	public int pmsInforCounter(int mno);
	public pmsemp pmsInfor(int mno);
	public void pmsMemberUpdateInfor(PmsMember member);
	
	public int projectCount(int mno);
	public String projectName(int mno);

}
