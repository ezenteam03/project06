package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.MeetDao;
import project06.vo.Meet;

@Service
public class MeetService {
	@Autowired(required=false)
		private MeetDao dao;
	
		public ArrayList<Meet> list(){
			return dao.list();
		}
	

}
