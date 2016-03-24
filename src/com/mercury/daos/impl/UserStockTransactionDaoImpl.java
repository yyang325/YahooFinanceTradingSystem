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
		System.out.println("query all transaction");
		String hql = "from UserStockTransaction";
		return template.find(hql);
	}

	@Override
	public List<User> queryUserBySymbol(String symbol) {
		// TODO Auto-generated method stub
		String sql = "select stock_id from yfts_stock where symbol = ?";
		Object[] params = {symbol};
		int stock_id = (int) template.find(sql, params).get(0);
		return queryUserByStockId(stock_id);
	}

	@Override
	public List<User> queryUserByStockId(int stockId) {
		// TODO Auto-generated method stub
		String sql = "select distinct user_id from yfts_trans where stock_id = ?";
		Object[] params = {stockId};
		@SuppressWarnings("unchecked")
		List<Integer> uidList = template.find(sql, params);
		if(uidList.size() < 1) return null;
		List<User> users = new ArrayList<>();
		for(int uid : uidList){
			User user = template.get(User.class, uid);
			users.add(user);
		}
		return users;
	}

	@Override
	public List<Stock> queryStockByUsername(String username) {
		// TODO Auto-generated method stub
		String sql = "select user_id from yfts_user where username = ?";
		Object[] params = {username};
		int user_id = (int) template.find(sql, params).get(0);
		return queryStockByUserId(user_id);
	}

	@Override
	public List<Stock> queryStockByEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select user_id from yfts_user where email = ?";
		Object[] params = {email};
		int user_id = (int) template.find(sql, params).get(0);
		return queryStockByUserId(user_id);
	}

	@Override
	public List<Stock> queryStockByUserId(int userId) {
		// TODO Auto-generated method stub
		String sql = "select distinct stock_id from yfts_trans where user_id = ?";
		Object[] params = {userId};
		@SuppressWarnings("unchecked")
		List<Integer> sidList = template.find(sql, params);
		if(sidList.size() < 1) return null;
		List<Stock> stocks = new ArrayList<>();
		for(int sid : sidList){
			Stock stock = template.get(Stock.class, sid);
			stocks.add(stock);
		}
		return stocks;
	}

}
