package com.example.empsearch;

import java.util.Date;

// 가능한 한 VO는 조회될 목적에 맞게 이름 설정..
public class Task {
	private int tno;
	private String tname;
	private int tdiv;

	public Task() {

	}

	public Task(int tno, String tname, int tdiv) {
		this.tno = tno;
		this.tname = tname;
		this.tdiv = tdiv;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getTdiv() {
		return tdiv;
	}

	public void setTdiv(int tdiv) {
		this.tdiv = tdiv;
	}
}
