package com.mercury.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User;
import com.mercury.services.TestService;
import com.mercury.beans.Stock;

@Controller
public class TestController {
	@Autowired
	private TestService ts;
	
	@RequestMapping("/inputStock")
	public String goMain(){
		return "inputStock";
	}
	
	@RequestMapping(value="/testStock", method=RequestMethod.POST)
	public ModelAndView execute(@ModelAttribute("stock") Stock stock, BindingResult result){
		ModelAndView mav = new ModelAndView();
		mav.addObject("stocks", ts.process(stock));
		mav.setViewName("testStockResult");
		return mav;
	}
}
