package com.autoparts.mobile.model;

public class MobileDto {
	private String part;
	private String brand;
	private int qty;
	private String pocode;
	private int order_qty;
	private String date;
	private String inout;
	private int mod_qty;
	
	public MobileDto() {
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getPocode() {
		return pocode;
	}

	public void setPocode(String pocode) {
		this.pocode = pocode;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getInout() {
		return inout;
	}

	public void setInout(String inout) {
		this.inout = inout;
	}

	public int getMod_qty() {
		return mod_qty;
	}

	public void setMod_qty(int mod_qty) {
		this.mod_qty = mod_qty;
	}

}
