package com.autoparts.groupware.model;

import java.sql.Date;

public class ApprovalEmpDto {
	private int num;
	private String dept; //join dept
	private String spot; //join spot(Á÷À§)
	private String name;
	private Date app_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getApp_date() {
		return app_date;
	}
	public void setApp_date(Date app_date) {
		this.app_date = app_date;
	}
}
