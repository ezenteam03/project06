package project06.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Task {
	/*
	tno NUMBER NOT NULL, /* 업무번호 
	pno NUMBER NOT NULL, /* 프로젝트번호 
	refno NUMBER NOT NULL, /* 부모업무번호 
	tname VARCHAR2(100) NOT NULL, /* 업무명 
	detail VARCHAR2(2000) NOT NULL, /*업무내용 
	sdate DATE NOT NULL, /* 시작일자 
	edate DATE NOT NULL, /* 종료일자 
	prog NUMBER NOT NULL, /* 진행율
	pdate DATE, /* 진행일자 
	coment VARCHAR2(200), /* 반려사유 
	tdiv NUMBER NOT NULL, /* 결재구분 
	mno NUMBER NOT NULL /* 사원번호 
	 */ 
	private int tno;
	private int pno;
	private int refno;
	private String tname;
	private String detail;
	private String updetail;
	private Date sdate;
	private Date edate;
	private int prog;
	private String pdate;
	private String coment;
	private int tdiv;
	private int mno;
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getUpdetail() {
		return updetail;
	}
	public void setUpdetail(String updetail) {
		this.updetail = updetail;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public int getProg() {
		return prog;
	}
	public void setProg(int prog) {
		this.prog = prog;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public int getTdiv() {
		return tdiv;
	}
	public void setTdiv(int tdiv) {
		this.tdiv = tdiv;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	

	
	
}