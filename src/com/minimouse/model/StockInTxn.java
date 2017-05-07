package com.minimouse.model;

import java.util.Date;

public class StockInTxn {

	private int stockInId;
	private int productId;
	private int clientId;
	private int quantity;
	private int poPrice;
	private Date createdDate;
	public int getStockInId() {
		return stockInId;
	}
	public void setStockInId(int stockInId) {
		this.stockInId = stockInId;
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
	public int getPoPrice() {
		return poPrice;
	}
	public void setPoPrice(int poPrice) {
		this.poPrice = poPrice;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
	
}
