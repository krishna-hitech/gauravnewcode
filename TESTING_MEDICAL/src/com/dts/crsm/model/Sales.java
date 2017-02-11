package com.dts.crsm.model;

import java.sql.Date;

public class Sales {

	private int salesID;
	private String loginname;
	private String salesDate;
	private Date salesDate1;
	private double totalamount;
	private String status;
	private int companyid;
	private int categoryid;
	private int medicineid;
	
	private String companyids[];
	private String categoryids[];
	private String medicineids[];
	
	
	private int quantity;
	private double price;
	
	public int getSalesID() {
		return salesID;
	}
	public void setSalesID(int salesID) {
		this.salesID = salesID;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCompanyid() {
		return companyid;
	}
	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public int getMedicineid() {
		return medicineid;
	}
	public void setMedicineid(int medicineid) {
		this.medicineid = medicineid;
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
	public Date getSalesDate1() {
		return salesDate1;
	}
	public void setSalesDate1(Date salesDate1) {
		this.salesDate1 = salesDate1;
	}
	public String[] getCompanyids() {
		return companyids;
	}
	public void setCompanyids(String[] companyids) {
		this.companyids = companyids;
	}
	public String[] getCategoryids() {
		return categoryids;
	}
	public void setCategoryids(String[] categoryids) {
		this.categoryids = categoryids;
	}
	public String[] getMedicineids() {
		return medicineids;
	}
	public void setMedicineids(String[] medicineids) {
		this.medicineids =medicineids;
	}
}
