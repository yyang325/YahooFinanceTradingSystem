package com.mercury.controllers;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.services.TransService;
import com.mercury.services.UserService;

@Controller
@SessionAttributes
public class TransController {
	
	@Autowired
	private TransService ts;
	@Autowired
	private UserService us;
	
	@RequestMapping(value="/getPending", method=RequestMethod.GET)
	@ResponseBody
	public List<UserStockTransaction> getPending(HttpServletRequest request) throws Exception{
		//ServletContext context = request.getServletContext();
		//need to modify here, only admin can do this
		List<UserStockTransaction> pendingList = ts.getAllPendings();
		return pendingList;
	}
	
	@RequestMapping(value="/myPending", method=RequestMethod.GET)
	@ResponseBody
	public List<UserStockTransaction> myPending(Principal principal) throws Exception{
		if (principal == null){
			return null;
		}
		String userName = principal.getName();
		User user = us.findUserByUserName(userName);
		//ServletContext context = request.getServletContext();
		List<UserStockTransaction> pendingList = ts.findPendingByUser(user);
		return pendingList;
	}
	
	@RequestMapping(value="/addPending", method=RequestMethod.POST)
	@ResponseBody
	public String addPending(@RequestBody UserStockTransaction tran, 
			HttpServletRequest request) throws Exception{
		if (tran != null){
			System.out.println(tran);
			//ServletContext context = request.getServletContext();
			ts.addPending(tran);
			return "success";
		}else{
			return "failure";
		}
	}

	//Drop a pending transaction
	@RequestMapping(value="/pending", params="drop", method=RequestMethod.GET)
	public String dropPending(@RequestParam("drop") int tid, HttpServletRequest request) throws Exception {
		//ServletContext context = request.getServletContext();
		ts.dropPending(tid); 
		return "redirect:pending";
	}
	
	//Commit a pending transaction
	@RequestMapping(value="/pending", params="commit", method=RequestMethod.GET)
	public String commitPending(@RequestParam("commit") int tid, HttpServletRequest request) throws Exception {
		//ServletContext context = request.getServletContext();
		ts.commitPending(tid);
		//ts.dropPending(tid, false);
		return "redirect:pending";
	}
	
	@RequestMapping(value="/pending", params="dropAll", method=RequestMethod.GET)
	public String dropSelected(@RequestParam(value="dropAll") String selected, 
			HttpServletRequest request) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		Integer[] tids = mapper.readValue(selected, Integer[].class);
		List<Integer> indexes = Arrays.asList(tids);
		//ServletContext context = request.getServletContext();
		//ts.dropPendings(indexes, true);
		ts.dropPendings(indexes);
		return "redirect:pending";
	}
	
	//Commit selected pending transactions
	@RequestMapping(value="/pending", params="commitAll", method=RequestMethod.GET)
	public String commitSelected(@RequestParam(value="commitAll") String selected, 
			HttpServletRequest request) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		Integer[] tids = mapper.readValue(selected, Integer[].class);
		List<Integer> indexes = Arrays.asList(tids);
		//ServletContext context = request.getServletContext();
		ts.commitPendings(indexes);
		return "redirect:pending";
	}
	
	@RequestMapping(value="/history", method=RequestMethod.GET)
	public String listHistroy(){
		return "history";
	}	
	
	
}
