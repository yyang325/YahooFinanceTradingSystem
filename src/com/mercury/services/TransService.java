package com.mercury.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.StockDao;
import com.mercury.daos.UserStockTransactionDao;
import com.mercury.daos.UserDao;
import com.mercury.util.CsvUtil;

/**
 * This is the service class for transaction related logic
 * @author Ethan
 *
 */
@Service
public class TransService {
	
	@Autowired
	UserDao ud;
	@Autowired
	StockDao sd;
	@Autowired
	UserStockTransactionDao td;
	@Autowired
	CsvUtil cu;
	
	/**
	 * save a transaction
	 * @param trans
	 */
	//@Transactional
	public void addTransaction(UserStockTransaction trans){
		td.save(trans);
	}

	//@Transactional
//	public void deleteTransaction(UserStockTransaction trans){
//		td.deleteTransaction(trans);
//	}
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	//@Transactional
//	public List<UserStockTransaction> queryByUser(User user){
//		return td.queryStockByUsername(user.getUsername());
//	}
	
	/**
	 * return all transactions
	 * @return
	 */
	//@Transactional
	public List<UserStockTransaction> queryAll(){
		return td.queryAll();
	}
	
	
	/**
	 * add a pending transaction by appending it to the CSV file
	 * @param trans
	 */
	
	//@Transactional
	public void addPending(UserStockTransaction trans){
		User user = trans.getUser();
		double cash = user.getCash();
		int amount = (int) trans.getQuantity();
		double price = trans.getPrice();
		
		cash = cash - price * amount;
		// can the cash be negative value?
		// if cash is greater or equal than 0, update user and save transaction to pending
		// if cash is less than 0, abort the transaction
		if (cash >= 0) {
			user.setCash(cash);
			ud.update(user);
			cu.appendCSV(trans);
		} else{
			//add code here
		}
		
	}
	
	/**
	 * read all pending transactions from pending.csv fiel using CsvUtil
	 * @return
	 */
	//@Transactional
	public List<UserStockTransaction> getAllPendings(){
		List<UserStockTransaction> list = cu.parseCSV();
		return list;
	}
	
	/**
	 * get all pending transactions for a user
	 * @param user
	 * @return
	 */
	//@Transactional
	public List<UserStockTransaction> findPendingByUser(User user){
		
		List<UserStockTransaction> list = getAllPendings();
		if (list == null) return null;
		
		List<UserStockTransaction> newList = new ArrayList<UserStockTransaction>();
		for (UserStockTransaction t: list){
			if (t.getUser().getUid() == user.getUid()){
				newList.add(t);
			}
		}
		return newList;
	}
	
	

	/**
	 * Commit pending transaction in csv file, save it to database, update balance
	 * @param transIndex
	 */
	//@Transactional
	public void commitPending(int index){
		//Parsing pending to transaction
		//List<UserStockTransaction> transList = getAllPendings();
		List<UserStockTransaction> allpendings = getAllPendings();
		UserStockTransaction tx = allpendings.get(index);
		User user = tx.getUser();
		
		//we will do this in another service
//		Stock stock = tx.getStock();
//		List<OwnershipInfo> ownList = od.findByOwn(user, stock);
//		
//		//Calculate the quantity after transaction
//		int amount = tx.getAmount();
//		if (ownList == null || ownList.size() == 0){			
//			if (amount > 0){
//				OwnershipInfo ois = new OwnershipInfo(user, stock, amount < 0 ? 0 : amount);
//				user.addOwns(ois);
//			}
//		}else {
//			amount = ownList.get(0).getQuantity() + amount;
//			if (amount > 0){
//				for (OwnershipInfo ois: user.getOwns()){
//					if (ois.getOwn().getStock().getSid() == stock.getSid()){
//						ois.setQuantity(amount);
//					}
//				}
//			}else{
//				user.removeOwns(ownList.get(0));
//				od.delete(ownList.get(0));
//			}
//		}
		//Calculate and update balance after transaction
		double cash = user.getCash();
		cash = cash - 5;
		
		// persist the transaction in db only when the cash is greater or equal than 0
		if (cash >= 0) {
			user.setCash(cash);
			addTransaction(tx);			//Save transaction to databse
			ud.update(user);
		}
			
	}
	
	/**
	 * 
	 * @param transList
	 */
	@Transactional
	public void commitPendings(List<Integer> transList){
		for (int i: transList){
			commitPending(i);
		}
		//dropPendings(transList, false);
	}
	
}
