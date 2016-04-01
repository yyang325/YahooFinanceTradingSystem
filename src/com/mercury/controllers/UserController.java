package com.mercury.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.daos.UserStockTransactionDao;
import com.mercury.dtos.OwnStock;
import com.mercury.dtos.StockInfo;
import com.mercury.dtos.TransactionInfo;
import com.mercury.services.TransService;
import com.mercury.services.StockService;
import com.mercury.services.UserService;

/**
 * This is the controller class to handle User related URL request
 * @author Ethan
 *
 */
@Controller
@SessionAttributes
public class UserController {
	
	@Autowired
	UserService us;
	@Autowired
	TransService ts;
	@Autowired
	StockService ss;
	
	
	@RequestMapping(value="/validUser", method = RequestMethod.GET)
	@ResponseBody
	public User getValidUser(Principal principal){
		//System.out.println("In valid user");
		String userName = null;		
		if (principal == null || principal.getName() == null){
			return null;
		}
		userName = principal.getName();
		return us.findUserByUserName(userName);
	}
	
	@RequestMapping(value="/portfolio", method = RequestMethod.GET)
	public ModelAndView portfolio(Principal principal) {
		String username = principal.getName();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("portfolio1");
		mav.addObject("username", username);
		//System.out.println(username);
		//System.out.println(us.getCash(username));
		mav.addObject("balance", us.getBalance(username));
		mav.addObject("cash", us.getCash(username));
		return mav;
	}
	
	
	@RequestMapping(value="/getPortfolio", method=RequestMethod.GET)
	@ResponseBody
	public List<OwnStock> getPortfolio(Principal principal) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		//System.out.println(userName);
		List<OwnStock> ownedStock = us.getOwnedStocks(userName);
		
		return ownedStock;
	}
	
	//@RequestMapping(value = "/addCash", method = RequestMethod.POST, produces="text/plain")
	@RequestMapping(value = "/addCash", method = RequestMethod.POST)
	@ResponseBody
	public String addBalance(@RequestBody Integer amount, Principal principal) {
		//String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		String userName = principal.getName();
		//System.out.println(amount);
		
		//need to code to verify the amount is acceptable
		if(amount==null) amount=0;
		
		// if()
		us.addCash(userName, amount);
		return "success";
	}
	
	/**
	 * REST API: get username's watch list which contains stock detail info
	 * @param principal
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="/getWatchList", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> getWatchList(Principal principal) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		//System.out.println("In UserController, username:" + userName);
		List<StockInfo> watchedStocks = us.getWatchListInfo(userName);
		
		return watchedStocks;
	}
	
	
	/**
	 * REST API: Add watch list
	 * @param principal
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="/addWatchList/{symbol}", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> addWatchList(Principal principal, @PathVariable String symbol) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		//System.out.println(userName);
		us.addWatchList(userName, symbol);
		return us.getWatchListInfo(userName);
	}
	
	
	
	/**
	 * REST API: delete watch list
	 * @param principal
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="/deleteWatchList/{symbol}", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> deleteWatchList(Principal principal, @PathVariable String symbol) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		//System.out.println(userName);
		us.deleteWatchList(userName, symbol);
		return us.getWatchListInfo(userName);
	}
	
	
	
	/**
	 * REST API: get username's transaction history
	 * @param principal
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="/getTranHistory", method=RequestMethod.GET)
	@ResponseBody
	public List<TransactionInfo> getTranHistory(Principal principal) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		//System.out.println(userName);
		List<TransactionInfo> tranHistory = ts.getTranHistory(userName);
		
		return tranHistory;
	}
	
	
	
	/**
	 * REST API: get all stock info that administration added
	 * @return
	 * @author Yi
	 */
	@RequestMapping(value="/getAllStocks", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> getAllStock(){
		List<Stock> list = ss.getAllStock();
		List<StockInfo> res = new ArrayList<>();
		for(Stock s: list){
			res.add(us.getStockInfo(s));
		}
		return res;
	}
	
}
