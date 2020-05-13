package project06.vo;

public class pmsmember {
	/*
	 * CREATE TABLE PMSMEMBER (
	 * mno 	NUMBER 			NOT NULL, 사원번호 
	 * pass VARCHAR2(20) 	NOT NULL, 비밀번호 
	 * mdiv NUMBER 			NOT NULL, 권한구분 
	 * wcon VARCHAR2(50), 			     희망연락처 
	 * pno 	NUMBER					     프로젝트번호
	 *  );
	 */
	private int mno;
	private String pass;
	private int mdiv;
	private String wcon;
	private int pno;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getMdiv() {
		return mdiv;
	}
	public void setMdiv(int mdiv) {
		this.mdiv = mdiv;
	}
	public String getWcon() {
		return wcon;
	}
	public void setWcon(String wcon) {
		this.wcon = wcon;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	
}
