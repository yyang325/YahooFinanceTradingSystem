package com.mercury.daos.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.mercury.beans.Stock;
import com.mercury.daos.StockDao;

@Repository
public class StockDaoImpl implements StockDao {
	private HibernateTemplate template;
	@Autowired
	public void setHibernateTemplate(HibernateTemplate template){
		this.template = template;
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
		String sql = "select * from yfts_stock where symbol = ?";
		Object[] params = {symbol};
		@SuppressWarnings("unchecked")
		List<Stock> list = template.find(sql, params);
		System.out.println(list.get(0));
		return list.get(0);
	}

	@Override
	public List<Stock> queryAllStocks() {
		// TODO Auto-generated method stub
		String hql = "from yfts_stock";
		@SuppressWarnings("unchecked")
		List<Stock> list = template.find(hql);
		return list;
	}

}
