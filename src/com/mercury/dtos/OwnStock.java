package com.mercury.dtos;

import java.math.BigDecimal;
import java.sql.Date;

/**
 * this the dto for an entry in user's portofolio
 * @author Ethan
 *
 */
public class OwnStock {
	private String userName;
	private int stockId;
	private String stockSymbol;
	private BigDecimal avgCost;
	private int quantity;
	private StockInfo stockInfo;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public String getStockSymbol() {
		return stockSymbol;
	}
	public void setStockSymbol(String stockSymbol) {
		this.stockSymbol = stockSymbol;
	}
	public BigDecimal getAvgCost() {
		return avgCost;
	}
	public void setAvgCost(BigDecimal avgCost) {
		this.avgCost = avgCost;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public StockInfo getStockInfo() {
		return stockInfo;
	}
	public void setStockInfo(StockInfo stockInfo) {
		this.stockInfo = stockInfo;
	}
	
	
}
