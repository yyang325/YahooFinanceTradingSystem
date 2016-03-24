package com.mercury.controllers;

import javax.servlet.http.HttpServletRequest;

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
import com.mercury.services.UserService;

/**
 * 
 * @author Ethan
 *
 * Mainservice for test purpose
 */
@Controller
@SessionAttributes
public class MainController {
	
	@Autowired
	private MainService ms;
	@Autowired
	private UserService us;

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
		//System.out.println("Hello");
		return "main";
	}
	
	@RequestMapping(value="rest/finduser", method=RequestMethod.GET)
	@ResponseBody
	public User findUser(HttpServletRequest request){
		System.out.println("Has been mapped");
		String username = request.getParameter("username");
		System.out.println(username);
		User user = us.findUserByUserName(username);
		System.out.println(user);
		return user;
	}

}
