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
	
	@RequestMapping(value="/testStock", method=RequestMethod.POST)
	public ModelAndView execute(@ModelAttribute("stock") Stock stock, BindingResult result){
		ModelAndView mav = new ModelAndView();
		mav.addObject("stocks", ts.process(stock));
		mav.setViewName("testStockResult");
		return mav;
	}
	
	
	@RequestMapping(value="/testTran", method=RequestMethod.POST)
	public ModelAndView execute2(@RequestParam("price") double price, @RequestParam("quantity") double quantity){
		ModelAndView mav = new ModelAndView();
		User user1 = new User("Bob325", "asdfuinjj", "bob325@gmail.com", "Bob", "Bruce", 100000, 100000, "USER", 1);
		Stock stock1 = new Stock("APPL", "Apple is amazing company.");
//		ms.process(user1);
//		ts.process(stock1);
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
	
	
	
}
