package com.autoparts.groupware.model;

import java.sql.Date;

public class ApprovalDto {
	private int num; //�ܷ�Ű
	private int seq; //������
	private int empno; //�����ȣ
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
