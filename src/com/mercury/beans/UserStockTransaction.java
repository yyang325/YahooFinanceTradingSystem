package com.mercury.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="yfts_trans")
public class UserStockTransaction {
	@GenericGenerator(name="generator", strategy="increment")
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="tran_id")
	private int tid;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "USER_ID")	
	private User user;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "STOCK_ID")	
	private Stock stock;
	
	@Column(name = "timestamp")
    @Temporal(TemporalType.DATE)
	private Date ts;
	
	@Column(name="price")
	private double price;
	
	@Column(name="quantity")
	private int quantity;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public Date getTs() {
		return ts;
	}

	public void setTs(Date ts) {
		this.ts = ts;
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
	
	
	//ethan modified here for CSV function
	@Override
	public String toString(){
		return Integer.toString(getUser().getUid())+ "," + 
					getUser().getUsername() + "," +
				 Integer.toString(getStock().getSid()) + "," +
					getStock().getSymbol() + "," +
				 Integer.toString(quantity) + "," + 
					((Double) price).toString()+","
				+ (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ts));
	}

}
