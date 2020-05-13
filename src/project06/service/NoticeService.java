package project06.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project06.repository.NoticeDao;
import project06.vo.Notice;

@Service
public class NoticeService {
	@Autowired(required=false)
	private NoticeDao dao;
	
	public ArrayList<Notice> list(){
		return dao.list();
	}
}
