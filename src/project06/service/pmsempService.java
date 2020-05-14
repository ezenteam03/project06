package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.pmsempRep;
import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Service
public class pmsempService {
		@Autowired(required=false)
		private pmsempRep rep;
		
		public ArrayList<pmsemp> pmsempList(pmsemp sch){
			return rep.pmsempList(sch);
		}
		public ArrayList<pmsemp> pmempList(pmsemp sch){
			return rep.pmempList(sch);
		}
		public void insert(pmsemp ins) {
			rep.insert(ins);
		}
		public void update(pmsemp update) {
			rep.updatepmsemp2();
			rep.updatepmsemp1(update);
			
		}

}
