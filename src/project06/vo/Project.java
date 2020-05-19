package project06.vo;

import java.util.Date;

public class Project {
	private int pno;
	private Date sdate;
	private Date deadline;
	private String pname;
	private String detail;
	private Date cdate;
	private int pdiv;
	private int mno;
	private String name;
	private String sdatestr;
	private String deadlinestr;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getPdiv() {
		return pdiv;
	}
	public void setPdiv(int pdiv) {
		this.pdiv = pdiv;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSdatestr() {
		return sdatestr;
	}
	public void setSdatestr(String sdatestr) {
		this.sdatestr = sdatestr;
	}
	public String getDeadlinestr() {
		return deadlinestr;
	}
	public void setDeadlinestr(String deadlinestr) {
		this.deadlinestr = deadlinestr;
	}
	
}
