package com.mercury.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.Stock;
import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.UserStockTransactionDao;

@Service
public class TestTransService {
	@Autowired
	private UserStockTransactionDao ustd;
	
	public List<UserStockTransaction> saveAndQueryAll(UserStockTransaction tran){
		List<UserStockTransaction> list = null;
		ustd.save(tran);
		list = ustd.queryAll();
		return list;
	}
	
	public List<Stock> queryByUsername(String username){
		System.out.println(username);
		List<Stock> list = ustd.queryStockByUsername(username);
		for(Stock s: list){
			System.out.println(s.getSymbol());
		}
		return list;
	}
	
}
