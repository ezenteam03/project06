package project06.vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Risk {

	private int cnt;
	private int ino; /* 이슈번호 */
	private String title; /* 제목 */
	private String detail; /* 내용 */
	private int views; 		/* 조회수 */
	private String coment;  /* 해결방안 */
	private String name;  /* 작성자 */
	private Date wdate;/* 작성일 */
	private Date chdate;/* 수정일 */
	private Date cdate; /* 해결방안작성일 */	
	private int pno; /* 프로젝트번호 */
	private int mno; /* 사원번호 */
	
	private int refno; // 답글번호
	

	


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	// 파일 등록 처리 객체
	private MultipartFile[] report;
	private ArrayList<String> filenames; 
	// 파일 로딩 정보 가지고 오기
	private String[] fnames;  
	
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public Date getChdate() {
		return chdate;
	}
	public void setChdate(Date chdate) {
		this.chdate = chdate;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public ArrayList<String> getFilenames() {
		return filenames;
	}
	public void setFilenames(ArrayList<String> filenames) {
		this.filenames = filenames;
	}
	public String[] getFnames() {
		return fnames;
	}
	public void setFnames(String[] fnames) {
		this.fnames = fnames;
	}
	
	

}
