package com.mercury.dtos;

import java.util.List;

import com.mercury.beans.User;

public class UserInfo {
	private String message;
	private List<User> users;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
}
