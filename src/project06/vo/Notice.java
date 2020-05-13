package project06.vo;

import java.util.Date;

//nno NUMBER NOT NULL, /* 공지번호 */
//title VARCHAR2(100) NOT NULL, /* 제목 */
//detail VARCHAR2(2000) NOT NULL, /* 내용 */
//wdate DATE NOT NULL, /* 작성일 */
//chdate DATE, /* 수정일 */
//views NUMBER NOT NULL, /* 조회수 */
//pno NUMBER NOT NULL, /* 프로젝트번호 */
//mno NUMBER NOT NULL /* 작성자번호 */

public class Notice {
	private int nno;
	private String title;
	private String detail;
	private Date wdate;
	private Date chdate;
	private int views;
	private int pno;
	private int mno;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
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
	
}
