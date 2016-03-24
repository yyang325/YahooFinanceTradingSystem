package com.mercury.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.UserStockTransaction;
import com.mercury.services.MainService;
import com.mercury.services.TestService;
import com.mercury.services.TestTransService;
import com.mercury.beans.Stock;
import com.mercury.beans.User;

@Controller
public class TestController {
	@Autowired
	private TestService ts;
	@Autowired
	private TestTransService tts;
	@Autowired
	private MainService ms;
	
	@RequestMapping("/inputStock")
	public String goMain(){
		return "inputStock";
	}
	
	@RequestMapping("/inputTran")
	public String goMain2(){
		return "inputTran";
	}
	
	@RequestMapping("/testQueryStockByUsername")
	public String goMain3(){
		return "testQueryStockByUsername";
	}
	
	/* Test Save a stock and query all stocks that been saved. */
	@RequestMapping(value="/testStock", method=RequestMethod.POST)
	public ModelAndView execute(@ModelAttribute("stock") Stock stock, BindingResult result){
		ModelAndView mav = new ModelAndView();
		mav.addObject("stocks", ts.process(stock));
		mav.setViewName("testStockResult");
		return mav;
	}
	
	/* Test Save a Transaction between user and stock and query all transactions */
	@RequestMapping(value="/testTran", method=RequestMethod.POST)
	public ModelAndView execute2(@RequestParam("price") double price, @RequestParam("quantity") double quantity){
		ModelAndView mav = new ModelAndView();
		User user1 = new User("FrankLoveJava", "sdxcvui", "frank@gmail.com", "Frank", "Young", 23867, 23790, "USER", 1);
		Stock stock1 = new Stock("GOOG", "Google is a great company.");
		UserStockTransaction trans1 = new UserStockTransaction();
		trans1.setUser(user1);
		trans1.setStock(stock1);
		trans1.setPrice(price);
		trans1.setQuantity(quantity);
		trans1.setTs(new Date());
		mav.addObject("trans", tts.saveAndQueryAll(trans1));
		mav.setViewName("testTranResult");
		return mav;
	}
	
	/* Test query list of transaction by user's UserName */
	@RequestMapping(value="/testTran3", method=RequestMethod.POST)
	public ModelAndView execute3(@RequestParam("username") String username){
		ModelAndView mav = new ModelAndView();
		mav.addObject("stocks", tts.queryByUsername(username));
		mav.setViewName("testQueryStockByUsernameResult");
		return mav;
	}
}
