package com.autoparts.groupware.model;

import java.util.Date;

//�ֹ���
public class OrderDto {
	private int orderno; //�����ε� ����ϰ� List�ε� ��� �־��
	private Date date;
	private int price; //�Ѿ� - ItemOrderDto�� price*quantity�� ��� ���� ���� ����. sql������ ó��
	
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
