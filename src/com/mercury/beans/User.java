package com.mercury.beans;

import java.util.Set;

public class User {
	private int uid;
	private String username;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private int cash;
	private int balance;
	private String authority;
	private int enable;
	private Set<Stock> stocks;
	private Set<Transaction> trans;
}
