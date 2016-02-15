package com.autoparts.groupware.model;

public class MobileDto {
	private String prod_code;
	private String brand;
	private String quantity;
	private String date;
	private String bill_code;
	
	public MobileDto() {
	}

	public MobileDto(String prod_code, String brand, String quantity, String date, String bill_code) {
		super();
		this.prod_code = prod_code;
		this.brand = brand;
		this.quantity = quantity;
		this.date = date;
		this.bill_code = bill_code;
	}

	public String getProd_code() {
		return prod_code;
	}

	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBill_code() {
		return bill_code;
	}

	public void setBill_code(String bill_code) {
		this.bill_code = bill_code;
	}

	
}
