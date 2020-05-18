package project06.vo;

public class EmpLog {
	private int cnt;		// 페이징 처리를 위한 번호
	private String name;	// 이름
	private String grade;	// 직책
	private String wcon;	// 희망 연락처(null이면 전화번호 출력)
	private String state;	// 로그인 상태
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getWcon() {
		return wcon;
	}
	public void setWcon(String wcon) {
		this.wcon = wcon;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	

}
