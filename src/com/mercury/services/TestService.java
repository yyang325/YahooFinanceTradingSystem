package com.mercury.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mercury.beans.Stock;
import com.mercury.daos.StockDao;

@Service
public class TestService {
	@Autowired
	private StockDao sd;
	
	public List<Stock> process(Stock stock){
		System.out.println(stock.getSymbol() + " " + stock.getStockDesc());
		sd.save(stock);
		List<Stock> list = sd.queryAllStocks();
		for(Stock s: list){
			System.out.println(s.getSymbol() + "\t" + s.getStockDesc());
		}
		return list;
	}
	
}
