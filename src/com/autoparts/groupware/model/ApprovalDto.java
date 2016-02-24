package com.autoparts.groupware.model;

public class ApprovalDto {
	private int num; //외래키
	private int seq; //시퀀스
	private int empno; //사원번호
	
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
}
