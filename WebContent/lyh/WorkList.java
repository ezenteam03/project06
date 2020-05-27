package com.example.empsearch;

import java.util.ArrayList;

public class WorkList {
/*
{"emplist":[{"empno":7934,"ename":"MILLER","job":"CLERK",
					"mgr":7782,"hiredate":"1? 23, 1982","sal":1300.0,
					"comm":0.0,"deptno":10},
				    {"empno":7902,"ename":"FORD","job":"ANALYST","mgr":7566,"hiredate":"12? 3, 1981",
				    "sal":3000.0,"comm":0.0,"deptno":20}]}
 * */

	private ArrayList<Task> wlist;
	public ArrayList<Task> getEmplist() {
		return wlist;
	}
	public void setEmplist(ArrayList<Task> emplist) {
		this.wlist = wlist;
	}
}
