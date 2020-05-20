package project06.vo;

import java.util.Date;

public class Comment {
		
	
	private int rno;		// 댓글번호
	private int refno;		// 상위글번호
	private String cdetail;	// 댓글 내용
	private Date wdate;		// 댓글 작성일
	private int mno;		// 사원번호
	private int ino;		// 이슈리스트 번호
	private String name;	// 작성자
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getCdetail() {
		return cdetail;
	}
	public void setCdetail(String cdetail) {
		this.cdetail = cdetail;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}

	
	

}




