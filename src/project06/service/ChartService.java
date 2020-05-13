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
		
		public ArrayList<Chart> chartList(){
			return dao.chartList();
		}
}
