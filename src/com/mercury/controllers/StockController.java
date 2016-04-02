package com.mercury.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mercury.beans.Stock;
import com.mercury.beans.UserStockTransaction;
import com.mercury.services.StockService;

@Controller
@SessionAttributes
public class StockController {
	
	@Autowired
	StockService ss;
	
	@RequestMapping(value="/getStockId", method=RequestMethod.GET)
	@ResponseBody
	public int getPending(@RequestParam(value = "symbol") String symbol) throws Exception{
		Stock stock = ss.getBySymbol(symbol);
		return stock.getSid();
	}

}
