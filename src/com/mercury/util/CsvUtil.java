package com.mercury.util;

import java.io.File;
import java.io.FileReader;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.omg.CORBA.portable.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	/**
	 * test readCSV() function
	 * @return
	 */
	public String readCSV(){
		StringBuffer sb = new StringBuffer();
		InputStream inputStream = null;
		try{
			System.out.println("In read CSV");
			
			String filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
			System.out.println(filePath);
			
			//inputStream = servletContext.getResourceAsStream("/WEB-INF/content/somecontent.txt");
			
			File f = new File(filePath);
			
			System.out.println(f.exists());
//			
//			if(f != null) System.out.println("read OK");
//			else System.out.println("read wrong");    
//			
			FileReader fr = new FileReader(f);
			CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
		   
		    //CSVParser parser = new CSVParser(null, null);
		    List<CSVRecord> l = parser.getRecords();
		    //List<CSVRecord> l = parser.getRecords();
			for (CSVRecord r:l){
				sb.append(r.get(0));
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
//	public List<Transaction> parseCSV(){
//		List<Transaction> list = new ArrayList<Transaction>();
//		try{
//		    
//			String filePath = servletContext.getRealPath("WEB-INF/csv/pending.csv");
//			
//			File f = new File(filePath);
//
//			FileReader fr = new FileReader(f);
//			CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
//		    
//		    
//			List<CSVRecord> l = parser.getRecords();
//			for (CSVRecord r:l){
//				Transaction ts = new Transaction();
////				ts.setUser(ud.findByUid(Integer.parseInt(r.get(0))));
////				ts.setStock(sd.findBySid(Integer.parseInt(r.get(1))));
////				ts.setAmount(Integer.parseInt(r.get(2)));
////				ts.setPrice(new BigDecimal(r.get(3)));
////				ts.setTs(Timestamp.valueOf(r.get(4)));
////				list.add(ts);
//			}
//			fr.close();
//			parser.close();
//			
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//		return list;
//	}
}
