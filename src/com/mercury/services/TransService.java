package com.mercury.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.Stock;
//import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.StockDao;
import com.mercury.daos.UserStockTransactionDao;
import com.mercury.dtos.TransactionInfo;
import com.mercury.util.csv.CsvUtil;
import com.mercury.daos.UserDao;

/**
 * This is the service class for transaction related logic
 * @author Ethan
 *
 */
@Service
public class TransService {
	
	@Autowired
	private UserDao ud;
	@Autowired
	private StockDao sd;
	@Autowired
	private UserStockTransactionDao td;
	@Autowired
	private CsvUtil cu;
	
	/**
	 * save a transaction to database
	 * @param trans
	 */
	public void addTransaction(UserStockTransaction trans){
		td.save(trans);
	}

	
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
	public void addPending(UserStockTransaction trans){
		System.out.println("in addpending in trans service");
		String username = trans.getUser().getUsername();
		User user = ud.findByUserName(username);
		double cash = user.getCash();
		int amount = trans.getQuantity();
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
			System.out.println("User don't have enough balance");
		}
		
	}
	
	
	/**
	 * read all pending transactions from pending.csv file using CsvUtil
	 * @return
	 */
	public List<UserStockTransaction> getAllPendings(){
		List<UserStockTransaction> list = cu.parseCSV();
		return list;
	}
	
	
	/**
	 * get all pending transactions for a user
	 * @param user
	 * @return
	 */
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
	 * @param index -- index of the pending transaction
	 */
	//@Transactional
	public void commitPending(int index){
		//Parsing pending to transaction
		//List<UserStockTransaction> transList = getAllPendings();
		List<UserStockTransaction> allpendings = getAllPendings();
		UserStockTransaction tx = allpendings.get(index);
		String username = tx.getUser().getUsername();
		User user = ud.findByUserName(username);
		
		
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
	 * commit a list of pendings by their indicex
	 * @param indexs
	 */
	public void commitPendings(List<Integer> indexs){
		List<UserStockTransaction> allpendings = getAllPendings();
		for(int i: indexs){
			commitPending(i);
		}
		List<UserStockTransaction> newList = new ArrayList<UserStockTransaction>();
		
		for (int i=0; i<allpendings.size(); i++){
			if (!indexs.contains(i) ){
				newList.add(allpendings.get(i));
			}
		}
		
		cu.rewriteCSV(newList);
	}
	
	/**
	 * drop a pending transaction and credit the user's cash
	 * @param index -- index of the pending transaction
	 * @param reimberse
	 */
	//Delete pending transaction from csv file
	public void dropPending(int index){
		
		List<UserStockTransaction> list = getAllPendings();
		
		UserStockTransaction tran = list.get(index);
		String username = tran.getUser().getUsername();
		User user = ud.findByUserName(username);
		
		
		//credit back user's cash
		double cash = user.getCash();
		int amount = tran.getQuantity();
		double price = tran.getPrice();
		cash = cash + price * amount;
		
		//if (balance < 0) balance = 0;
		user.setCash(cash);
		ud.update(user);
			
		list.remove(index);
		cu.rewriteCSV(list);
	}
	
	/**
	 * Delete pending transactions and credit back to users
	 * @param indexs
	 */
	public void dropPendings(List<Integer> indexs){
		List<UserStockTransaction> list = getAllPendings();
		List<UserStockTransaction> newList = new ArrayList<UserStockTransaction>();
		List<UserStockTransaction> restore = new ArrayList<UserStockTransaction>();
		for (int i=0; i<list.size(); i++){
			if (!indexs.contains(i) ){
				newList.add(list.get(i));
			}else{
				restore.add(list.get(i));
			}
		}
		
		for(UserStockTransaction tran: restore){
			String username = tran.getUser().getUsername();
			User user = ud.findByUserName(username);
			//User user = tran.getUser();
			
			//credit back user's cash
			double cash = user.getCash();
			int amount = tran.getQuantity();
			double price = tran.getPrice();
			cash = cash + price * amount;
			
			//if (balance < 0) balance = 0;
			user.setCash(cash);
			ud.update(user);
			//list.remove(i);
		}
		
		cu.rewriteCSV(newList);
	}
	
	
	/**
	 * get user transaction history
	 * @param username
	 * @return
	 * @author Yi
	 */
	public List<TransactionInfo> getTranHistory(String username){
		List<TransactionInfo> tranHistory = new ArrayList<>();
		User user = ud.findByUserName(username);
		System.out.println(user);
		
		/* get committed transaction history */
		List<UserStockTransaction> trans = td.queryTransactionByUsername(username);
		for(UserStockTransaction t: trans){
			String type = (t.getQuantity() >= 0) ? "BUY" : "SELL";
			tranHistory.add(
				new TransactionInfo(t.getUser().getUsername(),
									t.getStock().getSymbol(),
									t.getPrice(), 
									t.getQuantity(),
									t.getTs(),
									type,
									"COMMITTED")
			);
		}
		
		/* get pending transaction history */
		List<UserStockTransaction> pendingTrans = findPendingByUser(user);
		System.out.println(pendingTrans);
		for(UserStockTransaction t: pendingTrans){
			String type = (t.getQuantity() >= 0) ? "BUY" : "SELL";
			tranHistory.add(
				new TransactionInfo(t.getUser().getUsername(),
									t.getStock().getSymbol(),
									t.getPrice(),
									t.getQuantity(),
									t.getTs(),
									type,
									"PENDING")
			);
		}
		
		return tranHistory;
	}
	
	/**
	 * admin get all user's committed transaction history
	 * @return
	 * @author Yi
	 */
	public List<TransactionInfo> getAllCommitTranHistory(){
		List<TransactionInfo> res = new ArrayList<>();
		List<UserStockTransaction> list = td.queryAll();
		for(UserStockTransaction t: list){
			String type = (t.getQuantity() >= 0) ? "BUY" : "SELL";
			res.add(
				new TransactionInfo(t.getUser().getUsername(),
									t.getStock().getSymbol(),
									t.getPrice(),
									t.getQuantity(),
									t.getTs(),
									type,
									"COMMITTED")
			);
		}
		
		return res;
	}
	
	
	
	
	/**
	 * admin get all user's pending transaction history
	 * @return
	 * @author Yi
	 */
	public List<TransactionInfo> getAllPendingTranHistory(){
		List<TransactionInfo> res = new ArrayList<>();
		List<UserStockTransaction> list = getAllPendings();
		for(UserStockTransaction t: list){
			String type = (t.getQuantity() >= 0) ? "BUY" : "SELL";
			res.add(
				new TransactionInfo(t.getUser().getUsername(),
									t.getStock().getSymbol(),
									t.getPrice(),
									t.getQuantity(),
									t.getTs(),
									type,
									"PENDING")
			);
		}
		
		return res;
	}
	
}
