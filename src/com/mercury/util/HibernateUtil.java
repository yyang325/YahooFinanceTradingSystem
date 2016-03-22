package com.mercury.util;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateUtil {
	private static final SessionFactory FACTORY;
	
	static{
		try{
			FACTORY = new AnnotationConfiguration().configure().buildSessionFactory();
		}catch(Exception e){
			throw new RuntimeException(e.getMessage(), e);
		}
	}
	
	private static final ThreadLocal<Session> SESSION = new ThreadLocal<Session>(){
		@Override
		protected Session initialValue(){
			return FACTORY.openSession();
		}
	};
	
	public static SessionFactory getSessionFactory(){
		return FACTORY;
	}
	
	public static Session currentSession() throws HibernateException{
		Session s = SESSION.get();
		if(s == null){
			s = FACTORY.openSession();
			SESSION.set(s);
		}
		return s;
	}
	
	public static void closeSession() throws HibernateException{
		Session s = SESSION.get();
		SESSION.set(null);
		if(s != null) s.close();
	}
	
}
