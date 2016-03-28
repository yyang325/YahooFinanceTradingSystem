package com.mercury.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


import com.mercury.beans.User;
import com.mercury.dtos.UserInfo;

/**
 * @version update 03/24/2016
 * @author Weibo
 * 
 * Test Login controller
*/

import com.mercury.services.UserService;

@Controller
@SessionAttributes
public class LoginController {
	
//	@Autowired
//	@Qualifier("jdbcUserService")  // <-- this references the bean id
//	public UserDetailsManager userDetailsManager;
	
	@Autowired
	private UserService us;
	
	//for login
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public ModelAndView homePage(Principal principal){
		String username = principal.getName();
		//System.out.println(username);
		//User user = us.findUserByUserName(username);
		//UserInfo userInfo = us.userLogin(username);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("usernamer", username);
		return mav;
	}
	
	@RequestMapping(value="/header")
	@ResponseBody
	public User header(Principal principal) {
		String username = principal.getName();
		User user = us.findUserByUserName(username);
		return user;
	}
	
	/**
	 * this is the ajax call request to see if the username already exist
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/registervalidation", method=RequestMethod.POST)
	@ResponseBody
	public int isUserExist(@RequestParam(value = "user") String username){
		//get the front-end input of the user-name and then to check if database has this user-name!!
		//String username = request.getParameter("userName"); 
		//System.out.println(username);
		if(us.isUserExist(username)) {
			System.out.println("name existeddd...........................");
			return 1;
		}
//		if(request.getParameter("email")!=null){ 
//			String email = request.getParameter("email");
//			System.out.println(email);
//			if(us.isEmailExist(email)){
//				System.out.println("email existedd...........................");
//				return 1;
//			}
//		}
		return 0;
	}
	
	
	
	/**
	 * the user successfully signed up, 
	 * @param user
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/confirmsignup", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") 
			User user, BindingResult result) throws Exception {
		
		//save the user to db
		if (user != null){
			us.saveUser(user);
		}
		
		//UserInfo userInfo = mr.register(user);
		//mr.sendMail(user.getUserName(), user.getEmail());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("confirmation");
		//mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	
	/*
	 * register user will get a link to active account, mapping to the MailRegister.java link
	 * user click the link in the email
	 * 1. change the enable to 1 on Database
	 * 2. change the web page to the home of 
	 */
//	@RequestMapping(value="/activateAccount", method = RequestMethod.GET)
//	public ModelAndView activeMail(HttpServletRequest request) {
//		String username = request.getParameter("username");
//		User user = us.findUserByUserName(username);
//		String checkcode = request.getParameter("checkcode");
//		ModelAndView mav = new ModelAndView();
//		System.out.println(mr.md5(username).equals(checkcode));
//		if(mr.md5(username).equals(checkcode)){
//			int enabled = user.getEnabled();
//			if(enabled==1){
//				mav.setViewName("linkoutoftime");
//				return mav;
//			}
//			mr.ActivateUser(username);
//			mav.setViewName("active_confirm");
//			mav.addObject("userName", username);
//			return mav;
//		}
//		mav.setViewName("error");
//		mav.addObject("content","invalid link");
//		return mav;
//		
//	}

}
