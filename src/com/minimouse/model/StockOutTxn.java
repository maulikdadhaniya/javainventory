package com.minimouse.model;

import java.util.Date;

public class StockOutTxn {
	
	private int stockOutId;
	private int productId;
	private int clientId;
	private int quantity;
	//private int avquantity;
	private int soPrice;
	private Date createdDate;
	
	public int getStockOutId() {
		return stockOutId;
	}
	public void setStockOutId(int stockOutId) {
		this.stockOutId = stockOutId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	/*public int getAvquantity() {
		return avquantity;
	}
	public void setAvquantity(int avquantity) {
		this.avquantity = avquantity;
	}*/
	public int getSoPrice() {
		return soPrice;
	}
	public void setSoPrice(int soPrice) {
		this.soPrice = soPrice;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	

}
