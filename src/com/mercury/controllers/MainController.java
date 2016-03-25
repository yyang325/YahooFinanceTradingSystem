package com.mercury.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.dtos.StockInfo;
import com.mercury.dtos.UserInfo;
import com.mercury.services.MainService;
import com.mercury.services.StockService;
import com.mercury.services.TransService;
import com.mercury.services.UserService;
import com.mercury.util.CsvUtil;

/**
 * 
 * @author Ethan
 *
 * Mainservice for test purpose
 * 
 * 
 * @version update 03/24/2016
 * @author Weibo
 * 
 * Modified RequestMapping for "main"
 */
@Controller
@SessionAttributes
public class MainController {
	
	@Autowired
	MainService ms;
	@Autowired
	UserService us;
	@Autowired
	StockService ss;
	@Autowired
	TransService ts;
	@Autowired
	CsvUtil util;

	@RequestMapping(value="/next", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") 
			User user, BindingResult result) {
		UserInfo userInfo = ms.process(user);
		//UserInfo userInfo = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("next");
		mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	@RequestMapping("/main")
	public String mainPage() {
		return "home";
	}
	
	@RequestMapping("/main1")
	public String mainPage2() {
		return "main";
	}
	
	@RequestMapping(value="rest/finduser", method=RequestMethod.GET)
	@ResponseBody
	public User findUserByUserName(HttpServletRequest request){
		System.out.println("Has been mapped");
		String username = request.getParameter("username");
		System.out.println(username);
		User user = us.findUserByUserName(username);
		//System.out.println(user);
		return user;
	}
	
	@RequestMapping(value="rest/finduseremail", method=RequestMethod.GET)
	@ResponseBody
	public User findUserByEmail(HttpServletRequest request){
		System.out.println("Has been mapped");
		String email = request.getParameter("email");
		System.out.println(email);
		User user = us.findUserByEmail(email);
		//System.out.println(user);
		return user;
	}
	
	@RequestMapping(value="rest/csv", method=RequestMethod.GET)
	@ResponseBody
	public UserInfo testCSV(HttpServletRequest request){
		UserInfo userinfo = new UserInfo();
		userinfo.setUsers(null);
		userinfo.setMessage(util.readCSV());
//		System.out.println("Has been mapped");
//		String email = request.getParameter("email");
//		System.out.println(email);
//		User user = us.findUserByEmail(email);
//		System.out.println(user);
		return userinfo;
	}
	
	@RequestMapping(value="rest/stocks", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> testStocks(HttpServletRequest request){
		List<Stock> stocks = ss.getAllStock();
		for(Stock s: stocks){
			System.out.println(s.getSymbol() + " " + s.getStockDesc());
			System.out.println(ss.getStockInfo(s).getStockName());
		}
		List<StockInfo> stockinfos =ss.getStockInfos(stocks);
		//List<StockInfo> stockinfos = ss.getStockInfos(ss.getAllStock());
		return stockinfos;
	}
	
	@RequestMapping(value="rest/csvtrans", method=RequestMethod.GET)
	@ResponseBody
	public void testCsvTrans(@RequestParam(value = "stock") String symbol, 
							 @RequestParam(value = "user") String username,
							 @RequestParam(value = "price") double price,
							 @RequestParam(value = "quantity") int quantity){
		UserStockTransaction tx = new UserStockTransaction();
		System.out.println(symbol + " " + username + " " + price + " " + quantity);
		tx.setPrice(price);
		tx.setQuantity(quantity);
		tx.setUser(us.findUserByUserName(username));
		tx.setStock(ss.getBySymbol(symbol));
		//need to fix here
		tx.setTs(new Date());
		
		System.out.println(tx.getStock().getSymbol() + " " + tx.getUser().getUsername() + " " + tx.getPrice());
		
		ts.addPending(tx);
	}
	
	@RequestMapping(value="rest/csvdropall", method=RequestMethod.GET)
	@ResponseBody
	public void testCsvDropAll(){
		
		System.out.println("in testCsvDropAll contoller method");
		List<Integer> indexs = new ArrayList<>();
		indexs.add(1);
		indexs.add(2);
		ts.dropPendings(indexs);
	}
	
	@RequestMapping(value="rest/csvcommitall", method=RequestMethod.GET)
	@ResponseBody
	public void testCsvCommitAll(){
		
		System.out.println("in testCsvCommitAll contoller method");
		List<Integer> indexs = new ArrayList<>();
		indexs.add(1);
		indexs.add(2);
		ts.commitPendings(indexs); 
	}

}
