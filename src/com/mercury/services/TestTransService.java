package com.mercury.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.UserStockTransactionDao;

@Service
public class TestTransService {
	@Autowired
	private UserStockTransactionDao ustd;
	
	public List<UserStockTransaction> saveAndQueryAll(UserStockTransaction tran){
		List<UserStockTransaction> list = null;
		System.out.println(tran);
		ustd.save(tran);
		list = ustd.queryAll();
		
		return list;
	}
	
}
