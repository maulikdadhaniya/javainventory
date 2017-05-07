package com.minimouse.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.minimouse.model.Employee;
import com.minimouse.model.ProductCategory;



public class ProductCategoryService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	public void insert(ProductCategory objPc) {											//insert
		 Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         session.save(objPc);
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
	public Integer addEmployee(String fname, String lname, int salary){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      Integer employeeID = null;
	      try{
	         tx = session.beginTransaction();
	         Employee employee = new Employee(fname, lname, salary);
	         employeeID = (Integer) session.save(employee); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	      return employeeID;
	  }
	
	@SuppressWarnings("unchecked")
	public List<ProductCategory> selectAll(){									//select and display
		List<ProductCategory> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();									
			Query qu = s.createQuery("from ProductCategory where status='A'");
			list = (ArrayList<ProductCategory>)qu.list();
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ProductCategory selectById(int id){
		ProductCategory add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from ProductCategory where id = "+id+"");
				add = (ProductCategory) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	
	public void delete(ProductCategory pc) {														//delete
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		Query qu = s.createQuery("update ProductCategory set status='D' where id = "+pc.getId()+"");
		qu.executeUpdate();
		tr.commit();
		s.close();
	}
	
	public void update(ProductCategory p) {														//edit
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		s.update(p);
		tr.commit();
		s.close();
	}


}
