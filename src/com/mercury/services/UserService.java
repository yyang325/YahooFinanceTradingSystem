package com.mercury.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.dtos.OwnStock;
import com.mercury.dtos.StockInfo;
import com.mercury.dtos.UserInfo;
import com.mercury.daos.StockDao;
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
	private UserDao ud;
	@Autowired
	private UserStockTransactionDao td;
	@Autowired
	private StockDao sd;
	
	/**
	 * see if the username exist
	 * @param username
	 * @return
	 */
	public boolean isUserExist(String username) {
		if(ud.findByUserName(username) == null){
			return false;
		}
		return true;
	}
	
	/**
	 * save a new user to db
	 * @param user
	 */
	public void saveNewUser(User user) throws Exception{
		user.setAuthority("USER");
		user.setCash(100000.0);
		user.setBalance(100000.0);
		System.out.println(user.getPassword());
		user.setPassword(user.MD5Hashing(user.getPassword()));
		//user account is not activated yet
		user.setEnable(0);
		ud.save(user);
	}
	
	/**
	 * activate a user's account 
	 * @param username
	 */
	public void activateUser(String username){
		User user = ud.findByUserName(username);
		user.setEnable(1);
		ud.update(user);
	}
	
	/**
	 * update use with a new password
	 * @param user
	 * @param newPassword
	 * @throws Exception
	 */
	public void updatePassword(User user, String newPassword) throws Exception{
		user.setPassword(user.MD5Hashing(newPassword));
		ud.update(user);
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
		//System.out.println(this.getStockInfo(tran.getStock()));
		ownstock.setStockInfo(this.getStockInfo(tran.getStock()));
		
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
		
		//System.out.println("total amount is "+ quantity);
		
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
		double newCash =user.getCash() + addMoney;
		double newBalance = user.getBalance() + addMoney;
		//need to modify here
		user.setCash(newCash <= 2147483647 ? newCash : 2147483647);
		user.setBalance(newBalance <= 2147483647 ? newBalance : 2147483647);
		ud.update(user);
	}
	
	
	
	public List<StockInfo> addWatchList(String username, String symbol){
		User user = ud.findByUserName(username);
		Stock stock = sd.findBySymbol(symbol);
		user.addWatchedStock(stock);
		ud.update(user);
		return getWatchListInfo(user.getUsername());
	}
	
	
	public List<StockInfo> deleteWatchList(String username, String symbol){
		User user = ud.findByUserName(username);
		Stock stock = sd.findBySymbol(symbol);
		user.deleteWatchedStock(stock);
		ud.update(user);
		return getWatchListInfo(user.getUsername());
	}
	
	
	
	/**
	 * get user's stockInfo watch list
	 * @param username
	 * @return
	 * @author Yi
	 */
	public List<StockInfo> getWatchListInfo(String username){
		List<StockInfo> res = new ArrayList<>();
		List<Stock> stocks = getAllStock(username);
		for(Stock s: stocks){
			//System.out.println(s.getSymbol());
			res.add(getStockInfo(s));
		}
		return res;
	}
	
	/**
	 * get user's stock watch list
	 * @param username
	 * @return
	 * @author Yi
	 */
	public List<Stock> getAllStock(String username){
		User user = findUserByUserName(username);
		List<Stock> list =  new ArrayList<Stock>();
		list.addAll(user.getWatchedStocks());
		return list;
	}
	
	/**
	 * get stock detail info
	 * @param stock
	 * @return
	 * @author Yi
	 */
	public StockInfo getStockInfo(Stock stock) {
		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s=" + stock.getSymbol() + "&f=snc1l1p2&e=.c";
		String pchange = null;
		String symbol = " ";
		String companyName = " ";
		double price = 0;
		double change = 0;
		try {
			URL url = new URL(yahoo_quote);
			URLConnection urlconn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
			String content = in.readLine();
			content = content.replace((char)34, (char)32);//' ' replace '"'
			//System.out.println(content);
			String[] token_info = content.split(",");
			if (token_info.length <4) return null;
			if(!token_info[token_info.length-4].trim().equals("N/A")){
				pchange = token_info[token_info.length-1].trim();
				price = Double.parseDouble(token_info[token_info.length-2].trim());
				change = Double.parseDouble(token_info[token_info.length-3].trim());
				symbol = token_info[0].trim();
				companyName = token_info[1].trim();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		StockInfo si = new StockInfo();
		si.setStockSymbol(stock.getSymbol());
		si.setPchange(pchange);
		si.setPrice(price);
		si.setChange(change);
		si.setCompanyName(companyName);
		//System.out.println(si.getCompanyName() + " " + si.getStockSymbol());
		return si;	
	}

}
