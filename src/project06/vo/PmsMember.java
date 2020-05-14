package project06.vo;

public class PmsMember {
	
	private int mno;		// 사원번호
	private String pass;	// 비밀번호
	private int mdiv;		// 권한구분 
							// 2 - ceo, 3 - cto, 4 - pm, 5 - 팀원, 6- 구분없음
	private String wcon;	// 희망연락처
	private int pno;		// 참여 프로젝트 번호
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
