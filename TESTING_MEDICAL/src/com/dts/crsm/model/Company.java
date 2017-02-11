package com.dts.crsm.model;

public class Company {
   
	private int companyID;
	private String companyName;
	private String companyAdd;
	private String companyContact;
	private String companyEmail;
	public int getCompanyID() {
		return companyID;
	}
	
	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}
	
	public String getCompanyName() {
		return companyName;
	}
	
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String getCompanyAdd() {
		return companyAdd;
	}
	
	public void setCompanyAdd(String companyDesc) {
		this.companyAdd = companyDesc;
	}
	public String getCompanyContact() {
		return companyContact;
	}
	
	public void setCompanyContact(String companyContact) {
		this.companyContact = companyContact;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
}
