package com.mercury.daos.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.beans.UserStockTransaction;
import com.mercury.daos.UserStockTransactionDao;

@Repository
public class UserStockTransactionDaoImpl implements UserStockTransactionDao {
	private HibernateTemplate template;
	
	@Autowired
	public void setHibernateTemplate(SessionFactory sessionFactory){
		template = new HibernateTemplate(sessionFactory);
	}
	
	@Override
	public void save(UserStockTransaction tran) {
		// TODO Auto-generated method stub
		template.save(tran);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserStockTransaction> queryAll() {
		// TODO Auto-generated method stub
		String hql = "from UserStockTransaction";
		return template.find(hql);
	}

	@Override
	public List<User> queryUserBySymbol(String symbol) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Stock> stocks = template.find("FROM Stock s WHERE s.symbol = ?", symbol);
		int stock_id = (int) stocks.get(0).getSid();
		return queryUserByStockId(stock_id);
	}

	@Override
	public List<User> queryUserByStockId(int stockId) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		List<UserStockTransaction> trans = template.find("FROM UserStockTransaction t WHERE t.stock.sid = ?", stockId);
		System.out.println(trans);
		List<User> users = new ArrayList<>();
		for(UserStockTransaction tran: trans){
			users.add(tran.getUser());
		}
		return users;
	}

	@Override
	public List<Stock> queryStockByUsername(String username) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<User> users = template.find("FROM User user WHERE user.username = ?", username);
		int user_id = (int) users.get(0).getUid();
		return queryStockByUserId(user_id);
	}

	@Override
	public List<Stock> queryStockByEmail(String email) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<User> users = template.find("FROM User user WHERE user.email = ?", email);
		int user_id = (int) users.get(0).getUid();
		return queryStockByUserId(user_id);
	}

	@Override
	public List<Stock> queryStockByUserId(int userId) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<UserStockTransaction> trans = template.find("FROM UserStockTransaction t WHERE t.user.uid = ?", userId);
		List<Stock> stocks = new ArrayList<>();
		for(UserStockTransaction tran: trans){
			stocks.add(tran.getStock());
		}
		return stocks;
	}

}
