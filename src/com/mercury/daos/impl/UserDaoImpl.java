package com.mercury.daos.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.mercury.beans.User;
import com.mercury.daos.UserDao;

/**
 * 
 * @author Ethan
 * Dao implementation for user related operations
 */
@Repository
public class UserDaoImpl implements UserDao {
	
	private HibernateTemplate template;
	

	@Autowired
    @Qualifier("sessionFactory")
	public void setSessionFactory(SessionFactory factory){
		template = new HibernateTemplate(factory);
	}

	/**
	 * save a user
	 * @param user
	 */
	@Override
	public void save(User user) {
		template.save(user);
	}

	/**
	 * update a user
	 * @param user
	 */
	@Override
	public void update(User user) {
		template.update(user);
	}
	
	/**
	 * delete a user
	 * @param user
	 */
	@Override
	public void delete(User user) {
		template.delete(user);
	}

	/**
	 * 
	 * @param uid  --  user's id, it's primary key
	 * @return   -- a user
	 */
	@Override
	public User findByUid(int uid) {
		return (User) template.get(User.class, uid);
	}

	/**
	 * query a user by its username
	 * @param userName  -- user's userName
	 * @return    		-- a user
	 */
	@SuppressWarnings("unchecked")
	@Override
	public User findByUserName(String userName) {
		List<User> users = template.find("FROM User user WHERE user.username = ?", userName);
		if (users.size() == 0) return null;
		return users.get(0);
	}

	
	//@Override
	//public User findByUser(User user) {
	//	return null;
	//}
	
	/**
	 * query all users
	 * @return     -- a list of all users
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryAll() {
		return template.find("FROM User");
	}

	/**
	 * query a user by its email
	 * @param email  -- user's email
	 * @return       -- a user
	 */
	@SuppressWarnings("unchecked")
	@Override
	public User findByEmail(String email) {
		List<User> users = template.find("FROM User user WHERE user.email = ?", email);
		if (users.size() == 0) return null;
		return users.get(0);
	}

	
	//@Override
	//public List<User> findHolders(Stock stock) {
	//	// TODO Auto-generated method stub
	//	return null;
	//}

}
