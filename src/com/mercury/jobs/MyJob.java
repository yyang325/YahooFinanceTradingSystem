package com.mercury.jobs;

import java.util.Calendar;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.mercury.services.TransService;

public class MyJob {
	@Autowired
	private TransService ts;
	@Autowired
	ServletContext servletContext;
	
	String filePath;
	
	@Scheduled
	public void printCurrentTime() {
		System.out.println("Current Time : " + Calendar.getInstance().getTime());
		ts.commitAllPendings();
	}

}
