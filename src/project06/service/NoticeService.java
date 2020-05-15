package project06.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project06.repository.NoticeDao;
import project06.vo.Notice;
import project06.vo.NoticeSch;

@Service
public class NoticeService {
	@Autowired(required=false)
	private NoticeDao dao;
	public ArrayList<Notice> list(NoticeSch sch){
				// 1. 데이터 총건수
				sch.setCount(dao.totCnt(sch));
				// 2. 화면에 한번에 보여줄 데이터 건수 초기값 5
				//	  다음 부터는  선택된 페이지 데이터 건수에 의해서 처리..0
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				}
				// 3. 총페이지 수 : 총건수/한번에보여줄데이터
				//                  17/5  ==> 4
				//                  20/5  ==> 4
				//                  21/5  ==> 5
				// 총건수/페이지크기를실수로처리 나머지가 있게 한 후,
				// 올림 처리..
				//int totPage = (int)(Math.ceil(sch.getCount()/(double)sch.getPageSize()));
				sch.setPageCount((int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())));
				//  4. 현재 클릭한 페이지 초기값.
				System.out.println("curpage값:"+sch.getCurPage());
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				System.out.println("curpage값(수정):"+sch.getCurPage());
				/*
				현재 페이지 번호, 1
				페이지당 보일 데이터 건수 5
				화면에 나타날 데이터  1~5
				1	5	1 2 3 4 5    시작번호 1, 마지막번호 5
				2   5   6 7 8 9 10   시작번호 6, 마지막번호 10
				3   5   1112131415   시작번호 11, 마지막번호 15
				마지막번호 ? 클릭한 페이지번호 * 페이지당 보일 데이터 건수 
				시작번호 ? (클릭한 페이지번호 -1)*페이지당 보일 데이터 건수+1
				 			(1-1)*5 +1  :1
				 			(2-1)*5 +1  :6
				 			(3-1)*5 +1  :11
				 * */
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				System.out.println("시작번호:"+sch.getStart());
				System.out.println("마지막번호:"+sch.getEnd());
				// block을 위한 속성값 설정.
				// 1. 초기 block size(한번에 보일 block의 크기) 설정.
				sch.setBlocksize(5);
				/* 
				1 2 3 4 5  ==> blocknum 1
				6 7 8 9 10 ==> blocknum 2
				111213     ==> blocknum 3
				   2. blocknum는  현재 페이지번호/블럭의 크기를 올림 처리.
				   
				   1/5, 2/5, 3/5, 4/5 5/5 ==> 1 
				   6/5  7/5  8/5  9/5 10/5 ==> 2
				 * */
				int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlocksize());
		/*		   3. blocksize가 5를 기준으로 
				1 2 3 4 5  ==> blocknum 1
				6 7 8 9 10 ==> blocknum 2
				111213     ==> blocknum 3 일때,
				시작페이지번호와 마지막페이지번호   
					1) 블럭의 마지막번호는  블럭의크기 * blocknum
						단, 마지막페이지번호보다 클 수 없다.
						마지막블럭번호는 페이지 크기보다 클때는
						페이지 크기를 마지막 블럭 번호로 설정한다.
						==> 3항 연산자로 간단하게 처리..
		 * */
				int endBlock = blocknum*sch.getBlocksize();
				sch.setEndBlock(endBlock>sch.getPageCount()?
								sch.getPageCount():endBlock);
				// 시작번호는 현재블럭의 번호 ( blocknum - 1)*현재블럭크기 + 1
				System.out.println("블럭번호:"+blocknum);
				sch.setStartBlock((blocknum-1)*sch.getBlocksize()+1);
				System.out.println("시작 block번호:"+sch.getStartBlock());
				System.out.println("마지막 block번호:"+sch.getEndBlock());
				
				
				
				
				return dao.list(sch);
			}
}
