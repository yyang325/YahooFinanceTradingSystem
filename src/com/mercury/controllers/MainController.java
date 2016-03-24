package com.mercury.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User;
import com.mercury.dtos.UserInfo;
import com.mercury.services.MainService;

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
	private MainService ms;

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
		System.out.println("Hello");
		return "home";
	}

}
