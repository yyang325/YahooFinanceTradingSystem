package com.mercury.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Stock;
import com.mercury.dtos.StockInfo;
import com.mercury.dtos.TransactionInfo;
import com.mercury.services.StockService;
import com.mercury.services.TransService;
import com.mercury.services.UserService;

@Controller
public class AdminController {
	@Autowired
	private UserService us;
	@Autowired
	private StockService ss;
	@Autowired
	private TransService ts;
	
	
	@RequestMapping(value="admin", method=RequestMethod.GET)
	public String adminPage(){
		return "admin";
	}
	
	
	/**
	 * admin add a stock to stock pool, and return all stock
	 * @param symbol, desc
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="admin/addStock/{symbol}/{desc}", method=RequestMethod.GET)
	@ResponseBody
	public List<Stock> addWatchList(@PathVariable String symbol, @PathVariable String desc) {
		//TODO: need to check whether stock exist already
		
		Stock stock = new Stock(symbol, desc);
		ss.addStock(stock);
		return ss.getAllStock();
	}
	
	
	
	/**
	 * admin query all stock in stock pool
	 * @author Yi
	 */
	@RequestMapping(value="admin/allStock", method=RequestMethod.GET)
	@ResponseBody
	public List<Stock> allStock(){
		return ss.getAllStock();
	}
	
	
	
	/**
	 * admin query all committed transaction history
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="admin/allCommittedHistory", method=RequestMethod.GET)
	@ResponseBody
	public List<TransactionInfo> allCommittedHistory(){
		return ts.getAllCommitTranHistory();
	}
	
	
	
	
	/**
	 * admin query all pending transaction history
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="admin/allPendingHistory", method=RequestMethod.GET)
	@ResponseBody
	public List<TransactionInfo> allPendingHistory(){
		return ts.getAllPendingTranHistory();
	}
	
	
	
	/**
	 * admin commit a pending transaction
	 * @param index
	 * @author Yi
	 */
	@RequestMapping(value="admin/commitTran/{index}", method=RequestMethod.GET)
	@ResponseBody
	public void commitOnePending(@PathVariable int index){
		ts.commitPending(index);
	}
	
	
	
	/**
	 * admin drop a pending transaction
	 * @param index
	 * @author Yi
	 */
	@RequestMapping(value="admin/dropTran/{index}", method=RequestMethod.GET)
	@ResponseBody
	public void dropOnePending(@PathVariable int index){
		ts.dropPending(index);
	}
	
	
	

}
