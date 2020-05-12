package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.pmsemp;

@Repository
public interface pmsempRep {
	public ArrayList<pmsemp> pmsempList(pmsemp sch);
}
