package com.mercury.daos.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Stock;
import com.mercury.daos.StockDao;

public class StockDaoImpl implements StockDao {
	private HibernateTemplate template;
	
	public void setHibernateTemplate(HibernateTemplate template){
		this.template = template;
	}

	@Override
	public void save(Stock stock) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Stock stock) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Stock stock) {
		// TODO Auto-generated method stub

	}

	@Override
	public Stock findBySymbol(String symbol) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Stock> queryAllStocks() {
		// TODO Auto-generated method stub
		return null;
	}

}
