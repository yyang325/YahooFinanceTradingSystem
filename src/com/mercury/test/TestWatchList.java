package com.mercury.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.util.HibernateUtil;

public class TestWatchList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		
		User user1 = new User("Bob325", "asdfuinjj", "bob325@gmail.com", "Bob", "Bruce", 100000, 100000, "USER", 1);
		User user2 = new User("Frank", "7302jejklm", "frank@gmail.com", "Frank", "Curry", 320000, 320000, "USER", 1);
		Stock stock1 = new Stock("APPL", "Apple is amazing company.");
		Stock stock2 = new Stock("GOOG", "Google is crazy company");
		user1.addWatchedStock(stock1);
		user2.addWatchedStock(stock1);
		user2.addWatchedStock(stock2);
		session.save(user1);
		session.save(user2);
		
		tx.commit();
		HibernateUtil.closeSession();
	}

}
