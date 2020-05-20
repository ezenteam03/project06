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
		//수정 필요
		public ArrayList<Chart> chartListTm(int pno, int mno){
			ArrayList<Chart> clisttmfinal = new ArrayList<Chart>(); //화면에 반환할 객체
			ArrayList<Chart> clisttm = new ArrayList<Chart>();
			ArrayList<Integer> tmRefno = dao.getRefno(mno); //1008 1009 1011
			//tmRefno의 내용물 수만큼 chartListtm을 실행
			for(int refno : tmRefno) {
				System.out.println("pno : "+pno);
				System.out.println("mno : "+mno);
				System.out.println("refno : "+refno);
				clisttm = dao.chartListtm(pno, mno, refno);
				for(Chart chttm : clisttm) {
					clisttmfinal.add(chttm);
				}
			}
			//검증용데이터
			/*
			for(Chart chttmf : clisttmfinal) {
				System.out.print("tname : "+chttmf.getTname()+"\t");
				System.out.print("tno : "+chttmf.getTno()+"\t");
				System.out.print("refno : "+chttmf.getRefno()+"\t");
				System.out.print("pno : "+chttmf.getPno()+"\t");
				System.out.print("pname : "+chttmf.getPname()+"\t");
				System.out.print("sdateorigin : "+chttmf.getSdateorigin()+"\t");
				System.out.print("edateorigin : "+chttmf.getEdateorigin()+"\t");
				System.out.print("sdate : "+chttmf.getSdate()+"\t");
				System.out.print("edate : "+chttmf.getEdate()+"\t");
				System.out.print("prog : "+chttmf.getProg()+"\t");
				System.out.println("name : "+chttmf.getName());
			}
			*/
			return clisttmfinal;
		}
}
