package com.mercury.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.UserStockTransactionDao;

@Service
public class TestTransService {
	@Autowired
	private UserStockTransactionDao ustd;
	
	public List<UserStockTransaction> saveAndQueryAll(UserStockTransaction tran){
		ustd.save(tran);
		return ustd.queryAll();
	}
	
	public List<Stock> queryByUsername(String username){
		return ustd.queryStockByUsername(username);
	}
	
	public List<Stock> queryByEmail(String email){
		return ustd.queryStockByEmail(email);
	}
	
	public List<User> queryBySymbol(String symbol){
		return ustd.queryUserBySymbol(symbol);
	}
	
	public List<UserStockTransaction> queryHistoryByUserId(int userId){
		return ustd.queryTransactionByUserId(userId);
	}
	
	public List<UserStockTransaction> queryHistoryByUsername(String username){
		return ustd.queryTransactionByUsername(username);
	}
	
	public List<UserStockTransaction> queryHistoryByEmail(String email){
		return ustd.queryTransactionByEmail(email);
	}
}
