package com.autoparts.groupware.model;

import java.sql.Date;

public class ApprovalDto {
	private int num; //외래키
	private int seq; //시퀀스
	private int empno; //사원번호
	private Date app_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public Date getApp_Date() {
		return app_date;
	}
	public void setApp_Date(Date app_date) {
		this.app_date = app_date;
	}
}
