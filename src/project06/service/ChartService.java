package project06.service;

import java.util.ArrayList;
import java.util.Date;

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
		
		public ArrayList<Chart> chartListTm(int pno, int mno){
			//화면에 반환할 객체배열
			ArrayList<Chart> clisttmfinal = new ArrayList<Chart>();
			//반환할 객체배열에 순차적으로 데이터를 입력할 객체배열
			ArrayList<Chart> clisttm = new ArrayList<Chart>(); 
			//팀원이 해당 프로젝트(pno)에 가진 refno를 자신의 사원번호(mno) 조회 -> int객체배열로 호출
			ArrayList<Integer> tmRefno = dao.getRefno(mno); 
			//tmRefno의 refno수만큼 데이터 입력 객체배열에 차트 정보를 받아서 반환 객체배열에 추가(누적)
			for(int refno : tmRefno) {
				clisttm = dao.chartListtm(pno, mno, refno);
				for(Chart chttm : clisttm) {
					clisttmfinal.add(chttm);
				}
			}
			return clisttmfinal;
		}
}
