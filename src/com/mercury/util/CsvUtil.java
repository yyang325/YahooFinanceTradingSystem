package com.mercury.util;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.omg.CORBA.portable.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.mercury.beans.Transaction;
import com.mercury.beans.UserStockTransaction;
//import com.mercury.beans.Transaction;
import com.mercury.daos.StockDao;
import com.mercury.daos.UserDao;

/**
 * Utility class for CSV related function
 * @author Ethan
 *
 * started at 3/24/2016 1:37am
 */
@Service
public class CsvUtil {
	
	@Autowired
	UserDao ud;
	@Autowired
	StockDao sd;
	@Autowired
	ServletContext servletContext;
	
	String filePath;
	
	/**
	 * test readCSV() function
	 * @return
	 */
	public String readCSV(){
		StringBuffer sb = new StringBuffer();
		try{
			String filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
			
			File f = new File(filePath);

			FileReader fr = new FileReader(f);
			CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
		   
		    List<CSVRecord> l = parser.getRecords();
			for (CSVRecord r:l){
				sb.append(r.get(0));
				sb.append(r.get(1));
				sb.append(r.get(2));
				sb.append(r.get(3));
				sb.append(r.get(4));
				sb.append("| ");
			}
			fr.close();
			parser.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	/**
	 * this method is used to parse the CSV file to get a list of pending transactions
	 * @return --  a list of pending transactions
	 */
	//@Transactional
	public List<UserStockTransaction> parseCSV(){
		List<UserStockTransaction> list = new ArrayList<UserStockTransaction>();
		try{
		    
			filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
			
			File f = new File(filePath);

			FileReader fr = new FileReader(f);
			CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
		    
			List<CSVRecord> l = parser.getRecords();
			for (CSVRecord r:l){
//				System.out.println(r.get(0));
//				System.out.println(r.get(1));
//				System.out.println(r.get(2));
//				System.out.println(r.get(3));
//				System.out.println(r.get(4));
//				System.out.println(r.get(5));
//				System.out.println(r.get(6));
				UserStockTransaction ts = new UserStockTransaction();
				ts.setUser(ud.findByUid(Integer.parseInt(r.get(0))));
				ts.setStock(sd.findByStockId(Integer.parseInt(r.get(2))));
				ts.setQuantity(Integer.parseInt(r.get(4)));
				ts.setPrice(Double.parseDouble(r.get(5)));
				ts.setTs(Timestamp.valueOf(r.get(6)));
				System.out.println(ts);
				list.add(ts);
			}
			fr.close();
			parser.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
		
//		System.out.println("after parse the CSV!");
//		
//		for(UserStockTransaction tx: list){
//			System.out.println("traverse the list after parse");
//			System.out.println(tx);
//		}
		
		return list;
	}
	
	/**
	 * this method is used to append pending transactions to the csv file
	 * @param trans
	 */
	public void appendCSV(UserStockTransaction trans){
		try{
			
			filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
			File f = new File(filePath);
			//System.out.println(trans.getStock().getSymbol() + " " + trans.getUser().getUsername() + " " + trans.getPrice());
			
			FileWriter fw = new FileWriter(f, true);			
			CSVPrinter cp = new CSVPrinter(fw, CSVFormat.DEFAULT);
			System.out.println(trans.toString());
			cp.printRecord((Object[]) trans.toString().split(","));
			fw.flush();
			fw.close();
			cp.close();			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * this method is used to rewrite the csv file for all the pending transactions
	 * @param trans
	 */
	public void rewriteCSV(List<UserStockTransaction> trans){
		try{
			
			filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
			File f = new File(filePath);
			
			FileWriter fw = new FileWriter(f);			
			CSVPrinter cp = new CSVPrinter(fw, CSVFormat.DEFAULT);
			System.out.println(trans.toString());
			cp.printRecord((Object[]) trans.toString().split(","));
			fw.flush();
			fw.close();
			cp.close();			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
}
