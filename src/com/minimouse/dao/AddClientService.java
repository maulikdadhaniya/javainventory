package com.minimouse.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.minimouse.model.AddClient;

public class AddClientService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	public void insert(AddClient objClient) {
		try {
			Session s = factory.openSession();
			Transaction t = s.beginTransaction();
			s.save(objClient);
			t.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<AddClient> selectAll(){									//select and display
		List<AddClient> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();									
			Query qu = s.createQuery("from AddClient where status='A'");
			list = (ArrayList<AddClient>)qu.list();
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public AddClient selectById(int id){
		AddClient add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from AddClient where id = "+id+"");
				add = (AddClient) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	
	public AddClient selectByEmailId(String mail){
		AddClient add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from AddClient where email = '"+mail+"' ");
				add = (AddClient) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	public void delete(AddClient objClient) {														//delete
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		Query qu = s.createQuery("update AddClient set status='D' where id = "+objClient.getId()+"");
		qu.executeUpdate();
		tr.commit();
		s.close();
	}
	public void update(AddClient objClient) {														//edit
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		s.update(objClient);
		tr.commit();
		s.close();
	}
}


