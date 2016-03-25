package com.mercury.daos;

import java.util.List;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;

public interface UserStockTransactionDao {
	public void save(UserStockTransaction tran);
	public List<UserStockTransaction> queryAll();
	public List<User> queryUserBySymbol(String symbol);
	public List<User> queryUserByStockId(int stockId);
	public List<Stock> queryStockByUsername(String username);
	public List<Stock> queryStockByEmail(String email);
	public List<Stock> queryStockByUserId(int userId);
	public List<UserStockTransaction> queryTransactionByUserId(int userId);
	public List<UserStockTransaction> queryTransactionByUsername(String username);
	public List<UserStockTransaction> queryTransactionByEmail(String email);
}
