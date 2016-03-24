package com.mercury.services;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.dtos.UserInfo;
import com.mercury.daos.UserDao;

/**
 * Service for user related business logic
 * @author Ethan
 *
 */
@Service
public class UserService {
	
	@Autowired
	UserDao ud;
	
	/**
	 * see if the username exist
	 * @param username
	 * @return
	 */
	//@Transactional
	public boolean isUserExist(String username) {
		if(ud.findByUserName(username) == null){
			return false;
		}
		return true;
	}
	
	/**
	 * see if email exist
	 * @param email
	 * @return
	 */
	//@Transactional
	public boolean isEmailExist(String email) {
		if(ud.findByEmail(email) == null){
			return false;
		}
		return true;
	}
	
	/**
	 * find the user by its username
	 * @param username
	 * @return
	 */
	//@Transactional
	public User findUserByUserName(String username){
		return ud.findByUserName(username);
	}
	
	
	/**
	 * find the user by its email 
	 * @param email
	 * @return
	 */
	//@Transactional 
	public User findUserByEmail(String email) {
		return ud.findByEmail(email);
	}
	
	//need a service to find all stocks that a user have
	
	/**
	 * get UserInfo DTO by username when a user login
	 * @param username
	 * @return
	 */
	//@Transactional
	public UserInfo getUserInfoDTO(String username) {
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello "+ username);
		userInfo.setUsers(ud.queryAll());
		return userInfo;
	}
	
	/**
	 * get a user's balance
	 * @param username
	 * @return
	 */
	//@Transactional
	public double getBalance(String username) {
		return ud.findByUserName(username).getBalance();
	}
	
	/**
	 * get a user's cash
	 * @param username
	 * @return
	 */
	//@Transactional
	public double getCash(String username) {
		return ud.findByUserName(username).getCash();
	}
	
	
	/**
	 * add credit to user's cash
	 * @param username
	 * @param addMoney
	 */
	//@Transactional
	public void addCash(String username, double addMoney) {
		User user =ud.findByUserName(username);
		double newBalance =user.getBalance() + addMoney;
		//need to modify here
		user.setBalance(newBalance <= 2147483647 ? newBalance : 2147483647);
		ud.update(user);
	}
	
}
