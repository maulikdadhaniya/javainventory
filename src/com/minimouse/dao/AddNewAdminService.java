package com.minimouse.dao;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.minimouse.model.AddNewAdmin;

public class AddNewAdminService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	public void insert(AddNewAdmin objAdmin) {
		
		 Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         session.save(objAdmin);
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
	
	@SuppressWarnings("unchecked")
	public List<AddNewAdmin> selectAll(){
		List<AddNewAdmin> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();
			Query qu = s.createQuery("from AddNewAdmin where status='A'");
			list = (ArrayList<AddNewAdmin>)qu.list();
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<AddNewAdmin> findByAdmin(int id) {
		List<AddNewAdmin> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();
			Query qu = s.createQuery("from AddNewAdmin where id="+id+" ");
			list = (ArrayList<AddNewAdmin>)qu.list();
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public AddNewAdmin selectById(int id){
		AddNewAdmin add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from AddNewAdmin where id = "+id+"");
				add = (AddNewAdmin) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	
	public AddNewAdmin selectByEmailId(String mail){
		AddNewAdmin add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from AddNewAdmin where email = '"+mail+"' "+"and status='A' ");
				add = (AddNewAdmin) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	public void delete(AddNewAdmin objAdmin) {														//delete
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		Query qu = s.createQuery("update AddNewAdmin set status='D' where id = "+objAdmin.getId()+"");
		qu.executeUpdate();
		tr.commit();
		s.close();
	}
	public void update(AddNewAdmin objAdmin) {														//edit
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		s.update(objAdmin);
		tr.commit();
		s.close();
	}

	public AddNewAdmin findByEmail(String email) {
		AddNewAdmin m = null;
		try {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			Query q = session.createQuery("FROM Mail where email='" + email + "'");
			m = (AddNewAdmin) q.uniqueResult();
			t.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	public void changePassword(String password,int id){
		try {
			Session change = HibernateUtilities.getSessionFactory().openSession();
			Transaction t = change.beginTransaction();
			Query q = change.createQuery("update AddNewAdmin set password=:p where id=:i");
			q.setParameter("p", password);
			q.setParameter("i", id);
			q.executeUpdate();
			t.commit();
			change.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
			// Admin Password Change Details
			public boolean oldPasswordMatch(int id,String password){
			AddNewAdmin admin = selectById(id);
			if(admin!=null && admin.getPassword().equals(password)){
				return true;
			}
			else{
				return false;
			}
		}

}
