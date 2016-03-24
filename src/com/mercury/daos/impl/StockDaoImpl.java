package com.mercury.daos.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.mercury.beans.Stock;
import com.mercury.daos.StockDao;

@Repository
public class StockDaoImpl implements StockDao {
	private HibernateTemplate template;
	@Autowired
	public void setHibernateTemplate(SessionFactory sessionFactory){
		this.template = new HibernateTemplate(sessionFactory);
	}

	@Override
	public void save(Stock stock) {
		// TODO Auto-generated method stub
		template.save(stock);
	}

	@Override
	public void delete(Stock stock) {
		// TODO Auto-generated method stub
		template.delete(stock);
	}

	@Override
	public void update(Stock stock) {
		// TODO Auto-generated method stub
		template.update(stock);
	}

	@Override
	public Stock findBySymbol(String symbol) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Stock> stocks = template.find("FROM Stock s WHERE s.symbol = ?", symbol);
		return stocks.get(0);
	}
	
	@Override
	public Stock findByStockId(int stock_id){
		return template.get(Stock.class, stock_id);
	}

	@Override
	public List<Stock> queryAllStocks() {
		// TODO Auto-generated method stub
		String hql = "from Stock";
		@SuppressWarnings("unchecked")
		List<Stock> list = template.find(hql);
		return list;
	}

}
