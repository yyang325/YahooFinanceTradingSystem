package com.mercury.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.UserDao;

@Service
public class TestWatchListService {
	@Autowired
	private UserDao ud;
	@Autowired
	private StockDao sd;
	
	public List<Stock> saveAndQueryAllWatchList(int userId, int stockId){
		System.out.println("userID: " + userId + "\tstockId: " + stockId);
		User user = ud.findByUid(userId);
		System.out.println(user.getUsername());
		Stock stock = sd.findByStockId(stockId);
		System.out.println(stock.getSymbol());
		user.addWatchedStock(stock);
		ud.update(user);
		user.getWatchedStocks().add(stock);
		Iterator<Stock> it = user.getWatchedStocks().iterator();
		List<Stock> list = new ArrayList<>();
		while(it.hasNext()){
			list.add(it.next());
		}
		return list;
	}
	
}
