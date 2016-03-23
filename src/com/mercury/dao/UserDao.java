package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Stock;
import com.mercury.beans.User;

public interface UserDao {
	public void save(User user);
	public void update(User user);
	public void delete(User user);
	public User findByUid(int uid);
	public User findByUserName(String userName);
	//public User findByUser(User user);    //there's no point of writing this method
	public List<User> queryAll();
	public User findByEmail(String email);
	//public List<User> findHolders(Stock stock);
}
