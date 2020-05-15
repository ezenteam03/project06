package project06.repository;

import org.springframework.stereotype.Repository;

import project06.vo.PmsMember;

@Repository
public interface PmsMemberDao {

	public int pmsMemberCounter(PmsMember member);
	public PmsMember pmsMemberInfor(PmsMember member);
	
	public void pmsMemberChangePass(PmsMember member);

}
