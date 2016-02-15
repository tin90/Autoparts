package com.autoparts.groupware.model;

//부품주문
public class ItemOrderDto {
	//private int orderno; List로 출력할 거라서 다 같은 값인 이건 필요없을 듯
	private int itemno; //부품번호
	private int price; //개별 가격
	private int quantity; //수량
	
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemno) {
		this.itemno = itemno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
