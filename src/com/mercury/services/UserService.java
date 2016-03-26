package com.mercury.services;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.dtos.OwnStock;
import com.mercury.dtos.UserInfo;
import com.mercury.daos.UserDao;
import com.mercury.daos.UserStockTransactionDao;

/**
 * Service for user related business logic
 * @author Ethan
 *
 */
@Service
public class UserService {
	
	@Autowired
	UserDao ud;
	@Autowired
	UserStockTransactionDao td;
//	@Autowired
//	StockService ss;
	
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
	 * this method return a list of stocks, quantity, average cost 
	 * @param username
	 * @return -- a list of OwnStock DTO
	 */
	public List<OwnStock> getOwnedStocks(String username){
		
		// load all transactions
		List<UserStockTransaction> txs = td.queryTransactionByUsername(username);
		
		if (txs == null){
			//this user doesn't have any transactions
			return null;
		}
		
		List<OwnStock> ownedStocks = new ArrayList<>();
		
		// use a map to cache all transactions and process later
		// since symbol for a stock is unique, use it 
		Map<String, List<UserStockTransaction>> transMap = new HashMap<>();
		
		for(UserStockTransaction tx : txs){
			//get symbol
			String symbol = tx.getStock().getSymbol();
			
			//
			if (!transMap.containsKey(symbol)){
				List<UserStockTransaction> transOfthisStock = new ArrayList<>();
				transOfthisStock.add(tx);
				transMap.put(symbol, transOfthisStock);
			} else {
				transMap.get(symbol).add(tx);
			}	
		}
		
		if (transMap.isEmpty()){
			return null;
		}
		
		List<Map.Entry<String, List<UserStockTransaction>>> list = new ArrayList<>(transMap.entrySet());
		for(Map.Entry<String, List<UserStockTransaction>> entry: list){
			OwnStock dto = getOwnStockDto(entry.getValue());
			if (dto != null){
				ownedStocks.add(dto);
			}
		}
		
		return ownedStocks;
	}
	
	/**
	 * this helper function is used to parse a list UserStockTransaction to a OwnStock DTO
	 * @param trans
	 * @return
	 */
	public OwnStock getOwnStockDto(List<UserStockTransaction> trans){
		
		//if there is something wrong with the list
		if (trans == null || trans.size()==0){
			return null;
		}
		
		UserStockTransaction tran = trans.get(0);
	
		OwnStock ownstock = new OwnStock();
		ownstock.setUserName(tran.getUser().getUsername());
		ownstock.setStockId(tran.getStock().getSid());
		ownstock.setStockSymbol(tran.getStock().getSymbol());
		
		BigDecimal avgCost;
		double totalCost = 0.0;
		int quantity = 0;
		
		//get the total quantity and cost
		for(UserStockTransaction tx: trans){
			int quan = tx.getQuantity();
			quantity += quan;
			double cost = tx.getPrice() * tx.getQuantity();
			totalCost += cost;
		}
		
		System.out.println("total amount is "+ quantity);
		
		//if the quantity after several transactions is 0, then return a null value;
		if (quantity == 0){
			return null;
		}
		
		avgCost = BigDecimal.valueOf(totalCost/quantity);
		
		ownstock.setQuantity(quantity);
		ownstock.setAvgCost(avgCost);
		
		return ownstock;
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
