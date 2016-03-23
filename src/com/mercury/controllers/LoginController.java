package com.mercury.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	//for login
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String goMain() {
		return "home";
	}
}
