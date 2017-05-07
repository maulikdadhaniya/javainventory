package com.minimouse.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.minimouse.model.AddNewAdmin;

public class MailService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	public AddNewAdmin findByEmail(String email) {
		AddNewAdmin m = null;
		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			Query q = session.createQuery("FROM AddNewAdmin where email='" + email + "'");
			m = (AddNewAdmin) q.uniqueResult();
			t.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
}
