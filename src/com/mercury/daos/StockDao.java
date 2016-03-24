package com.mercury.daos;

import java.util.List;

import com.mercury.beans.Stock;

public interface StockDao {
	public void save(Stock stock);
	public void delete(Stock stock);
	public void update(Stock stock);
	public Stock findBySymbol(String symbol);
	public Stock findByStockId(int stock_id);
	public List<Stock> queryAllStocks();
}
