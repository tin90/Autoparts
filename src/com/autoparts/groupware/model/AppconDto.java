package com.autoparts.groupware.model;

import java.util.List;

//시분초 정보
//import java.util.Date;

//결재문서
public class AppconDto {
	private int num;
	private String title;
	private String content;
	private List<ApprovalDto> appline;
	private List<ApprovalDto> coopline;
	private int orderlist_no;
	
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
	public List<ApprovalDto> getAppline() {
		return appline;
	}
	public void setAppline(List<ApprovalDto> appline) {
		this.appline = appline;
	}
	public List<ApprovalDto> getCoopline() {
		return coopline;
	}
	public void setCoopline(List<ApprovalDto> coopline) {
		this.coopline = coopline;
	}
	public int getOrderlist_no() {
		return orderlist_no;
	}
	public void setOrderlist_no(int orderlist_no) {
		this.orderlist_no = orderlist_no;
	}
}