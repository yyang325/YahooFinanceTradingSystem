package com.mercury.dtos;

import com.mercury.beans.Stock;

public class StockInfo {
	private int quantity;
	private double price;
	private double change;
	private String stockName;
	private Stock stock;
	private String pchange;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Stock getStock() {
		return stock;
	}
	public String getPchange() {
		return pchange;
	}
	public void setPchange(String pchange) {
		this.pchange = pchange;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getChange() {
		return change;
	}
	public void setChange(double change) {
		this.change = change;
	}
}