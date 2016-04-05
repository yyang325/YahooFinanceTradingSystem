package com.mercury.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
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
import com.mercury.util.mail.MailUtil;

@Controller
@SessionAttributes
public class LoginController {
	
//	@Autowired
//	@Qualifier("jdbcUserService")  // <-- this references the bean id
//	public UserDetailsManager userDetailsManager;
	
	@Autowired
	UserService us;
	@Autowired
	MailUtil mu;
	@Autowired 
	UserDetailsService userDetailsSvc;
	
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
	public int isUserExist(HttpServletRequest request){
		//get the front-end input of the user-name and then to check if database has this user-name!!
		String username = request.getParameter("username");
		//String email = request.getParameter("email");
		/*System.out.println(username);
		System.out.println(email);*/
		if(us.isUserExist(username)) {
			System.out.println("name existeddd...........................");
			return 1;
		}
		if(request.getParameter("email")!=null){ 
			String email = request.getParameter("email");
			//System.out.println(email);
			if(us.isEmailExist(email)){
				System.out.println("email existedd...........................");
				return 1;
			}
		}
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
		//System.out.println(user.getUsername());
		//System.out.println(user.getPassword());
		//System.out.println(user.getEmail());
		if (user != null){
			us.saveNewUser(user);
		}
		
		String username = user.getUsername();
		mu.sendMail(user.getUsername(), user.getEmail());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("confirmation");
		mav.addObject("username", username);
		return mav;
	}
	
	
	
	/**
	 * 1. change the enable to 1 on Database
	 * 2. change the web page to the home of 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/activateAccount", method = RequestMethod.GET)
	public ModelAndView activeMail(HttpServletRequest request) {
		
		String username = request.getParameter("username");
		User user = us.findUserByUserName(username);
		String checkcode = request.getParameter("checkcode");
		
		ModelAndView mav = new ModelAndView();
		System.out.println(mu.md5(username).equals(checkcode));
		
		if(mu.md5(username).equals(checkcode)){
			int enabled = user.getEnable();
			if(enabled==1){
				mav.setViewName("linkoutoftime");
				return mav;
			}
			
			us.activateUser(username);
			mav.setViewName("active_confirm");
			mav.addObject("userName", username);
			return mav;
		}
		
		mav.setViewName("error");
		mav.addObject("content","invalid link");
		return mav;
		
	}
	
	/**
	 * automatically log in user that clicked the activation link
	 * @param request
	 * @return
	 */
	@RequestMapping(value="login_auto", method = RequestMethod.POST)
	public String loginAuto(HttpServletRequest request) {
		String username = request.getParameter("j_username");
		
		//change user input password to MD5 match the database
		String password = us.findUserByUserName(username).getPassword();
		try {
			UserDetails userDetails = userDetailsSvc.loadUserByUsername(username);
			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
		    // redirect into secured main page if authentication successful
		    if(auth.isAuthenticated()) {
		    	SecurityContextHolder.getContext().setAuthentication(auth);
		        return "redirect:/home";
		    }
		} catch (Exception e) {
			e.getStackTrace();
		}
		return "redirect:/error";
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		System.out.println("in forgot Password");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("forgotpassword");
		return mav;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	* controller for the forgot password and recover account.
	* trigger: receive the forgotpassword.jsp recover account button
	* 1. send email
	* 2. SPA: Please check your email to change password 
	*/
	
	/**
	 * send a reset password email to the email address entered
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/recoveraccountemail*", method = RequestMethod.GET)
	public ModelAndView recoverSendEmail(HttpServletRequest request) {
		System.out.println("in recover email");
		String email = request.getParameter("email");
		System.out.println(email);
		mu.sendForgotPasswordMail(email);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recoveraccountemail");
		return mav;
	}

	
	/**
	 * capture the link in the reset password email and go the changepassword page
	 * @param request
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping(value="/changepassword*", method=RequestMethod.GET)
	 public ModelAndView changePassword(HttpServletRequest request) throws Exception {
		 String email = request.getParameter("email");
		 System.out.println(email);
		 
		 // String newPassword = request.getParameter("newpasswordconfirm");
		 User user = us.findUserByEmail(email);
		 //UserInfo userInfo = mfp.updateUserPassword(user, newPassword);
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("changepassword");
		 //mav.addObject("userInfo", userInfo);
		 mav.addObject("username", user.getUsername());
		 mav.addObject("email", user.getEmail());
		 return mav;
	 }
	
	
	@RequestMapping(value="/change2*", method=RequestMethod.POST)
	public ModelAndView change2(String userName, String password) throws Exception {
		
		System.out.println("hello+++"+userName);
		System.out.println("Password++++"+password);
		User user = us.findUserByUserName(userName);
		us.updatePassword(user, password);
		//UserInfo userInfo = mfp.updateUserPassword(user, password);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("changepwsuccess");
		mav.addObject("userName",userName);
		return mav;
	}
	
	
	/********************************************************************************************************/
	/**  http://websystique.com/spring-security/spring-security-4-remember-me-example-with-hibernate/    ****/
	/**
	 * Check if user is login by remember me cookie, refer
	 * org.springframework.security.authentication.
	 * AuthenticationTrustResolverImpl
	 */
	@SuppressWarnings("unused")
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}

	/**
	 * save targetURL in session
	 */
	@SuppressWarnings("unused")
	private void setRememberMeTargetUrlToSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.setAttribute("targetUrl", "/admin/update");
		}
	}

	/**
	 * get targetURL from session
	 */
	@SuppressWarnings("unused")
	private String getRememberMeTargetUrlFromSession(HttpServletRequest request) {
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		if (session != null) {
			targetUrl = session.getAttribute("targetUrl") == null ? "" : session.getAttribute("targetUrl").toString();
		}
		return targetUrl;
	}

}
