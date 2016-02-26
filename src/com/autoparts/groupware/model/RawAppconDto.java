package com.autoparts.groupware.model;

//시분초 정보
//import java.util.Date;

//결재문서
public class RawAppconDto {
	private int num;
	private String title;
	private String content;
	private int appline;
	private int coopline;
	private int empno;
	private int ollno;
	private int state;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAppline() {
		return appline;
	}
	public void setAppline(int appline) {
		this.appline = appline;
	}
	public int getCoopline() {
		return coopline;
	}
	public void setCoopline(int coopline) {
		this.coopline = coopline;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getOllno() {
		return ollno;
	}
	public void setOllno(int ollno) {
		this.ollno = ollno;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}