package com.mercury.test;

import static org.junit.Assert.*;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.util.HibernateUtil;

public class TestUserStockTransaction {
	private Session session;
	private Transaction tx;
	@Before
	public void setUp() throws Exception {
		session = HibernateUtil.currentSession();
		tx = session.beginTransaction();
	}

	@After
	public void tearDown() throws Exception {
		HibernateUtil.closeSession();
	}

	@Test
	public void test() {
		try{
			User user1 = new User("Bob325", "asdfuinjj", "bob325@gmail.com", "Bob", "Bruce", 100000, 100000, "USER", 1);
			User user2 = new User("Frank", "7302jejklm", "frank@gmail.com", "Frank", "Curry", 320000, 320000, "USER", 1);
			Stock stock1 = new Stock("APPL", "Apple is amazing company.");
			Stock stock2 = new Stock("GOOG", "Google is crazy company");
			
			UserStockTransaction trans1 = new UserStockTransaction();
			trans1.setPrice(56);
			trans1.setQuantity(25);
			trans1.setStock(stock1);
			trans1.setTs(new Date());
			trans1.setUser(user1);
			session.save(trans1);
			
			
			UserStockTransaction trans2 = new UserStockTransaction();
			trans2.setPrice(89);
			trans2.setQuantity(43);
			trans2.setStock(stock2);
			trans2.setTs(new Date());
			trans2.setUser(user1);
			session.save(trans2);
			
			
			UserStockTransaction trans3 = new UserStockTransaction();
			trans3.setPrice(91);
			trans3.setQuantity(36);
			trans3.setStock(stock2);
			trans3.setTs(new Date());
			trans3.setUser(user1);
			session.save(trans3);
			
			
			
			UserStockTransaction trans4 = new UserStockTransaction();
			trans4.setPrice(55);
			trans4.setQuantity(101);
			trans4.setStock(stock1);
			trans4.setTs(new Date());
			trans4.setUser(user2);
			session.save(trans4);
			
			tx.commit();
			
			UserStockTransaction testTran1 = (UserStockTransaction)session.load(UserStockTransaction.class, trans1.getTid());
			UserStockTransaction testTran2 = (UserStockTransaction)session.load(UserStockTransaction.class, trans2.getTid());
			UserStockTransaction testTran3 = (UserStockTransaction)session.load(UserStockTransaction.class, trans3.getTid());
			UserStockTransaction testTran4 = (UserStockTransaction)session.load(UserStockTransaction.class, trans4.getTid());
			
			User testUser1 = (User)session.load(User.class, user1.getUid());
			User testUser2 = (User)session.load(User.class, user2.getUid());
			
			Stock testStock1 = (Stock)session.load(Stock.class, stock1.getSid());
			Stock testStock2 = (Stock)session.load(Stock.class, stock2.getSid());
			
			assertSame(testUser1.getUid(), testTran1.getUser().getUid());
			assertSame(testStock1.getSid(), testTran1.getStock().getSid());
			
			assertSame(testUser1.getUid(), testTran2.getUser().getUid());
			assertSame(testStock2.getSid(), testTran2.getStock().getSid());
			
			assertSame(testUser1.getUid(), testTran3.getUser().getUid());
			assertSame(testStock2.getSid(), testTran3.getStock().getSid());
			
			assertSame(testUser2.getUid(), testTran4.getUser().getUid());
			assertSame(testStock1.getSid(), testTran4.getStock().getSid());
			
			tx = session.beginTransaction();
			
			session.delete(trans1);
			session.delete(trans2);
			session.delete(trans3);
			session.delete(trans4);
			
			tx.commit();
			
		}catch(Exception e){
			System.err.println(e);
		}
	}

}
