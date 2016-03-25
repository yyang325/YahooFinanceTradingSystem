package com.mercury.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="yfts_stock")
public class Stock {
	@GenericGenerator(name="generator", strategy="increment")
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="stock_id")
	private int sid;
	
	@Column(name="symbol")
	private String symbol;
	
	@Column(name="stockdesc")
	private String stockDesc;
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "watchedStocks")
	private Set<User> watchingUsers = new HashSet<>();
	
	@OneToMany(mappedBy = "stock", fetch = FetchType.EAGER)
	private Set<UserStockTransaction> trans = new HashSet<>();
	
	public Stock(){}
	public Stock(String symbol, String stockDesc){
		this.symbol = symbol;
		this.stockDesc = stockDesc;
	}
	
	
	public void addUserStockTransaction(UserStockTransaction tran){
		this.trans.add(tran);
	}

	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getStockDesc() {
		return stockDesc;
	}
	public void setStockDesc(String stockDesc) {
		this.stockDesc = stockDesc;
	}
	public Set<UserStockTransaction> getTrans() {
		return trans;
	}
	public void setTrans(Set<UserStockTransaction> trans) {
		this.trans = trans;
	}
	public Set<User> getWatchingUsers() {
		return watchingUsers;
	}
	public void setWatchingUsers(Set<User> watchingUsers) {
		this.watchingUsers = watchingUsers;
	}
	
	
}
