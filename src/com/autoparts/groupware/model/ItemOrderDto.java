package com.autoparts.groupware.model;

//��ǰ�ֹ�
public class ItemOrderDto {
	//private int orderno; List�� ����� �Ŷ� �� ���� ���� �̰� �ʿ���� ��
	private int itemno; //��ǰ��ȣ
	private int price; //���� ����
	private int quantity; //����
	
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
