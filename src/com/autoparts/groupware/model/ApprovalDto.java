package com.autoparts.groupware.model;

//시분초 정보
import java.util.Date;

//결재문서
public class ApprovalDto {
	private String title;
	private String content;
	private Date start_date;
	private Date end_date;
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
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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