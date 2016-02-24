package com.autoparts.groupware.model;

//시분초 정보
//import java.util.Date;

//결재문서
public class AppconDto {
	private String title;
	private String content;
	private int appline_no;
	private int orderlist_no;
	
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
	public int getAppline_no() {
		return appline_no;
	}
	public void setAppline_no(int appline_no) {
		this.appline_no = appline_no;
	}
	public int getOrderlist_no() {
		return orderlist_no;
	}
	public void setOrderlist_no(int orderlist_no) {
		this.orderlist_no = orderlist_no;
	}
}