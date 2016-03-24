package com.mercury.beans;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="yfts_user")
public class User {
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
	
	@OneToMany(mappedBy = "user")
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
	
}
