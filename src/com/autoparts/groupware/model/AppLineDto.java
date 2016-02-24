package com.autoparts.groupware.model;

import java.util.List;

public class AppLineDto {
	private int num; //�⺻Ű
	private List<ApprovalDto> list;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public List<ApprovalDto> getList() {
		return list;
	}
	public void setList(List<ApprovalDto> list) {
		this.list = list;
	}
}
