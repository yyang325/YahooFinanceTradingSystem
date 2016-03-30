package com.mercury.beans;

import java.io.Serializable;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @version update 03/24/2016
 * @author Weibo
 * 
 * added toString method for testing
 */

@Entity
@Table(name="yfts_user")
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8128164586418919785L;

	@GenericGenerator(name="generator", strategy="increment")
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="user_id")
	private int uid;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="firstname")
	private String firstName;
	
	@Column(name="lastname")
	private String lastName;
	
	@Column(name="cash")
	private double cash;
	
	@Column(name="balance")
	private double balance;
	
	@Column(name="authority")
	private String authority;
	
	@Column(name="enable")
	private int enable;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(
		name = "yfts_watchlist", 
		joinColumns = {@JoinColumn(name="user_id") }, 
		inverseJoinColumns = { @JoinColumn(name = "stock_id") }
	)
	private Set<Stock> watchedStocks = new HashSet<>();
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Set<UserStockTransaction> trans = new HashSet<>();
	
	public User(){}
	public User(String username, String password, String email, String firstName, String lastName, int cash, int balance, String authority, int enable){
		this.username = username;
		this.password = password;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.cash = cash;
		this.balance = balance;
		this.authority = authority;
		this.enable = enable;
	}
	
	
	public void addUserStockTransaction(UserStockTransaction tran){
		this.trans.add(tran);
	}
	public void addWatchedStock(Stock stock){
		this.watchedStocks.add(stock);
	}
	public void deleteWatchedStock(Stock stock){
		if(this.watchedStocks.contains(stock)){
			this.watchedStocks.remove(stock);
		}
	}
	
	@Override
	public String toString() {
		return uid + "\n" + username + "\n" + password + "\n" + email + "\n" 
				+ firstName + "\n" + lastName + "\n" + cash + "\n" 
					+ balance + "\n" + authority + "\n" + enable;
	}
	
	/*
	 * This part of code is transfer the password encryption using MD5 security method
	 * Take the password string from the user, and use the MD5 method to encryption password
	 * In Database, it will store the password which after the MD5 encryption.
	 * If you want to find the password, You can not find back you password, 
	 * you have to set the password again. 
	 */
	public String MD5Hashing(String password) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte byteData[] = md.digest();
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		return hexString.toString();
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public double getCash() {
		return cash;
	}
	public void setCash(double cash) {
		this.cash = cash;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public Set<UserStockTransaction> getTrans() {
		return trans;
	}
	public void setTrans(Set<UserStockTransaction> trans) {
		this.trans = trans;
	}
	public Set<Stock> getWatchedStocks() {
		return watchedStocks;
	}
	public void setWatchedStocks(Set<Stock> watchedStocks) {
		this.watchedStocks = watchedStocks;
	}
	
}
