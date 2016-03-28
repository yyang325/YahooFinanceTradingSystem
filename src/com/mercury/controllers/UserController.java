package com.mercury.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Stock;
import com.mercury.daos.UserStockTransactionDao;
import com.mercury.dtos.OwnStock;
import com.mercury.dtos.StockInfo;
import com.mercury.dtos.TransactionInfo;
import com.mercury.services.TransService;
//import com.mercury.services.StockService;
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
	private TransService ts;
//	@Autowired
//	StockService ss;
	
	@RequestMapping(value="/portfolio", method = RequestMethod.GET)
	public ModelAndView portfolio(Principal principal) {
		String username = principal.getName();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("portfolio");
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
		System.out.println(userName);
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
	 */
	@RequestMapping(value="/getWatchList", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> getWatchList(Principal principal) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		System.out.println("In UserController, username:" + userName);
		List<StockInfo> watchedStocks = us.getWatchListInfo(userName);
		
		return watchedStocks;
	}
	
	
	/**
	 * REST API: get username's transaction history
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="/getTranHistory", method=RequestMethod.GET)
	@ResponseBody
	public List<TransactionInfo> getTranHistory(Principal principal) {
		if (principal == null || principal.getName() == null){
			return null;
		}
		String userName = principal.getName();
		System.out.println(userName);
		List<TransactionInfo> tranHistory = ts.getTranHistory(userName);
		
		return tranHistory;
	}
	
}
