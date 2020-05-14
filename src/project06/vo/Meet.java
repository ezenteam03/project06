package project06.vo;

import java.util.Date;

//mnno NUMBER NOT NULL, /* 회의록번호 */
//topic VARCHAR2(100) NOT NULL, /* 안건 */
//detail VARCHAR2(2000) NOT NULL, /* 내용 */
//result VARCHAR2(200), /* 결정사항 */
//etc VARCHAR2(200), /* 특이사항 */
//views NUMBER NOT NULL, /* 조회수 */
//wdate DATE NOT NULL, /* 작성일 */
//chdate DATE, /* 수정일 */
//mdate DATE NOT NULL, /* 회의일시 */
//loc VARCHAR2(100) NOT NULL, /* 회의장소 */
//people VARCHAR2(200) NOT NULL, /* 참여자 */
//mndiv NUMBER NOT NULL, /* 결재구분 */
//mno NUMBER NOT NULL, /* 작성자번호 */
//pno NUMBER NOT NULL /* 프로젝트번호 */

public class Meet {
	private int mnno;
	private String topic;
	private String detail;
	private String result;
	private String etc;
	private int views;
	private Date wdate;
	private Date chdate;
	private Date mdate;
	private String loc;
	private String people;
	private int mndiv;
	private int mno;
	private int pno;
	public int getMnno() {
		return mnno;
	}
	public void setMnno(int mnno) {
		this.mnno = mnno;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
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
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public int getMndiv() {
		return mndiv;
	}
	public void setMndiv(int mndiv) {
		this.mndiv = mndiv;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
}




