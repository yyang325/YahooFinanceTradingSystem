package com.mercury.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

//import com.mercury.service.StockService;
//import com.mercury.service.UserService;

/**
 * Customer controller is used to map customer related URLs 
 * @author Ethan
 *
 *	started at 3/23/2016 12:09 pm
 */
@Controller
@SessionAttributes
public class CustomerController {
	
	//@Autowired
	//UserService us;
	//@Autowired
	//StockService ss;
	
	//@RequestMapping(value="/portfolio", method = RequestMethod.GET)
	//public ModelAndView portfolio(Principal principal) {
	//	String username = principal.getName();
	//	ModelAndView mav = new ModelAndView();
	//	mav.setViewName("portfolio");
	//	mav.addObject("balance", us.getBalance(username));
	//	return mav;
	//}
	
}
