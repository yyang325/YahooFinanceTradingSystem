package com.mercury.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;

import com.mercury.daos.UserStockTransactionDao;
//import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.dtos.StockInfo;
import com.mercury.daos.StockDao;

/**
 * this class is for stock related Service
 * @author Ethan
 *
 */
@Service
public class StockService {
	
	@Autowired
	StockDao sd;
	@Autowired
	UserStockTransactionDao td;
	
	public boolean realStock(Stock stock){
		StockInfo stockInfo = getStockInfo(stock);
		if(stockInfo != null && stockInfo.getStockName() != ""){
			return true;
		}
		return false;
	}
	
	/**
	 * save a stock by stock object to database
	 * @param stock
	 */
	//@Transactional
	public void addStock(Stock stock){
		stock.setSymbol(stock.getSymbol().toUpperCase());
		sd.save(stock);
	}
	
	/**
	 * delete a stock from db by stock object
	 * @param stock
	 */
	//@Transactional
	public void removeStock(Stock stock){
		sd.delete(stock);
	}
	
	/**
	 * return a stock object by its id
	 * @param id
	 * @return -- a stock object
	 */
	//@Transactional
	public Stock loadById(int id){
		return sd.findByStockId(id);
	}
	
	/**
	 * fina a stock by its symbol
	 * @param symbol
	 * @return -- a stock object
	 */
	//@Transactional
	public Stock getBySymbol(String symbol){
		return sd.findBySymbol(symbol);
	}
	
	/**
	 * query all stocks exist in db
	 * @return
	 */
	//@Transactional
	public List<Stock> getAllStock(){
		return sd.queryAllStocks();
	}
	
	/**
	 * get a list of stocks that a user owns by its username
	 * @return
	 */
	//@Transactional
	public List<Stock> getStocksForUser(String username){
		return td.queryStockByUsername(username);
	}
	
	/**
	 * see if a stock has been added to the database
	 * @param stock
	 * @return
	 */
	//@Transactional
	public boolean hasStock(Stock stock){
		Stock s = getBySymbol(stock.getSymbol().toUpperCase());
//		if (s == null || s.size() == 0){
//			return false;
//		}else{
//			return true;
//		}
		return s != null;
	}
	
	/**
	 * get the stock information using yahoo finance api
	 * @param stock
	 * @return -- a stockinfo dto
	 */
	public StockInfo getStockInfo(Stock stock) {
		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s=" + stock.getSymbol() + "&f=snc1l1p2&e=.c";
		String pchange = null;
		String name = " ";
		double price = 0;
		double change = 0;
		try {
			URL url = new URL(yahoo_quote);
			URLConnection urlconn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
			String content = in.readLine();
			
			System.out.println(content);
			
			content = content.replace((char)34, (char)32);//' ' replace '"'
			String[] tokens = content.split(",");
			
			int length = tokens.length;
			if (tokens.length <4) return null;
			if(!tokens[tokens.length-4].trim().equals("N/A")){
				for (int i= length-4; i>0; i--){
					name = tokens[i].trim() + name;
				}
			pchange = tokens[tokens.length-1].trim();
			price = Double.parseDouble(tokens[tokens.length-2].trim());
			change = Double.parseDouble(tokens[tokens.length-3].trim());
			/*name =  tokens[tokens.length-4].trim();*/
			}
		}catch (Exception e) {
				e.printStackTrace();
			}
			StockInfo si = new StockInfo();
			si.setStock(stock);
			si.setStockName(name);
			si.setPchange(pchange);
			si.setPrice(price);
			si.setChange(change);
			return si;	
	}
	
	/**
	 * get the stock info of all stocks in db
	 * @param stocks -- a list of all stocks
	 * @return  	 -- a list of stock information
	 */
	//get real time stockInfo
	public List<StockInfo> getStockInfos(List<Stock> stocks) {
		List<StockInfo> sf = new ArrayList<StockInfo>();
		for (Stock s : stocks) {
			StockInfo info = getStockInfo(s);
			if (info != null && info.getStockName() != "") sf.add(info);
		}
		return sf;
	}
	
}
