package com.minimouse.model;

import java.util.Date;

public class InvoiceFormBean {

	private int invoiceNo;
	private String firstName;
	private String lastName;
	private long mobileNumber;
	private String productCategory;
	private String productName;
	private int quantity;
	private int priceOfOneQnty;
	private int total;
	private Date invoiceDate;
	public int getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(int invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPriceOfOneQnty() {
		return priceOfOneQnty;
	}
	public void setPriceOfOneQnty(int priceOfOneQnty) {
		this.priceOfOneQnty = priceOfOneQnty;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	
	
}
