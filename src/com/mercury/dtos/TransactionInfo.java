package com.mercury.dtos;

import java.util.Date;

public class TransactionInfo {
	private String username;
	private String stockSymbol;
	private double price;
	private int quantity;
	private Date date;
	private String type;
	private String status;
	
	public TransactionInfo(){}
	public TransactionInfo(String username, String stockSymbol, double price, int quantity, Date date, String type, String status){
		this.username = username;
		this.stockSymbol = stockSymbol;
		this.quantity = quantity;
		this.date = date;
		this.type = type;
		this.status = status;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStockSymbol() {
		return stockSymbol;
	}
	public void setStockSymbol(String stockSymbol) {
		this.stockSymbol = stockSymbol;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
