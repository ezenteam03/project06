package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.ChartDao;
import project06.repository.pmsempRep;
import project06.vo.Chart;
import project06.vo.pmsemp;
import project06.vo.pmsempSch;

@Service
public class ChartService {
		@Autowired(required=false)
		private ChartDao dao;
		
		public ArrayList<Chart> chartList(int pno){
			return dao.chartList(pno);
		}
		//수정 필요
		public ArrayList<Chart> chartListTm(int mno, int pno){
			ArrayList<Chart> clisttm = new ArrayList<Chart>();
			
			ArrayList<Integer> tmRefno = dao.getRefno(mno);
			
			clisttm = dao.chartList(pno);
			return clisttm;
		}
}
