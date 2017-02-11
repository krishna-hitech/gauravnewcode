package com.dts.crsm.model;

public class StockAudit {

	private int companyID;
	private int categoryID;
	private int medicineID;
	private int quantity;
	private double price;
	private double vat;
	public int getcompanyID() {
		return companyID;
	}
	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getMedicineID() {
		return medicineID;
	}
	public void setMedicineID(int medicineID) {
		this.medicineID = medicineID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getVat() {
		return vat;
	}
	public void setVat(double vat) {
		this.vat = vat;
	}
	
	
}
