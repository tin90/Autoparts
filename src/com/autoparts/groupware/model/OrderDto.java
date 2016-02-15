package com.autoparts.groupware.model;

import java.util.Date;

//주문서
public class OrderDto {
	private int orderno; //개별로도 사용하고 List로도 사용 있어야
	private Date date;
	private int price; //총액 - ItemOrderDto의 price*quantity를 모두 더한 값과 같다. sql문에서 처리
	
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
