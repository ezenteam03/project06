package project06.vo;

import java.util.Date;

public class Chart {
	private int level; //레벨
	private String tname; //업무명
	private int tno;	//업무번호
	private int refno;	//부모업무번호
	private int pno;	//프로젝트번호
	private String pname;	//프로젝트명
	private Date sdateorigin;
	private Date edateorigin;
	private int sdate;	//업무시작일-프로젝트시작일
	private int edate;	//업무종료일-프로젝트시작일
	private double prog;	//진행도/100
	private String name;	//담당자 이름
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Date getSdateorigin() {
		return sdateorigin;
	}
	public void setSdateorigin(Date sdateorigin) {
		this.sdateorigin = sdateorigin;
	}
	public Date getEdateorigin() {
		return edateorigin;
	}
	public void setEdateorigin(Date edateorigin) {
		this.edateorigin = edateorigin;
	}
	public int getSdate() {
		return sdate;
	}
	public void setSdate(int sdate) {
		this.sdate = sdate;
	}
	public int getEdate() {
		return edate;
	}
	public void setEdate(int edate) {
		this.edate = edate;
	}
	public double getProg() {
		return prog;
	}
	public void setProg(double prog) {
		this.prog = prog;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
