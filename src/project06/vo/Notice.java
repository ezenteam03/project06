package project06.vo;


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
	private String date;
	private String modi;
	private int view;
	private int prono;
	private int wrino;
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getModi() {
		return modi;
	}
	public void setModi(String modi) {
		this.modi = modi;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getProno() {
		return prono;
	}
	public void setProno(int prono) {
		this.prono = prono;
	}
	public int getWrino() {
		return wrino;
	}
	public void setWrino(int wrino) {
		this.wrino = wrino;
	}
	
	
	
	
	

}
