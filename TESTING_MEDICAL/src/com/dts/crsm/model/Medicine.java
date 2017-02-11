package com.dts.crsm.model;

import org.apache.struts.action.ActionForm;

public class Medicine  extends ActionForm{
   
	private int medicineID;
	private int categoryID;
	private String medicineName;
	private String medicineDesc;
	private String categoryName;
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
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getMedicineDesc() {
		return medicineDesc;
	}
	public void setMedicineDesc(String medicineDesc) {
		this.medicineDesc = medicineDesc;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	}
